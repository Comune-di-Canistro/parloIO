package it.comunecanistro.parlo_io.services;

import it.comunecanistro.parlo_io.data_model.dtos.IoServiceDto;

public interface IIoSetting {

    IoServiceDto create(IoServiceDto ioService);

    IoServiceDto read();

}
