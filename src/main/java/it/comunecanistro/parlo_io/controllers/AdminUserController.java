package it.comunecanistro.parlo_io.controllers;

import it.comunecanistro.parlo_io.configurations.SharedAttributes;
import it.comunecanistro.parlo_io.data_model.dtos.AdminUserDto;
import it.comunecanistro.parlo_io.enums.WebPages;
import it.comunecanistro.parlo_io.services.impl.AdminUserService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@RestController
@RequestMapping("/operators")
public class AdminUserController {

    private final AdminUserService adminUserService;

    public AdminUserController(AdminUserService adminUserService) {
        this.adminUserService = adminUserService;
    }

    @PreAuthorize("hasAnyAuthority('ADMIN')")
    @PutMapping("/change-status/{operator}")
    public ResponseEntity<Boolean> changeOperatorStatus(@PathVariable String operator, @RequestParam boolean status) {
        return ResponseEntity.ok(adminUserService.changeStatus(operator, status));
    }

    @PreAuthorize("hasAnyAuthority('ADMIN')")
    @PostMapping
    public ResponseEntity<AdminUserDto> create(@Valid @RequestBody AdminUserDto adminUserDto, Model model) {

        if (!adminUserDto.getEmail().equalsIgnoreCase(adminUserDto.getConfirmationEmail()))
            return ResponseEntity.badRequest().build();

        return ResponseEntity.ok(adminUserService.createOperator(adminUserDto));
    }

    @PreAuthorize("hasAnyAuthority('ADMIN')")
    @GetMapping(path = "/{page}")
    public ModelAndView readOperators(@PathVariable int page, Model model) {
        model.addAttribute(SharedAttributes.SIDEBAR_INDEX, WebPages.OPERATORS.getIndex());
        model.addAttribute("operators", adminUserService.readOperators(page));
        return new ModelAndView(WebPages.OPERATORS.getWebpage());
    }

    @PreAuthorize("hasAnyAuthority('ADMIN')")
    @GetMapping
    public ModelAndView createOperator(Model model) {
        model.addAttribute(SharedAttributes.SIDEBAR_INDEX, WebPages.NEW_OPERATOR.getIndex());
        return new ModelAndView(WebPages.NEW_OPERATOR.getWebpage());
    }

}
