package workshop.demo;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import workshop.demo.Speaker;


@RestController
public class HelloController {

    @Autowired
	SpeakerRepository speakers;
    
    @RequestMapping("/")
    @Transactional
    public String index() {
        Speaker martin = new Speaker(); 
        martin.name = "Martin Fowler";
        Speaker saved = speakers.save(martin);
        
        return "Hello and Greetings from Spring Boot2!";
    }

    @GetMapping("/get/{id}")
    public String getById(@PathVariable String id) {
        return "Get: " + id ;
    }
    
}
