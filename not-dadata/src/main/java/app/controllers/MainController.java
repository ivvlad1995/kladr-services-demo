package app.controllers;

import app.models.Address;
import app.repository.AddressRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/not-dadata")
public class MainController {
    @Autowired
    private AddressRepository addressRepository;

    @RequestMapping("/")
    public String index(){
        return "Service alive and reachable";
    }

    @RequestMapping("/{address}")
    public Object get_address(@PathVariable String address){
        return addressRepository.findByDescription((address.trim()).toUpperCase());
    }

    @RequestMapping("/add/{address}")
    public Object add_address(@PathVariable String address){
        return addressRepository.save(new Address((address.trim()).toUpperCase()));
    }
}
