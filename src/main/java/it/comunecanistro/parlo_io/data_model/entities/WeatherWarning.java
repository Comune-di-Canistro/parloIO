package it.comunecanistro.parlo_io.data_model.entities;

import it.comunecanistro.parlo_io.enums.SeverityLevels;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Getter
@Setter
@ToString
public class WeatherWarning {

    @Id
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "seq_weather_warnings"
    )
    @SequenceGenerator(
            name = "seq_weather_warnings",
            allocationSize = 1
    )
    private Integer id;

    private String title;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date eventDate;

    private String body;

    @Enumerated(EnumType.STRING)
    private SeverityLevels severity;

}
