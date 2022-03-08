package it.comunecanistro.parlo_io.services;

import it.comunecanistro.parlo_io.data_model.dtos.EmailSettingsDto;

public interface IEmailSettings {

    EmailSettingsDto create(EmailSettingsDto telegramSettings);

    EmailSettingsDto read();

}
