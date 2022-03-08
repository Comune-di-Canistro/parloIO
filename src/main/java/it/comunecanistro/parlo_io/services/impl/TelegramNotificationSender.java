package it.comunecanistro.parlo_io.services.impl;

import it.comunecanistro.parlo_io.data_model.dtos.TelegramSettingsDto;
import it.comunecanistro.parlo_io.data_model.dtos.messages.TelegramMessageDto;
import it.comunecanistro.parlo_io.services.ITelegramSetting;
import it.comunecanistro.parlo_io.services.NotificationSender;
import it.comunecanistro.parlo_io.services.feign.TelegramServiceFeignClient;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class TelegramNotificationSender implements NotificationSender<TelegramMessageDto> {

    private final ITelegramSetting telegramSetting;

    private final TelegramServiceFeignClient feignClient;

    private final String PARSE_MODE = "HTML";

    public TelegramNotificationSender(ITelegramSetting telegramSetting, TelegramServiceFeignClient feignClient) {
        this.telegramSetting = telegramSetting;
        this.feignClient = feignClient;
    }

    @Override
    public int send(TelegramMessageDto messageDto) {
        TelegramSettingsDto settings = telegramSetting.read();

        if (settings == null) {
            log.error("Telegram Settings are required!");
            return -1;
        }

        try {
            ResponseEntity<?> response = feignClient.send(settings.getToken(), settings.getChatId(), messageDto.getMessage(), PARSE_MODE);
            if (response.getStatusCodeValue() == HttpStatus.OK.value()) log.info("Telegram notification sent!");
            else log.error("Something went wrong! :S");
            return 1;
        } catch (Exception e) {
            log.error(e.getMessage());
            return -1;
        }

    }

    private String sanitize(String message) {
        return null;
    }

}
