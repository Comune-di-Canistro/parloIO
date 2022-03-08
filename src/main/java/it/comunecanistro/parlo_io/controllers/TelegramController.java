package it.comunecanistro.parlo_io.controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import it.comunecanistro.parlo_io.configurations.SharedAttributes;
import it.comunecanistro.parlo_io.data_model.dtos.TelegramSettingsDto;
import it.comunecanistro.parlo_io.data_model.dtos.messages.TelegramMessageDto;
import it.comunecanistro.parlo_io.enums.WebPages;
import it.comunecanistro.parlo_io.services.ITelegramSetting;
import it.comunecanistro.parlo_io.services.NotificationSender;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;


@RestController
@RequestMapping("/telegram")
public class TelegramController {

    private final ITelegramSetting iTelegramSetting;

    private final NotificationSender<TelegramMessageDto> notificationSender;

    public TelegramController(ITelegramSetting iTelegramSetting, NotificationSender<TelegramMessageDto> notificationSender) {
        this.iTelegramSetting = iTelegramSetting;
        this.notificationSender = notificationSender;
    }

    @PreAuthorize("hasAnyAuthority('ADMIN')")
    @GetMapping("/settings")
    public ModelAndView read(Model model) throws JsonProcessingException {
        model.addAttribute(SharedAttributes.SIDEBAR_INDEX, WebPages.TELEGRAM_SETTING.getIndex());
        model.addAttribute("telegramSetting", iTelegramSetting.read());
        return new ModelAndView(WebPages.TELEGRAM_SETTING.getWebpage());
    }

    @PreAuthorize("hasAnyAuthority('ADMIN')")
    @PostMapping("/settings")
    public ResponseEntity<TelegramSettingsDto> upsert(@Valid @RequestBody TelegramSettingsDto telegramSettingsDto, Model model) {
        return ResponseEntity.ok(iTelegramSetting.create(telegramSettingsDto));
    }

    @PreAuthorize("hasAnyAuthority('ADMIN') or hasAnyAuthority('OPERATOR')")
    @PostMapping("/send")
    public ResponseEntity<?> send(@Valid @RequestBody TelegramMessageDto message) {
        return ResponseEntity.ok(notificationSender.send(message));
    }

    @PreAuthorize("hasAnyAuthority('ADMIN') or hasAnyAuthority('OPERATOR')")
    @GetMapping("/view")
    public ModelAndView telegram(Model model) {
        model.addAttribute(SharedAttributes.SIDEBAR_INDEX, WebPages.TELEGRAM.getIndex());
        return new ModelAndView(WebPages.TELEGRAM.getWebpage());
    }

}
