package ch.genidea.mvcTest.repository;

import ch.genidea.mvcTest.model.Person;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PersonRepository extends CrudRepository<Person, Long> {
   List<Person> findByUsername(String username);
}
