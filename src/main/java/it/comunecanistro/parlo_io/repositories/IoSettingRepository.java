package it.comunecanistro.parlo_io.repositories;

import it.comunecanistro.parlo_io.data_model.entities.IoService;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IoSettingRepository extends JpaRepository<IoService, Integer> {

    IoService findFirstByOrderByRegistrationDateDesc();

}
