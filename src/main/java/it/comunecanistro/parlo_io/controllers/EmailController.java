package it.comunecanistro.parlo_io.controllers;

import it.comunecanistro.parlo_io.configurations.SharedAttributes;
import it.comunecanistro.parlo_io.data_model.dtos.EmailSettingsDto;
import it.comunecanistro.parlo_io.enums.WebPages;
import it.comunecanistro.parlo_io.services.IEmailSettings;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@RestController
@RequestMapping("/email-settings")
public class EmailController {


    private final IEmailSettings emailSettingsService;

    public EmailController(IEmailSettings emailSettingsService) {
        this.emailSettingsService = emailSettingsService;
    }

    @PreAuthorize("hasAnyAuthority('ADMIN')")
    @GetMapping
    public ModelAndView emailSettings(Model model) {
        model.addAttribute(SharedAttributes.SIDEBAR_INDEX, WebPages.EMAIL_SETTINGS.getIndex());
        model.addAttribute("emailSetting", emailSettingsService.read());
        return new ModelAndView(WebPages.EMAIL_SETTINGS.getWebpage());
    }

    @PreAuthorize("hasAnyAuthority('ADMIN')")
    @PostMapping
    public ResponseEntity<?> emailSettings(@Valid @RequestBody EmailSettingsDto emailSettings) {
        return ResponseEntity.ok(emailSettingsService.create(emailSettings));
    }

}
