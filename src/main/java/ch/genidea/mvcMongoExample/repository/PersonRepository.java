package ch.genidea.mvcMongoExample.repository;

import ch.genidea.mvcMongoExample.model.Person;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PersonRepository extends CrudRepository<Person, Long> {
    List<Person> findByUsername(String username);
}
