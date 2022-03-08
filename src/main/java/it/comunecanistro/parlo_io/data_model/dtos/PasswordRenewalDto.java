package it.comunecanistro.parlo_io.data_model.dtos;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PasswordRenewalDto {

    @NotBlank
    private String password;

    @NotBlank
    private String confirmPassword;

}
