package it.comunecanistro.parlo_io.data_model.dtos.messages;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class IoFiscalCodeCheckDto {

    @JsonProperty("fiscal_code")
    private String fiscalCode;

}
