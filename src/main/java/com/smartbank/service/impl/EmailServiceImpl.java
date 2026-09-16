package com.smartbank.service.impl;

import java.util.List;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.smartbank.entity.BankTransaction;
import com.smartbank.service.EmailService;

@Service
public class EmailServiceImpl implements EmailService {

    private final JavaMailSender mailSender;

    public EmailServiceImpl(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    @Override
    public void sendOtp(String email, String otp) {

        SimpleMailMessage message = new SimpleMailMessage();

        message.setTo(email);
        message.setSubject("Smart Bank - OTP Verification");

        message.setText(
                "Dear Customer,\n\n"
                + "Your Smart Bank OTP is: " + otp + "\n\n"
                + "This OTP is valid for 5 minutes.\n\n"
                + "Please do not share this OTP with anyone.\n\n"
                + "Regards,\n"
                + "Smart Bank Team"
        );

        mailSender.send(message);
    }

    @Override
    public void sendMiniStatement(
            String email,
            List<BankTransaction> transactions) {

        StringBuilder statement = new StringBuilder();

        statement.append("SMART BANK - MINI STATEMENT\n\n");
        statement.append("Last 10 Transactions\n\n");

        for (BankTransaction transaction : transactions) {

            statement.append("Type: ")
                    .append(transaction.getTransactionType())
                    .append("\n");

            statement.append("Amount: ")
                    .append(transaction.getAmount())
                    .append("\n");

            statement.append("Description: ")
                    .append(transaction.getDescription())
                    .append("\n");

            statement.append("Date: ")
                    .append(transaction.getTransactionDate())
                    .append("\n");

            statement.append("Balance: ")
                    .append(transaction.getBalanceAfterTransaction())
                    .append("\n");

            statement.append("-------------------------\n");
        }

        SimpleMailMessage message = new SimpleMailMessage();

        message.setTo(email);
        message.setSubject("Smart Bank - Mini Statement");
        message.setText(statement.toString());

        mailSender.send(message);
    }
}