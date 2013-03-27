package ch.genidea.mvcTest;

import ch.genidea.mvcTest.model.Person;
import ch.genidea.mvcTest.repository.PersonRepository;
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

    @RequestMapping(value ="/addPerson", method = RequestMethod.POST)
    public String addPerson(@ModelAttribute("person") Person person, BindingResult result){

       List<Person> personList =personRepository.findByUsername(person.getUsername());
        if (personList.size() > 0){
            System.out.println("Error username already exists");
        } else {
            System.out.println("Ok: new username");
        }


        // System.out.println("Name : " + person.getUsername());
        // mongoTemplate.save(person);

        return "redirect:persons.html";
    }

    @RequestMapping("/persons")
    public ModelAndView showContacts() {

        return new ModelAndView("person", "command", new Person());
    }
}
