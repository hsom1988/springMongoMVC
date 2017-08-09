package com.delivery.controllers;

import com.delivery.persistance.*;
import com.delivery.repositories.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/clients/")
public class ClientController {

    @Autowired
    private MongoTemplate mongoTemplate;
    @Autowired
    private ClientRepository clientRepository;
    
    @RequestMapping(value = "/client", method = RequestMethod.GET)
    public String client() {
        return "clients/client";
    }
    
    @RequestMapping(value = "/clientRead", method = RequestMethod.POST)
    public @ResponseBody List<Client> clientRead() {
        return clientRepository.findAll();
    }
    
    @RequestMapping(value = "/clientUpdate", method = RequestMethod.POST)
    public @ResponseBody Client clientUpdate(@RequestBody Map<String, Object> model) throws ParseException {
    	Client target = new Client();
        
        target.setId((String)model.get("id"));
        target.setContactName((String)model.get("contactName"));
        target.setCedula((String)model.get("cedula"));
        target.setCellphone_number((String)model.get("cellphone_number"));
        target.setPhone_number((String)model.get("phone_number"));                
        target.setAddress((String)model.get("address"));
                
        clientRepository.save(target);
        return target;
    }
    
    @RequestMapping(value = "/clientCreate", method = RequestMethod.POST)
    public @ResponseBody Client clientCreate(@RequestParam Map<String, Object> model) throws ParseException {
    	Client client_search = clientRepository.findByCedula((String)model.get("cedula"));
    	if (client_search != null){
	        System.out.println("Error username already exists");
		}
    
    	Client target = new Client();
    	
        
        //SimpleDateFormat iso8601 = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
        //iso8601.setTimeZone(TimeZone.getTimeZone("UTC"));
        
        target.setContactName((String)model.get("contactName"));
        target.setCedula((String)model.get("cedula"));
        target.setCellphone_number((String)model.get("cellphone_number"));
        target.setPhone_number((String)model.get("phone_number"));                
        target.setAddress((String)model.get("address"));
        
        clientRepository.save(target);
        return target;
    }
    
    @RequestMapping(value = "/clientDestroy", method = RequestMethod.POST)
    public @ResponseBody Client destroy(@RequestBody Map<String, Object> model) {
    	Client target = new Client();
        
        target.setId((String)model.get("id"));
        
        clientRepository.delete(target);
        
        return target;
    }
}


