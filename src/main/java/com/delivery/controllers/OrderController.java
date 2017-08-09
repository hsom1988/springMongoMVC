package com.delivery.controllers;

import com.delivery.persistance.*;
import com.delivery.repositories.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Controller
@RequestMapping(value="/orders/")
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
    @Autowired
    private MongoTemplate mongoTemplate;
    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private ClientRepository clientRepository;
    


    
    
    
    @RequestMapping(value = "/order", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {

        logger.info("Home page");

        Iterable<Client> personList = clientRepository.findAll();

        model.addAttribute("clientList", personList);

        return "orders/order";
    }
    
    @RequestMapping(value = "/orderRead", method = RequestMethod.POST)
    public @ResponseBody List<Order> orderRead() {
        return orderRepository.findAll();
    }
    
    @RequestMapping(value="/clientlist", method=RequestMethod.POST) 
    public @ResponseBody List<Client> clientlist() throws ParseException {
        return clientRepository.findAll();
    }
    
    @RequestMapping(value = "/orderUpdate", method = RequestMethod.POST)
    public @ResponseBody Order orderUpdate(@RequestBody Map<String, Object> model) throws ParseException {
    	Order target = new Order();
        
        target.setId((String)model.get("id"));
        /*target.setFirstName((String)model.get("firstName"));
        target.setLastName((String)model.get("lastName"));
        target.setCedula((String)model.get("cedula"));
        target.setCellphone_number((String)model.get("cellphone_number"));
        target.setPhone_number((String)model.get("phone_number"));                
        target.setAddress((String)model.get("address"));*/
                
        orderRepository.save(target);
        return target;
    }
    
    @RequestMapping(value = "/orderCreate", method = RequestMethod.POST)
    public @ResponseBody Order orderCreate(@RequestBody Map<String, Object> model) throws ParseException {
    	Order client_search = orderRepository.findByNumber((String)model.get("number"));
    	if (client_search != null){
	        System.out.println("Error username already exists");
		}
    
    	Order target = new Order();
    	
        
        //SimpleDateFormat iso8601 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
        //iso8601.setTimeZone(TimeZone.getTimeZone("UTC"));
        
        /*target.setFirstName((String)model.get("firstName"));
        target.setLastName((String)model.get("lastName"));
        target.setCedula((String)model.get("cedula"));
        target.setCellphone_number((String)model.get("cellphone_number"));
        target.setPhone_number((String)model.get("phone_number"));                
        target.setAddress((String)model.get("address"));*/
        
        orderRepository.save(target);
        return target;
    }
    
    @RequestMapping(value = "/orderDestroy", method = RequestMethod.POST)
    public @ResponseBody Order orderDestroy(@RequestBody Map<String, Object> model) {
    	Order target = new Order();
        
        target.setId((String)model.get("id"));
        
        orderRepository.delete(target);
        
        return target;
    }
}


