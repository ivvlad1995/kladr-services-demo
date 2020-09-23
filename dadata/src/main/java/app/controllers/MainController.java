package app.controllers;

import app.integrations.Standardization;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/dadata")
public class MainController {
    @Value("${key.api}")
    private String API_KEY;
    @Value("${key.secret}")
    private String SECRET_KEY;

    @RequestMapping("/")
    public String index(){
        return "Service alive and reachable";
    }

    @RequestMapping("/{address}")
    public Object get_address(@PathVariable String address){
        Standardization standardization = new Standardization(API_KEY, SECRET_KEY);
        return standardization.cleanAddress(address);
    }
}
