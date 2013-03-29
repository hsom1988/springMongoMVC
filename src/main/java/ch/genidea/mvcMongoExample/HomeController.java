package ch.genidea.mvcMongoExample;

import ch.genidea.mvcMongoExample.model.Person;
import ch.genidea.mvcMongoExample.repository.PersonRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.*;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    private PersonRepository personRepository;

	/**
	 * Home page renderer
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

        logger.info("Home page");
		
		Iterable<Person> personList = personRepository.findAll();

           model.addAttribute("personList", personList);

		return "home";
	}


	
}
