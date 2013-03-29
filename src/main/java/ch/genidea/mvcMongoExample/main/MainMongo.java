package ch.genidea.mvcMongoExample.main;

import ch.genidea.mvcMongoExample.model.Person;
import com.mongodb.Mongo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;

public class MainMongo {

    private static final Logger log = LoggerFactory.getLogger(MainMongo.class);

    public static void main(String[] args) throws Exception {

        MongoOperations mongoOperations = new MongoTemplate(new Mongo(), "database");

        mongoOperations.insert(new Person("marco", "marco"));

        Person person = mongoOperations.findOne(new Query(Criteria.where("username").is("marco")), Person.class);

        log.debug("Person found : " + person.getUsername());

        mongoOperations.dropCollection("person");
    }
}
