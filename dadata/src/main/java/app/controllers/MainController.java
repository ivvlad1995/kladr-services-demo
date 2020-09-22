package app.controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/dadata")
public class MainController {
    @RequestMapping("/")
    public String index(){
        return "Service alive and reachable";
    }
}
