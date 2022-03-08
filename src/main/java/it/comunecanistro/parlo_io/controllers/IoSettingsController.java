package it.comunecanistro.parlo_io.controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import it.comunecanistro.parlo_io.configurations.SharedAttributes;
import it.comunecanistro.parlo_io.data_model.dtos.IoServiceDto;
import it.comunecanistro.parlo_io.enums.WebPages;
import it.comunecanistro.parlo_io.services.IIoSetting;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@PreAuthorize("hasAnyAuthority('ADMIN')")
@RestController
@RequestMapping("/io-settings")
public class IoSettingsController {

    private final IIoSetting ioSettingService;

    public IoSettingsController(IIoSetting ioSettingService) {
        this.ioSettingService = ioSettingService;
    }

    @GetMapping
    public ModelAndView read(Model model) throws JsonProcessingException {
        model.addAttribute(SharedAttributes.SIDEBAR_INDEX, WebPages.IO_SETTING.getIndex());
        model.addAttribute("ioSetting", ioSettingService.read());
        return new ModelAndView(WebPages.IO_SETTING.getWebpage());
    }

    @PostMapping
    public ResponseEntity<IoServiceDto> upsert(@Valid @RequestBody IoServiceDto ioServiceDto, Model model) {
        return ResponseEntity.ok(ioSettingService.create(ioServiceDto));
    }

}
