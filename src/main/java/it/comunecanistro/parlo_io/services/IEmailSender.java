package it.comunecanistro.parlo_io.services;

public interface IEmailSender {

    void send(String to, String subject, String message);

}
