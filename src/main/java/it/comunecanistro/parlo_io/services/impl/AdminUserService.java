package it.comunecanistro.parlo_io.services.impl;

import it.comunecanistro.parlo_io.data_model.dtos.AdminUserDto;
import it.comunecanistro.parlo_io.data_model.dtos.PasswordRenewalDto;
import it.comunecanistro.parlo_io.data_model.entities.AdminUser;
import it.comunecanistro.parlo_io.enums.AdminUserRoles;
import it.comunecanistro.parlo_io.repositories.AdminRepository;
import it.comunecanistro.parlo_io.services.IAdminUser;
import it.comunecanistro.parlo_io.services.IEmailSender;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.text.RandomStringGenerator;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.lang.Nullable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Random;

@Service
@Slf4j
public class AdminUserService implements IAdminUser {

    private final AdminRepository adminRepository;
    private final ModelMapper modelMapper;

    private final BCryptPasswordEncoder encoder;

    private final IEmailSender emailSender;

    @Value("${page.size}")
    private int pageSize;

    public AdminUserService(AdminRepository adminRepository, BCryptPasswordEncoder encoder, ModelMapper modelMapper, IEmailSender emailSender) {
        this.adminRepository = adminRepository;
        this.modelMapper = modelMapper;
        this.encoder = encoder;
        this.emailSender = emailSender;
    }

    @Override
    public AdminUserDto createOperator(AdminUserDto adminUserDto) {

        String password = generatePassword();
        AdminUser adminUser = AdminUser.builder().password(encoder.encode(password)).username(adminUserDto.getUsername().toUpperCase()).firstName(adminUserDto.getFirstName().toUpperCase()).familyName(adminUserDto.getFamilyName().toUpperCase()).email(adminUserDto.getEmail()).role(AdminUserRoles.OPERATOR.name()).enabled(true).build();

        AdminUserDto saved = modelMapper.map(adminRepository.save(adminUser), AdminUserDto.class);

        emailSender.send(adminUser.getEmail(), "Creazione Nuovo Operatore", String.format("Creazione avvenuta con successo.\nusername: %s\npassword: %s", adminUser.getUsername(), password));

        return saved;

    }

    @Override
    public Page<AdminUser> readOperators(int page) {
        return adminRepository.findAll(PageRequest.of(page, pageSize));
    }

    @Nullable
    @Override
    public AdminUserDto readByUsername(String username) {
        username = username.toUpperCase();
        if (adminRepository.existsByUsername(username))
            return modelMapper.map(adminRepository.findByUsername(username), AdminUserDto.class);
        return null;
    }

    @Override
    public boolean changeStatus(String username, boolean status) {
        AdminUser temp = adminRepository.findByUsername(username);
        temp.setEnabled(status);
        adminRepository.save(temp);
        return status;
    }

    @Override
    public void changePassword(String username, PasswordRenewalDto password) {
        AdminUser temp = adminRepository.findByUsername(username);
        if (temp != null) {
            temp.setPassword(encoder.encode(password.getPassword()));
            adminRepository.save(temp);
        }
    }

    private String generatePassword() {
        RandomStringGenerator pwdGenerator = new RandomStringGenerator.Builder().withinRange(33, 45).usingRandom(i -> new Random().nextInt(33, 45)).build();
        return pwdGenerator.generate(8);
    }

}
