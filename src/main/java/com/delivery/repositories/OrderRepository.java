package com.delivery.repositories;

import org.springframework.data.mongodb.repository.MongoRepository;
import com.delivery.persistance.Order;

/**
 * Used for logging data.
 * 
 * @author pascal
 */


public interface OrderRepository extends MongoRepository<Order, Long>{

	Order findByNumber(String number);
    
}
