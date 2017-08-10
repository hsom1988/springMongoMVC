package com.delivery.controllers;

import com.delivery.persistance.*;
import com.delivery.repositories.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.delivery.message.Response;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Controller
@RequestMapping(value="/orders/")
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private ClientRepository clientRepository;
    
    @RequestMapping(value = "/order", method = RequestMethod.GET)
    public @ResponseBody ModelAndView orders() {
    	ModelAndView model = new ModelAndView("order", "command", new Order());
    	//model.addObject("clientList", client.findAll());
    	return model;
    }
    
    @RequestMapping(value = "/orderRead", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {
        model.addAttribute("orderList", orderRepository.findAll());
        model.addAttribute("order", new Order());
        return "orderList";
    }
    
    @RequestMapping(value="/orderRead", method=RequestMethod.POST) 
    public @ResponseBody List<Order> orlist() throws ParseException {
    	logger.info("Leyendo ordenes");
        return orderRepository.findAll();
    }
    
    @RequestMapping(value = "/orderToDispatch", method = RequestMethod.GET)
    public String toDispatch(Locale locale, Model model) {
            model.addAttribute("orderList",  orderRepository.findByStatus("Por entregar"));
            model.addAttribute("order", new Order());
            return "orderList";
    }
    
    @RequestMapping(value="/orderToDispatch", method=RequestMethod.POST) 
    public @ResponseBody List<Order> toDispatch() throws ParseException {
    	logger.info("Leyendo ordenes");
        return orderRepository.findByStatus("Por entregar");
    }
    
    @RequestMapping(value = "/orderDispatched", method = RequestMethod.GET)
    public String dispatched(Locale locale, Model model) {
            model.addAttribute("orderList",  orderRepository.findByStatus("Entregado"));
            model.addAttribute("order", new Order());
            return "orderList";
    }
    
    @RequestMapping(value="/orderDispatched", method=RequestMethod.POST) 
    public @ResponseBody List<Order> dispatched() throws ParseException {
    	logger.info("Leyendo ordenes");
        return orderRepository.findByStatus("Entregado");
    }
    
    @RequestMapping(value="/clientlist", method=RequestMethod.POST) 
    public @ResponseBody List<Client> clientlist() throws ParseException {
        return clientRepository.findAll();
    }
    
    @RequestMapping(value = "/orderUpdate", method = RequestMethod.POST)
    public @ResponseBody Order orderUpdate(@RequestBody Map<String, Object> model) throws ParseException {
    	Order target = new Order();
        
        target.setId((String)model.get("id"));
        target.setNumber((String)model.get("number"));
        target.setNameReceiver((String)model.get("nameReceiver"));
        target.setDestiny((String)model.get("destiny"));
        target.setStatus((String)model.get("status"));
                
        orderRepository.save(target);
        return target;
    }
    
	@RequestMapping(value = "/orderCreate", method = RequestMethod.POST)
    public @ResponseBody Order orderCreate(@RequestBody Map<String, Object> model) throws ParseException {
    	Response res = new Response(); // client_search = orderRepository.findByNumber((String)model.get("number"));
    	/*{number=qqwe, 
    			client_id=[object Object], 
    			nameReceiver=qweqwe, 
    			ciReceiver=qweqwe, 
    			destiny=qweqwe, 
    			price=qweqwe, 
    			date=2017-08-10, 
    			packages=[
    			{description=asd, weight=1, type=Paquete}, 
    			{description=asd1, weight=2, type=Paquete}
    			]
    			}*/
    	Order order = new Order();
    	order.setCiReceiver((String)model.get("ciReceiver"));
    	//order.setClient_id(client_id);
    	DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
    	Date date = format.parse((String)model.get("date"));
    	order.setDate(date);
    	order.setDestiny((String)model.get("destiny"));
    	order.setNameReceiver((String)model.get("nameReceiver"));
    	order.setNumber((String)model.get("number"));
    	float price = Float.parseFloat((String)model.get("price"));
    	order.setPrice(price);
    	order.setStatus("Por entregar");
		@SuppressWarnings("unchecked")
		List<Map<String,Object>> packages = (List<Map<String,Object>>)model.get("packages");
    	order.setPackages(packages);
    	res.setStatus("SUCCESS");
    	res.setData(order);
    	orderRepository.save(order);
    	return order;
    }
    
    /*@RequestMapping(value = "/orderCreate", method = RequestMethod.POST)
    public @ResponseBody Response orderCreate(@ModelAttribute(value="order") Order order, BindingResult result) throws ParseException {
    	Response res = new Response(); // client_search = orderRepository.findByNumber((String)model.get("number"));
    	if(!result.hasErrors()){
    		orderRepository.save(order);
            res.setStatus("SUCCESS");
        }else{
            res.setStatus("FAIL");
        }
       res.setData(order);
       return res;
    }*/
    
    
    @RequestMapping(value = "/orderDestroy", method = RequestMethod.POST)
    public @ResponseBody Order orderDestroy(@RequestBody Map<String, Object> model) {
    	Order target = new Order();
        
        target.setId((String)model.get("id"));
        
        orderRepository.delete(target);
        
        return target;
    }
}


