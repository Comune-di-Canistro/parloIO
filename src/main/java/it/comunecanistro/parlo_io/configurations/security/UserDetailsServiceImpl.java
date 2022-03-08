package it.comunecanistro.parlo_io.configurations.security;

import it.comunecanistro.parlo_io.data_model.entities.AdminUser;
import it.comunecanistro.parlo_io.repositories.AdminRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class UserDetailsServiceImpl implements UserDetailsService {

    private final AdminRepository adminRepository;

    public UserDetailsServiceImpl(AdminRepository adminRepository) {
        this.adminRepository = adminRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        AdminUser adminUser = adminRepository.findByUsername(username);
        if (adminUser == null) {
            throw new UsernameNotFoundException(String.format("Username %s non registrato", username));
        }
        return new UserDetailsImpl(adminUser);
    }

}
