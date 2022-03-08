package it.comunecanistro.parlo_io.data_model.entities;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.Date;

@Entity
@Getter
@Setter
@ToString
public class User {

    @Id
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "seq_users"
    )
    @SequenceGenerator(
            name = "seq_users",
            allocationSize = 1
    )
    private Integer id;

    private String fiscalCode;

    private String firstName;

    private String familyName;

    @Temporal(TemporalType.TIMESTAMP)
    private Date registrationDate;

}
