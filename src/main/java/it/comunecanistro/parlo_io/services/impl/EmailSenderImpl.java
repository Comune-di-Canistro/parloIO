package it.comunecanistro.parlo_io.services.impl;

import it.comunecanistro.parlo_io.data_model.dtos.EmailSettingsDto;
import it.comunecanistro.parlo_io.services.IEmailSender;
import it.comunecanistro.parlo_io.services.IEmailSettings;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

@Service
public class EmailSenderImpl implements IEmailSender {

    private final IEmailSettings emailSettings;

    public EmailSenderImpl(IEmailSettings emailSettings) {
        this.emailSettings = emailSettings;
    }

    @Override
    public void send(String to, String subject, String message) {

        SimpleMailMessage smm = new SimpleMailMessage();

        EmailSettingsDto settings = emailSettings.read();

        smm.setFrom(settings.getFromAddress());
        smm.setTo(to);
        smm.setSubject(subject);
        smm.setText(message);

        JavaMailSender sender = configureMailSender(settings);
        if (sender != null)
            sender.send(smm);
    }

    private JavaMailSender configureMailSender(EmailSettingsDto settings) {

        if (settings == null) return null;

        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost(settings.getHost());
        mailSender.setPort(settings.getPort());

        mailSender.setUsername(settings.getUsername());
        mailSender.setPassword(settings.getPassword());
        mailSender.setProtocol(settings.getProtocol());

        return mailSender;

    }


}
