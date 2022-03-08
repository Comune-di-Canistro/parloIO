package it.comunecanistro.parlo_io.data_model.dtos;

import lombok.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class AdminUserDto {

    private Integer id;

    @NotBlank
    @Size(min = 16, max = 16)
    private String username;

    @NotBlank
    private String firstName;

    @NotBlank
    private String familyName;

    private String role;

    @NotBlank
    private String email;

    @NotBlank
    private String confirmationEmail;

    private Boolean enabled;

}
