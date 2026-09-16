package com.smartbank.service;

import java.util.List;

import com.smartbank.entity.Customer;

public interface CustomerService {

    Customer register(Customer customer);

    Customer findByEmail(String email);

    boolean verifyCustomer(String email, String otp);

    boolean generateLoginOtp(String email);

    boolean verifyLoginOtp(String email, String otp);

    boolean login(String email, String password);

    List<Customer> getAllCustomers();

}