package it.comunecanistro.parlo_io.repositories;

import it.comunecanistro.parlo_io.data_model.entities.WeatherWarning;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WeatherWarningRepository extends PagingAndSortingRepository<WeatherWarning, Integer> {
}
