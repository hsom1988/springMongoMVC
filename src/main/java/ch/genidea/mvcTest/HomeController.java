package ch.genidea.mvcTest;

import ch.genidea.mvcTest.model.Person;
import ch.genidea.mvcTest.repository.PersonRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.text.DateFormat;
import java.util.*;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    private PersonRepository personRepository;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		List<String> listData = new ArrayList<String>();
		listData.add("one");
		listData.add("two");
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("dataList", listData);

        Iterable<Person> personList = personRepository.findAll();

           model.addAttribute("personList", personList);

		return "home";
	}


	
}
