package it.comunecanistro.parlo_io.repositories;

import it.comunecanistro.parlo_io.data_model.entities.EmailSettings;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmailSettingRepository extends JpaRepository<EmailSettings, Integer> {

    EmailSettings findFirstByOrderByRegistrationDateDesc();
}
