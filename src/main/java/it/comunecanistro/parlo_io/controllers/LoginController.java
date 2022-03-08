package it.comunecanistro.parlo_io.controllers;

import it.comunecanistro.parlo_io.data_model.dtos.AdminUserDto;
import it.comunecanistro.parlo_io.data_model.dtos.PasswordRenewalDto;
import it.comunecanistro.parlo_io.enums.WebPages;
import it.comunecanistro.parlo_io.services.IAdminUser;
import it.comunecanistro.parlo_io.services.IEmailSender;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/login")
public class LoginController {

    private final IAdminUser adminUserService;

    private final IEmailSender emailSender;

    @Value("${base.url}")
    private String baseUrl;

    public LoginController(IAdminUser adminUserService, IEmailSender emailSender) {
        this.adminUserService = adminUserService;
        this.emailSender = emailSender;
    }

    @GetMapping
    public ModelAndView loginView() {
        return new ModelAndView(WebPages.LOGIN.getWebpage());
    }

    @GetMapping("/password-recovery-renewal/{username}")
    public ModelAndView renewal(@PathVariable String username, Model model) {
        model.addAttribute("username", username);
        return new ModelAndView(WebPages.PASSWORD_RECOVERY_2.getWebpage());
    }

    @PostMapping("/password-renewal/{username}")
    public ResponseEntity<?> renewal(@PathVariable String username, @RequestBody PasswordRenewalDto passwordRenewalDto) {
        adminUserService.changePassword(username, passwordRenewalDto);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/password-recovery")
    public ModelAndView passwordRecovery() {
        return new ModelAndView(WebPages.PASSWORD_RECOVERY.getWebpage());
    }

    @GetMapping("/password-recovery/{username}")
    public ModelAndView passwordRecovery(@PathVariable String username, Model model) {
        AdminUserDto user = adminUserService.readByUsername(username);
        model.addAttribute("username", username);
        if (user != null && user.getEnabled()) {
            model.addAttribute("adminIsPresent", true);

            emailSender.send(
                    user.getEmail(),
                    "Recupero password",
                    String.format("Clicca il seguente link per modificare la password.\n%s", generateRenewalLink(user.getUsername()))
            );

            return new ModelAndView(WebPages.PASSWORD_RECOVERY.getWebpage());
        }
        model.addAttribute("adminIsPresent", false);
        return new ModelAndView(WebPages.PASSWORD_RECOVERY.getWebpage());
    }

    private String generateRenewalLink(String username) {
        if (!baseUrl.endsWith("/"))
            baseUrl += "/";
        return baseUrl += "login/" + WebPages.PASSWORD_RECOVERY_2.getWebpage() + "/" + username;
    }

}
