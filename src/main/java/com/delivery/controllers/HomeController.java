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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Locale;

@Controller
@RequestMapping
public class HomeController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    private ClientRepository client;
    @Autowired
    private OrderRepository order;
    
    /**
     * Home page renderer
     */
    
    @Autowired
    MongoTemplate mongoTemplate;
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {
        logger.info("Home page");
        model.addAttribute("clientList", client.findAll());
        model.addAttribute("client", new Client());
        return "home";
    }
        
    @RequestMapping(value = "/client", method = RequestMethod.GET)
    public @ResponseBody ModelAndView clients() {
    	return new ModelAndView("client", "command", new Client());
    }
    
    @RequestMapping(value = "/order", method = RequestMethod.GET)
    public @ResponseBody ModelAndView orders() {
    	Model = new ModelAndView("order", "command", new Order());
    	
    	return 
    }
    
}
