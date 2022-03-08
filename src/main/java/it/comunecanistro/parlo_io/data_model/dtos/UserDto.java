package it.comunecanistro.parlo_io.data_model.dtos;

import lombok.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Null;
import javax.validation.constraints.Size;
import java.util.Date;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class UserDto {

    @NotBlank
    @Size(min = 16, max = 16)
    private String fiscalCode;

    @NotBlank
    private String firstName;

    @NotBlank
    private String familyName;

    @Null
    private Date registrationDate;

}
