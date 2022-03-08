package it.comunecanistro.parlo_io.data_model.dtos;

import it.comunecanistro.parlo_io.enums.SeverityLevels;
import lombok.Data;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;

@Data
@ToString
public class WeatherWarningDto {

    @NotBlank
    private String title;

    @NotNull
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date eventDate;

    @NotBlank
    @Size(min = 80, max = 10000)
    private String body;

    private SeverityLevels severity;

}
