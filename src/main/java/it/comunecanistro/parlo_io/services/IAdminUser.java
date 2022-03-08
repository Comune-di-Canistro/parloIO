package it.comunecanistro.parlo_io.services;

import it.comunecanistro.parlo_io.data_model.dtos.AdminUserDto;
import it.comunecanistro.parlo_io.data_model.dtos.PasswordRenewalDto;
import it.comunecanistro.parlo_io.data_model.entities.AdminUser;
import org.springframework.data.domain.Page;

public interface IAdminUser {

    AdminUserDto createOperator(AdminUserDto adminUserDto);

    Page<AdminUser> readOperators(int page);

    AdminUserDto readByUsername(String username);

    boolean changeStatus(String username, boolean status);

    void changePassword(String username, PasswordRenewalDto password);

}
