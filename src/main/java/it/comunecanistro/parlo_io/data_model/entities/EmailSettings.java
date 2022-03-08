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
public class EmailSettings {

    @Id
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "seq_email_settings"
    )
    @SequenceGenerator(
            name = "seq_email_settings",
            allocationSize = 1
    )
    private Integer id;

    private String fromAddress;

    private String username;

    private String password;

    private String host;

    private int port;

    private String protocol;

    @Temporal(TemporalType.TIMESTAMP)
    private Date registrationDate;

}
