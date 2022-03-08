package it.comunecanistro.parlo_io.services.impl;

import it.comunecanistro.parlo_io.data_model.dtos.EmailSettingsDto;
import it.comunecanistro.parlo_io.data_model.entities.EmailSettings;
import it.comunecanistro.parlo_io.repositories.EmailSettingRepository;
import it.comunecanistro.parlo_io.services.IEmailSettings;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class EmailSettingsService implements IEmailSettings {

    private final EmailSettingRepository emailSettingRepository;

    private final ModelMapper modelMapper;


    public EmailSettingsService(EmailSettingRepository emailSettingRepository, ModelMapper modelMapper) {
        this.emailSettingRepository = emailSettingRepository;
        this.modelMapper = modelMapper;
    }

    @Override
    public EmailSettingsDto create(EmailSettingsDto emailSettings) {
        EmailSettings emailSettingsEntity = EmailSettings.builder()
                .fromAddress(emailSettings.getFromAddress())
                .username(emailSettings.getUsername())
                .password(emailSettings.getPassword())
                .host(emailSettings.getHost())
                .port(emailSettings.getPort())
                .protocol(emailSettings.getHost().split("\\.")[0])
                .registrationDate(new Date())
                .build();

        return modelMapper.map(emailSettingRepository.save(emailSettingsEntity), EmailSettingsDto.class);
    }

    @Override
    public EmailSettingsDto read() {
        EmailSettings emailSettings = emailSettingRepository.findFirstByOrderByRegistrationDateDesc();
        return emailSettings == null ? null : modelMapper.map(emailSettings, EmailSettingsDto.class);
    }

}
