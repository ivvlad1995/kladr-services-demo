package app.controllers;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/not-dadata")
public class MainController {
    @RequestMapping("/")
    public String index(){
        return "Service alive and reachable";
    }

    @RequestMapping("/{address}")
    public Object get_address(@PathVariable String address){
        return "GET: " + address;
    }

    @RequestMapping("/add/{address}")
    public Object add_address(@PathVariable String address){
        return "ADD: " + address;
    }
}
