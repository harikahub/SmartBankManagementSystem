package com.smartbank.service;

import java.util.List;

import com.smartbank.entity.BankTransaction;

public interface EmailService {

    void sendOtp(String email, String otp);

    void sendMiniStatement(String email,
                           List<BankTransaction> transactions);
}