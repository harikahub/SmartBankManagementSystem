package com.smartbank.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.smartbank.entity.BankTransaction;
import com.smartbank.service.EmailService;
import com.smartbank.service.PdfService;

import jakarta.mail.internet.MimeMessage;

@Service
public class EmailServiceImpl implements EmailService {

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private PdfService pdfService;

    @Override
    public void sendOtp(
            String email,
            String otp) {

        try {

            MimeMessage message =
                    mailSender.createMimeMessage();

            MimeMessageHelper helper =
                    new MimeMessageHelper(
                            message,
                            true
                    );

            helper.setTo(email);

            helper.setSubject(
                    "SmartBank OTP Verification"
            );

            String body =
                    "Dear Customer,\n\n"
                    + "Your SmartBank OTP is: "
                    + otp
                    + "\n\n"
                    + "This OTP is valid for a limited time.\n"
                    + "Please do not share this OTP with anyone.\n\n"
                    + "Regards,\n"
                    + "SmartBank Team";

            helper.setText(body);

            mailSender.send(message);

        } catch (Exception e) {

            throw new RuntimeException(
                    "Failed to send OTP email",
                    e
            );
        }
    }

    @Override
    public void sendMiniStatement(
            String email,
            String customerName,
            String accountNumber,
            List<BankTransaction> transactions) {

        try {

            byte[] pdfBytes =
                    pdfService.generateStatement(
                            customerName,
                            accountNumber,
                            transactions
                    );

            MimeMessage message =
                    mailSender.createMimeMessage();

            MimeMessageHelper helper =
                    new MimeMessageHelper(
                            message,
                            true
                    );

            helper.setTo(email);

            helper.setSubject(
                    "SmartBank Account Statement"
            );

            String body =
                    "Dear " + customerName + ",\n\n"
                    + "Please find your SmartBank account "
                    + "statement attached with this email.\n\n"
                    + "Account Number: "
                    + accountNumber
                    + "\n\n"
                    + "Thank you for banking with SmartBank.\n\n"
                    + "Regards,\n"
                    + "SmartBank Team";

            helper.setText(body);

            ByteArrayResource pdfResource =
                    new ByteArrayResource(pdfBytes);

            helper.addAttachment(
                    "SmartBank_Statement.pdf",
                    pdfResource
            );

            mailSender.send(message);

        } catch (Exception e) {

            throw new RuntimeException(
                    "Failed to send account statement email",
                    e
            );
        }
    }
}