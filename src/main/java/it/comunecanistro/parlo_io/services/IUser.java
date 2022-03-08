package it.comunecanistro.parlo_io.services;

import it.comunecanistro.parlo_io.data_model.dtos.UserDto;
import it.comunecanistro.parlo_io.data_model.entities.User;
import org.springframework.data.domain.Page;
import org.springframework.web.multipart.MultipartFile;

public interface IUser {

    UserDto create(UserDto userDto);

    void createFromCsv(MultipartFile file);

    Page<User> readAll(int page);

}
