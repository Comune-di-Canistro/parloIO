package it.comunecanistro.parlo_io.services.impl;

import it.comunecanistro.parlo_io.data_model.dtos.IoFiscalCodeCheckResponseDto;
import it.comunecanistro.parlo_io.data_model.dtos.IoMessageResponseDto;
import it.comunecanistro.parlo_io.data_model.dtos.IoServiceDto;
import it.comunecanistro.parlo_io.data_model.dtos.messages.IoFiscalCodeCheckDto;
import it.comunecanistro.parlo_io.data_model.dtos.messages.IoMessageDto;
import it.comunecanistro.parlo_io.data_model.entities.User;
import it.comunecanistro.parlo_io.services.IIoSetting;
import it.comunecanistro.parlo_io.services.NotificationSender;
import it.comunecanistro.parlo_io.services.feign.IoServiceFeignClient;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.Objects;
import java.util.concurrent.atomic.AtomicInteger;

@Service
@Slf4j
public class IoNotificationSender implements NotificationSender<IoMessageDto> {

    private final IIoSetting ioSetting;

    private final IoServiceFeignClient ioServiceFeignClient;

    private final UserService userService;

    public IoNotificationSender(IIoSetting ioSetting, IoServiceFeignClient ioServiceFeignClient, UserService userService) {
        this.ioSetting = ioSetting;
        this.ioServiceFeignClient = ioServiceFeignClient;
        this.userService = userService;
    }

    @Override
    public int send(IoMessageDto messageDto) {
        IoServiceDto ioServiceDto = ioSetting.read();

        if (ioServiceDto == null) {
            log.error("IO Settings are required!");
            return -1;
        }

        AtomicInteger count = new AtomicInteger();
        int page = 0;
        Page<User> userPage = userService.readAll(page);

        do {

            boolean hasNext = userPage.hasNext();
            userPage.getContent().stream().map(User::getFiscalCode).forEach(fiscalCode -> {

                try {

                    ResponseEntity<IoFiscalCodeCheckResponseDto> check = ioServiceFeignClient.check(
                            IoFiscalCodeCheckDto.builder().fiscalCode(fiscalCode).build(),
                            ioServiceDto.getPrimaryKey()
                    );

                    if (check.getStatusCodeValue() == HttpStatus.OK.value() && Objects.requireNonNull(check.getBody()).isSenderAllowed()) {
                        ResponseEntity<IoMessageResponseDto> response = ioServiceFeignClient.send(fiscalCode, messageDto, ioServiceDto.getPrimaryKey());
                        if (response.getStatusCodeValue() == HttpStatus.CREATED.value()) count.getAndIncrement();
                    }

                } catch (Exception e) {
                    log.error(e.getMessage());
                }

            });

            if (hasNext) {
                userPage = userService.readAll(++page);
            } else {
                break;
            }

        } while (true);

        return count.get();

    }

}
