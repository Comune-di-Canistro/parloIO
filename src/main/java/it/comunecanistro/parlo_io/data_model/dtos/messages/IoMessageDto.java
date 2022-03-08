package it.comunecanistro.parlo_io.data_model.dtos.messages;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class IoMessageDto extends AbstractMessageDto {

    private IoMessageContentDto content;

}
