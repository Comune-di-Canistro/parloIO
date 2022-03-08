package it.comunecanistro.parlo_io.services.impl;

import it.comunecanistro.parlo_io.data_model.dtos.TelegramSettingsDto;
import it.comunecanistro.parlo_io.data_model.entities.TelegramSetting;
import it.comunecanistro.parlo_io.repositories.TelegramSettingRepository;
import it.comunecanistro.parlo_io.services.ITelegramSetting;
import org.modelmapper.ModelMapper;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class TelegramSettingService implements ITelegramSetting {

    private final TelegramSettingRepository telegramSettingRepository;
    private final ModelMapper modelMapper;

    public TelegramSettingService(TelegramSettingRepository telegramSettingRepository, ModelMapper modelMapper) {
        this.telegramSettingRepository = telegramSettingRepository;
        this.modelMapper = modelMapper;
    }

    @Override
    public TelegramSettingsDto create(TelegramSettingsDto telegramSettings) {
        TelegramSetting.TelegramSettingBuilder builder = TelegramSetting.builder()
                .token(telegramSettings.getToken())
                .chatId(telegramSettings.getChatId())
                .registrationDate(new Date());
        return modelMapper.map(telegramSettingRepository.save(builder.build()), TelegramSettingsDto.class);
    }

    @Nullable
    @Override
    public TelegramSettingsDto read() {
        TelegramSetting telegramSetting = telegramSettingRepository.findFirstByOrderByRegistrationDateDesc();
        return telegramSetting == null ? null : modelMapper.map(telegramSetting, TelegramSettingsDto.class);
    }

}
