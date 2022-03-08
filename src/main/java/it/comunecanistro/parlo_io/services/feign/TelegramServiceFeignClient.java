package it.comunecanistro.parlo_io.services.feign;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(value = "telegram-service-feign-client", url = "https://api.telegram.org")
public interface TelegramServiceFeignClient {


    /**
     * Permette l'invio di un messaggio a un determinato canale Telegram
     *
     * @param token     Token del bot Telegram
     * @param chatId    id del canale
     * @param text      Testo del messaggio
     * @param parseMode modalità di parsing
     * @return
     */
    @GetMapping(value = "/bot{token}/sendMessage")
    ResponseEntity<?> send(@PathVariable String token,
                           @RequestParam("chat_id") String chatId,
                           @RequestParam String text,
                           @RequestParam("parse_mode") String parseMode);
}
