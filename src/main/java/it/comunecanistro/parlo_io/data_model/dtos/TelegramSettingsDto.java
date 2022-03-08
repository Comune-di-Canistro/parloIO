package it.comunecanistro.parlo_io.data_model.dtos;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class TelegramSettingsDto {

    @NotBlank
    private String token;

    @NotBlank
    private String chatId;

    private Date registrationDate;

}
