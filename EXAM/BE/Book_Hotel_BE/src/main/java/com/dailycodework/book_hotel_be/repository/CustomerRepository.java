package com.dailycodework.book_hotel_be.repository;

import com.dailycodework.book_hotel_be.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {

}

