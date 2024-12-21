package com.dailycodework.book_hotel_be.controller;

import com.dailycodework.book_hotel_be.entity.Customer;
import com.dailycodework.book_hotel_be.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin
@RestController
@RequestMapping("/api/customers")
public class CustomerController {
    @Autowired
    private CustomerService service;
    @PostMapping
    public ResponseEntity<Customer> addCustomer(@RequestBody Customer customer) {
        if (customer == null) {
            return ResponseEntity.badRequest().build();
        }
        Customer savedCustomer = service.addCustomer(customer);
        if (savedCustomer == null) {
            return ResponseEntity.status(500).build(); // Internal server error if the data couldn't be saved
        }
        return ResponseEntity.ok(savedCustomer);
    }


    @GetMapping
    public ResponseEntity<List<Customer>> getAllCustomers() {
        return ResponseEntity.ok(service.getAllCustomers());
    }
}
