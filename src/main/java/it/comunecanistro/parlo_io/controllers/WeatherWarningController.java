package it.comunecanistro.parlo_io.controllers;

import it.comunecanistro.parlo_io.configurations.SharedAttributes;
import it.comunecanistro.parlo_io.data_model.dtos.WeatherWarningDto;
import it.comunecanistro.parlo_io.enums.WebPages;
import it.comunecanistro.parlo_io.services.IWeatherWarning;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@RestController
@RequestMapping("/weather-warning")
@Slf4j
public class WeatherWarningController {

    private final IWeatherWarning iWeatherWarning;

    public WeatherWarningController(IWeatherWarning iWeatherWarning) {
        this.iWeatherWarning = iWeatherWarning;
    }

    @GetMapping
    public ModelAndView homepage(Model model) {
        model.addAttribute(SharedAttributes.SIDEBAR_INDEX, WebPages.HOMEPAGE.getIndex());
        return new ModelAndView(WebPages.HOMEPAGE.getWebpage());
    }

    @PostMapping
    public ResponseEntity<WeatherWarningDto> create(@Valid @RequestBody WeatherWarningDto weatherWarning) {
        return ResponseEntity.ok(iWeatherWarning.create(weatherWarning));
    }

    /**
     * TODO B: set pageable!
     *
     * @param model
     * @return
     */
    @GetMapping("/all/{page}")
    public ModelAndView weatherWarnings(@PathVariable int page, Model model) {
        model.addAttribute(SharedAttributes.SIDEBAR_INDEX, WebPages.WEATHER_WARNINGS.getIndex());
        model.addAttribute("weatherWarnings", iWeatherWarning.readAll(page));
        return new ModelAndView(WebPages.WEATHER_WARNINGS.getWebpage());
    }

}
