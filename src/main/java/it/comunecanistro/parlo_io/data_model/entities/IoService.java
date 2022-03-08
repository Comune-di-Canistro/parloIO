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
public class IoService {

    @Id
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "seq_settings"
    )
    @SequenceGenerator(
            name = "seq_settings",
            allocationSize = 1
    )
    private Integer id;

    private String identifier;

    private String primaryKey;

    private String secondaryKey;

    @Temporal(TemporalType.TIMESTAMP)
    private Date registrationDate;


}
