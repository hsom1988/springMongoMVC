package ch.genidea.mvcMongoExample;

import ch.genidea.mvcMongoExample.model.Person;
import ch.genidea.mvcMongoExample.repository.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@SessionAttributes
public class PersonController {

    @Autowired
    MongoTemplate mongoTemplate;
    @Autowired
    PersonRepository personRepository;

    @RequestMapping(value = "/savePerson", method = RequestMethod.POST)
    public String addPerson(@ModelAttribute("person") Person person, BindingResult result) {


        List<Person> personList = personRepository.findByUsername(person.getUsername());

        if (personList.size() > 0) {
            System.out.println("Error username already exists");
        } else {
            System.out.println("Ok: new username");
            mongoTemplate.save(person);
        }

        return "redirect:/";
    }

    @RequestMapping("/addPerson")
    public ModelAndView showContacts() {

        return new ModelAndView("person", "command", new Person());

    }
}
