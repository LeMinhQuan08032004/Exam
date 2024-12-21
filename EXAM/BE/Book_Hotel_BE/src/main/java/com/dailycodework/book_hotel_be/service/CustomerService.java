package com.dailycodework.book_hotel_be.service;

import com.dailycodework.book_hotel_be.entity.Customer;
import com.dailycodework.book_hotel_be.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerService {
    @Autowired
    private CustomerRepository repository;



    public List<Customer> getAllCustomers() {
        return repository.findAll();
    }
    @Autowired
    private CustomerRepository customerRepository;

    public Customer addCustomer(Customer customer) {
        if (customer == null) {
            throw new IllegalArgumentException("Customer cannot be null");
        }
        // Kiểm tra nếu cần, có thể lưu ngay lập tức hoặc kiểm tra dữ liệu trước khi lưu
        return customerRepository.save(customer);
    }
}

