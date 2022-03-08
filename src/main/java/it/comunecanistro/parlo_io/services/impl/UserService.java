package it.comunecanistro.parlo_io.services.impl;

import it.comunecanistro.parlo_io.data_model.dtos.UserDto;
import it.comunecanistro.parlo_io.data_model.entities.User;
import it.comunecanistro.parlo_io.repositories.UserRepository;
import it.comunecanistro.parlo_io.services.IUser;
import it.comunecanistro.parlo_io.services.exceptions.FiscalCodeException;
import it.comunecanistro.parlo_io.services.exceptions.NameException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.Date;

@Service
@Slf4j
public class UserService implements IUser {

    private final UserRepository userRepository;
    private final ModelMapper modelMapper;

    private static final int FISCALCODE_LEN = 16;
    private static final String[] HEADERS = new String[]{"codice fiscale", "nome", "cognome"};

    @Value("${page.size}")
    private int pageSize;

    public UserService(UserRepository userRepository, ModelMapper modelMapper) {
        this.userRepository = userRepository;
        this.modelMapper = modelMapper;
    }

    @Override
    public UserDto create(UserDto userDto) {
        User user = modelMapper.map(userDto, User.class);

        user.setFiscalCode(user.getFiscalCode().toUpperCase());
        user.setFirstName(user.getFirstName().toUpperCase());
        user.setFamilyName(user.getFamilyName().toUpperCase());

        user.setRegistrationDate(new Date());

        return modelMapper.map(userRepository.save(user), UserDto.class);
    }

    @Override
    public void createFromCsv(MultipartFile file) {

        Mono.fromCallable(() -> createFromCsvInternal(file))
                .subscribeOn(Schedulers.newParallel("user_csv", 10, true))
                .subscribe(count -> log.info("USER ADDED: {}", count));

    }

    private int createFromCsvInternal(MultipartFile file) throws IOException {
        BufferedReader fileReader = new BufferedReader(new InputStreamReader(file.getInputStream(), StandardCharsets.UTF_8));
        CSVParser csvParser = new CSVParser(fileReader, CSVFormat.DEFAULT
                .withFirstRecordAsHeader()
                .withIgnoreHeaderCase()
                .withTrim()
                .withIgnoreEmptyLines()
                .withHeader(HEADERS)
        );

        Iterable<CSVRecord> records = csvParser.getRecords();

        int count = 0;
        for (CSVRecord record : records) {
            try {
                String fiscalCodeChecked = checkFiscalCode(record.get(HEADERS[0]));
                String firstName = checkName(record.get(HEADERS[1]));
                String familyName = checkName(record.get(HEADERS[2]));
                create(UserDto.builder()
                        .fiscalCode(fiscalCodeChecked)
                        .firstName(firstName)
                        .familyName(familyName).build()
                );
                count++;
            } catch (FiscalCodeException e) {
                log.error("FiscalCode Exception: {}", e.getMessage());
            } catch (NameException ignored) {
                log.error("First or Family Name is null");
            }
        }

        return count;
    }

    @Override
    public Page<User> readAll(int page) {
        return userRepository.findAll(PageRequest.of(page, pageSize));
    }

    private String checkFiscalCode(String fiscalCode) throws FiscalCodeException {
        if (fiscalCode.isBlank() || fiscalCode.length() != FISCALCODE_LEN) throw new FiscalCodeException(fiscalCode);
        return fiscalCode;
    }

    private String checkName(String name) throws NameException {
        if (name.isBlank()) throw new NameException();
        return name;
    }

}
