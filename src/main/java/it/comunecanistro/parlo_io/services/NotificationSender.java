package it.comunecanistro.parlo_io.services;

import it.comunecanistro.parlo_io.data_model.dtos.messages.AbstractMessageDto;

public interface NotificationSender<T extends AbstractMessageDto> {

    int send(T messageDto);

}
