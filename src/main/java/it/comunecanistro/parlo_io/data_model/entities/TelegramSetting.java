package it.comunecanistro.parlo_io.data_model.entities;

import lombok.*;

import javax.persistence.*;
import java.util.Date;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Entity
public class TelegramSetting {

    @Id
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "seq_telegram_settings"
    )
    @SequenceGenerator(
            name = "seq_telegram_settings",
            allocationSize = 1
    )
    private Integer id;

    private String token;

    private String chatId;

    @Temporal(TemporalType.TIMESTAMP)
    private Date registrationDate;


}
