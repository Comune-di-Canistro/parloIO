package it.comunecanistro.parlo_io.services.feign;

import it.comunecanistro.parlo_io.data_model.dtos.IoFiscalCodeCheckResponseDto;
import it.comunecanistro.parlo_io.data_model.dtos.IoMessageResponseDto;
import it.comunecanistro.parlo_io.data_model.dtos.messages.IoFiscalCodeCheckDto;
import it.comunecanistro.parlo_io.data_model.dtos.messages.IoMessageDto;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@FeignClient(value = "io-service-feign-client", url = "https://api.io.italia.it/api/v1")
public interface IoServiceFeignClient {

    /**
     * Permette l'invio di un messaggio a un determinato codice fiscale
     * @param fiscalCode codice fiscale dell'utente
     * @param message messaggio da inviare
     * @param subscriptionKey chiave primaria/secondaria del servizio rilasciata dal portale IO
     * @return {@code IoMessageResponseDto} contiene l'id {@code messageId} del messaggio inviato
     */
    @PostMapping(value = "/messages/{fiscalCode}")
    ResponseEntity<IoMessageResponseDto> send(@PathVariable String fiscalCode, @RequestBody IoMessageDto message, @RequestHeader("Ocp-Apim-Subscription-Key") String subscriptionKey);

    /**
     * Permette il controllo prima dell'invio di un messaggio a un determinato codice fiscale
     * @param fiscalCode codice fiscale dell'utente
     * @param message messaggio da inviare per il controllo del codice fiscale
     * @param subscriptionKey chiave primaria/secondaria del servizio rilasciata dal portale IO
     * @return {@code IoFiscalCodeCheckResponseDto} contiene il campo booleano; se true, allora posso inviare il messaggio
     */
    @PostMapping(value = "/profiles")
    ResponseEntity<IoFiscalCodeCheckResponseDto> check(@RequestBody IoFiscalCodeCheckDto message, @RequestHeader("Ocp-Apim-Subscription-Key") String subscriptionKey);

    /**
     * Permette il controllo dopo l'invio di un messaggio a un determinato codice fiscale
     * @param fiscalCode codice fiscale dell'utente
     * @param messageId contenuto in {@code IoMessageResponseDto}
     * @param subscriptionKey chiave primaria/secondaria del servizio rilasciata dal portale IO
     * @return
     */
    @GetMapping(value = "/messages/{fiscalCode}/{messageId}")
    ResponseEntity<?> check(@PathVariable String fiscalCode, @PathVariable String messageId, @RequestHeader("Ocp-Apim-Subscription-Key") String subscriptionKey);

}
