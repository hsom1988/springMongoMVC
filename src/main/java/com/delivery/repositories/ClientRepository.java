package com.delivery.repositories;

import org.springframework.data.mongodb.repository.MongoRepository;
import com.delivery.persistance.Client;


/**
 * Used for logging data.
 * 
 * @author pascal
 */

public interface ClientRepository extends MongoRepository<Client, Long>{

	Client findByCedula(String number);
}
