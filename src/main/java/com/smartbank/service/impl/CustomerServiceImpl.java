
package com.smartbank.service.impl;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Random;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.smartbank.entity.Customer;
import com.smartbank.entity.OtpVerification;
import com.smartbank.repository.CustomerRepository;
import com.smartbank.repository.OtpVerificationRepository;
import com.smartbank.service.CustomerService;
import com.smartbank.service.EmailService;

@Service
public class CustomerServiceImpl implements CustomerService {

    private final CustomerRepository customerRepository;
    private final OtpVerificationRepository otpRepository;
    private final EmailService emailService;

    private final BCryptPasswordEncoder passwordEncoder =
            new BCryptPasswordEncoder();

    public CustomerServiceImpl(
            CustomerRepository customerRepository,
            OtpVerificationRepository otpRepository,
            EmailService emailService) {

        this.customerRepository = customerRepository;
        this.otpRepository = otpRepository;
        this.emailService = emailService;
    }

    // =========================
    // REGISTER
    // =========================

    @Override
    public Customer register(Customer customer) {

        String encodedPassword =
                passwordEncoder.encode(
                        customer.getPassword());

        customer.setPassword(encodedPassword);

        customer.setVerified(false);

        Customer savedCustomer =
                customerRepository.save(customer);

        String otp =
                String.valueOf(
                        100000 +
                        new Random().nextInt(900000));

        OtpVerification otpVerification =
                new OtpVerification();

        otpVerification.setEmail(
                customer.getEmail());

        otpVerification.setOtp(otp);

        otpVerification.setExpiryTime(
                LocalDateTime.now().plusMinutes(5));

        otpRepository.save(otpVerification);

        emailService.sendOtp(
                customer.getEmail(),
                otp);

        return savedCustomer;
    }


    // =========================
    // FIND CUSTOMER
    // =========================

    @Override
    public Customer findByEmail(String email) {

        return customerRepository
                .findByEmail(email)
                .orElse(null);
    }


    // =========================
    // VERIFY REGISTRATION OTP
    // =========================

    @Override
    public boolean verifyCustomer(
            String email,
            String otp) {

        Customer customer =
                customerRepository
                        .findByEmail(email)
                        .orElse(null);

        if (customer == null) {
            return false;
        }

        OtpVerification otpVerification =
                otpRepository
                        .findTopByEmailOrderByIdDesc(email)
                        .orElse(null);

        if (otpVerification == null) {
            return false;
        }

        if (!otpVerification.getOtp().equals(otp)) {
            return false;
        }

        if (otpVerification
                .getExpiryTime()
                .isBefore(LocalDateTime.now())) {

            return false;
        }

        customer.setVerified(true);

        customerRepository.save(customer);

        return true;
    }


    // =========================
    // RESEND REGISTRATION OTP
    // =========================

    @Override
    public boolean resendRegistrationOtp(
            String email) {

        Customer customer =
                customerRepository
                        .findByEmail(email)
                        .orElse(null);

        if (customer == null) {
            return false;
        }

        // Already verified customers
        // should not receive registration OTP
        if (customer.isVerified()) {
            return false;
        }

        String otp =
                String.valueOf(
                        100000 +
                        new Random().nextInt(900000));

        OtpVerification otpVerification =
                new OtpVerification();

        otpVerification.setEmail(email);

        otpVerification.setOtp(otp);

        otpVerification.setExpiryTime(
                LocalDateTime.now().plusMinutes(5));

        otpRepository.save(otpVerification);

        System.out.println(
                "REGISTRATION OTP SAVED: " + otp);

        System.out.println(
                "REGISTRATION OTP EMAIL SENDING STARTED: "
                + email);

        emailService.sendOtp(
                email,
                otp);

        System.out.println(
                "REGISTRATION OTP EMAIL SENDING COMPLETED: "
                + email);

        return true;
    }


    // =========================
    // GENERATE LOGIN OTP
    // =========================

    @Override
    public boolean generateLoginOtp(
            String email) {

        Customer customer =
                customerRepository
                        .findByEmail(email)
                        .orElse(null);

        if (customer == null ||
                !customer.isVerified()) {

            return false;
        }

        String otp =
                String.valueOf(
                        100000 +
                        new Random().nextInt(900000));

        OtpVerification otpVerification =
                new OtpVerification();

        otpVerification.setEmail(email);

        otpVerification.setOtp(otp);

        otpVerification.setExpiryTime(
                LocalDateTime.now().plusMinutes(5));

        otpRepository.save(otpVerification);

        System.out.println(
                "OTP SAVED: " + otp);

        System.out.println(
                "OTP EMAIL SENDING STARTED: " + email);

        emailService.sendOtp(
                email,
                otp);

        System.out.println(
                "OTP EMAIL SENDING COMPLETED: " + email);

        return true;
    }


    // =========================
    // VERIFY LOGIN OTP
    // =========================

    @Override
    public boolean verifyLoginOtp(
            String email,
            String otp) {

        OtpVerification otpVerification =
                otpRepository
                        .findTopByEmailOrderByIdDesc(email)
                        .orElse(null);

        if (otpVerification == null) {
            return false;
        }

        if (!otpVerification.getOtp().equals(otp)) {
            return false;
        }

        if (otpVerification
                .getExpiryTime()
                .isBefore(LocalDateTime.now())) {

            return false;
        }

        return true;
    }


    // =========================
    // LOGIN
    // =========================

    @Override
    public boolean login(
            String email,
            String password) {

        Customer customer =
                customerRepository
                        .findByEmail(email)
                        .orElse(null);

        if (customer == null) {
            return false;
        }

        if (!customer.isVerified()) {
            return false;
        }

        return passwordEncoder.matches(
                password,
                customer.getPassword());
    }


    // =========================
    // GET ALL CUSTOMERS
    // =========================

    @Override
    public List<Customer> getAllCustomers() {

        return customerRepository.findAll();
    }
}