package it.comunecanistro.parlo_io.repositories;

import it.comunecanistro.parlo_io.data_model.entities.TelegramSetting;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TelegramSettingRepository extends JpaRepository<TelegramSetting, Integer> {

    TelegramSetting findFirstByOrderByRegistrationDateDesc();

}
