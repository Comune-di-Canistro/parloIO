package it.comunecanistro.parlo_io.repositories;

import it.comunecanistro.parlo_io.data_model.entities.User;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends PagingAndSortingRepository<User, Integer> {
}
