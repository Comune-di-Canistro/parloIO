package it.comunecanistro.parlo_io.data_model.dtos.messages;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TelegramMessageDto extends AbstractMessageDto {

    @NotBlank
    private String message;

}
