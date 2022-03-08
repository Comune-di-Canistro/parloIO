package it.comunecanistro.parlo_io.services;

import it.comunecanistro.parlo_io.data_model.dtos.TelegramSettingsDto;

public interface ITelegramSetting {

    TelegramSettingsDto create(TelegramSettingsDto telegramSettings);

    TelegramSettingsDto read();

}
