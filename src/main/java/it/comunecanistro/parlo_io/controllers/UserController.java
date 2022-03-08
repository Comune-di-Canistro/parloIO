package it.comunecanistro.parlo_io.controllers;

import it.comunecanistro.parlo_io.configurations.SharedAttributes;
import it.comunecanistro.parlo_io.configurations.Utils;
import it.comunecanistro.parlo_io.data_model.dtos.UserDto;
import it.comunecanistro.parlo_io.enums.WebPages;
import it.comunecanistro.parlo_io.services.IUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@RestController
@RequestMapping("/users")
@Slf4j
public class UserController {

    private final IUser iUser;

    public UserController(IUser iUser) {
        this.iUser = iUser;
    }


    @GetMapping
    public ModelAndView homepage(Model model) {
        model.addAttribute(SharedAttributes.SIDEBAR_INDEX, WebPages.NEW_USERS.getIndex());
        return new ModelAndView(WebPages.NEW_USERS.getWebpage());
    }

    @GetMapping("/all/{page}")
    public ModelAndView readAll(@PathVariable int page, Model model) {
        model.addAttribute(SharedAttributes.SIDEBAR_INDEX, WebPages.USERS.getIndex());
        model.addAttribute("users", iUser.readAll(page));
        return new ModelAndView(WebPages.USERS.getWebpage());
    }

    @PostMapping("/csv")
    public ResponseEntity<?> createFromCsv(@RequestParam("file") MultipartFile file) {
        if (Utils.checkFormat(file)) {
            iUser.createFromCsv(file);
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.badRequest().build();
        }
    }

    @PostMapping
    public ResponseEntity<UserDto> create(@Valid @RequestBody UserDto user) {
        return ResponseEntity.ok(iUser.create(user));
    }

}
