package it.comunecanistro.parlo_io.services;

import it.comunecanistro.parlo_io.data_model.dtos.WeatherWarningDto;
import it.comunecanistro.parlo_io.data_model.entities.WeatherWarning;
import org.springframework.data.domain.Page;

public interface IWeatherWarning {

    WeatherWarningDto create(WeatherWarningDto weatherWarningDto);

    Page<WeatherWarning> readAll(int page);

}
