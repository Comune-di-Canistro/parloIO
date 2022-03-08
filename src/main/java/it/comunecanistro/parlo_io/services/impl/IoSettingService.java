package it.comunecanistro.parlo_io.services.impl;

import it.comunecanistro.parlo_io.data_model.dtos.IoServiceDto;
import it.comunecanistro.parlo_io.data_model.entities.IoService;
import it.comunecanistro.parlo_io.repositories.IoSettingRepository;
import it.comunecanistro.parlo_io.services.IIoSetting;
import org.modelmapper.ModelMapper;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class IoSettingService implements IIoSetting {

    private final IoSettingRepository ioSettingRepository;
    private final ModelMapper modelMapper;

    public IoSettingService(IoSettingRepository ioSettingRepository, ModelMapper modelMapper) {
        this.ioSettingRepository = ioSettingRepository;
        this.modelMapper = modelMapper;
    }

    @Override
    public IoServiceDto create(IoServiceDto ioService) {
        IoService.IoServiceBuilder ioServiceBuilder = IoService
                .builder()
                .identifier(ioService.getIdentifier().toUpperCase())
                .primaryKey(ioService.getPrimaryKey())
                .secondaryKey(ioService.getSecondaryKey())
                .registrationDate(new Date());

        return modelMapper.map(ioSettingRepository.save(ioServiceBuilder.build()), IoServiceDto.class);
    }

    @Nullable
    @Override
    public IoServiceDto read() {
        IoService ioService = ioSettingRepository.findFirstByOrderByRegistrationDateDesc();
        return ioService == null ? null : modelMapper.map(ioService, IoServiceDto.class);
    }


}
