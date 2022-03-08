package it.comunecanistro.parlo_io.data_model.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class IoFiscalCodeCheckResponseDto {

    @JsonProperty("sender_allowed")
    private boolean senderAllowed;

}
