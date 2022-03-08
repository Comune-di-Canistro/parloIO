package it.comunecanistro.parlo_io.data_model.dtos;

import lombok.Data;
import lombok.ToString;

import javax.validation.constraints.NotBlank;
import java.util.Date;

@Data
@ToString
public class IoServiceDto {

    private Integer id;

    @NotBlank
    private String identifier;

    @NotBlank
    private String primaryKey;

    @NotBlank
    private String secondaryKey;

    private Date registrationDate;

}
