package it.comunecanistro.parlo_io.data_model.dtos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class EmailSettingsDto {

    @NotBlank
    private String fromAddress;

    @NotBlank
    private String username;

    @NotBlank
    private String password;

    @NotBlank
    private String host;

    @NotNull
    private Integer port;

    private String protocol;

    private Date registrationDate;

}
