package it.comunecanistro.parlo_io.services.impl;

import it.comunecanistro.parlo_io.data_model.dtos.WeatherWarningDto;
import it.comunecanistro.parlo_io.data_model.dtos.messages.IoMessageContentDto;
import it.comunecanistro.parlo_io.data_model.dtos.messages.IoMessageDto;
import it.comunecanistro.parlo_io.data_model.entities.WeatherWarning;
import it.comunecanistro.parlo_io.repositories.WeatherWarningRepository;
import it.comunecanistro.parlo_io.services.IWeatherWarning;
import it.comunecanistro.parlo_io.services.NotificationSender;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

@Service
@Slf4j
public class WeatherWarningService implements IWeatherWarning {

    private final WeatherWarningRepository weatherWarningRepository;

    private final ModelMapper modelMapper;

    private final NotificationSender<IoMessageDto> sender;

    @Value("${page.size}")
    private int pageSize;

    public WeatherWarningService(WeatherWarningRepository weatherWarningRepository, ModelMapper modelMapper, NotificationSender<IoMessageDto> sender) {
        this.weatherWarningRepository = weatherWarningRepository;
        this.modelMapper = modelMapper;
        this.sender = sender;
    }

    @Override
    public WeatherWarningDto create(WeatherWarningDto weatherWarningDto) {
        WeatherWarning weatherWarning = modelMapper.map(weatherWarningDto, WeatherWarning.class);

        weatherWarning.setTitle(weatherWarning.getTitle().toUpperCase());

        Mono.fromCallable(() -> sender.send(IoMessageDto.builder().content(IoMessageContentDto.builder().subject(weatherWarning.getTitle()).markdown(weatherWarning.getBody()).build()).build()))
                .subscribeOn(
                        Schedulers.newParallel("io_sender", 10, true)
                ).subscribe(count -> log.info("MESSAGES SENT: {}", count));

        return modelMapper.map(weatherWarningRepository.save(weatherWarning), WeatherWarningDto.class);
    }

    @Override
    public Page<WeatherWarning> readAll(int page) {
        return weatherWarningRepository.findAll(PageRequest.of(page, pageSize));
    }

}
