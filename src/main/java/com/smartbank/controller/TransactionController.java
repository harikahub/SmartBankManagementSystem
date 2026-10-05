package com.smartbank.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.smartbank.entity.BankTransaction;
import com.smartbank.entity.Customer;
import com.smartbank.service.CustomerService;
import com.smartbank.service.EmailService;
import com.smartbank.service.TransactionService;

import jakarta.servlet.http.HttpSession;

@Controller
public class TransactionController {

    private final TransactionService transactionService;
    private final CustomerService customerService;
    private final EmailService emailService;

    public TransactionController(
            TransactionService transactionService,
            CustomerService customerService,
            EmailService emailService) {

        this.transactionService = transactionService;
        this.customerService = customerService;
        this.emailService = emailService;
    }

    // =====================================================
    // MINI STATEMENT PAGE
    // =====================================================

    @GetMapping("/transactions")
    public String transactions(
            HttpSession session,
            Model model) {

        Customer customer =
                (Customer) session.getAttribute("customer");

        if (customer == null) {
            return "redirect:/login";
        }

        Customer currentCustomer =
                customerService.findByEmail(
                        customer.getEmail());

        if (currentCustomer == null) {

            session.invalidate();

            return "redirect:/login";
        }

        session.setAttribute(
                "customer",
                currentCustomer);

        List<BankTransaction> transactions =
                transactionService.getMiniStatement(
                        currentCustomer
                                .getAccount()
                                .getId());

        model.addAttribute(
                "customer",
                currentCustomer);

        model.addAttribute(
                "account",
                currentCustomer.getAccount());

        model.addAttribute(
                "transactions",
                transactions);

        return "mini-statement";
    }

    // =====================================================
    // SEND MINI STATEMENT - POST
    // =====================================================

    @PostMapping("/mini-statement/email")
    public String sendMiniStatementEmailPost(
            HttpSession session,
            Model model) {

        return sendStatement(
                session,
                model);
    }

    // =====================================================
    // SEND MINI STATEMENT - GET
    // =====================================================

    @GetMapping("/mini-statement/email")
    public String sendMiniStatementEmailGet(
            HttpSession session,
            Model model) {

        return sendStatement(
                session,
                model);
    }

    // =====================================================
    // COMMON STATEMENT EMAIL METHOD
    // =====================================================

    private String sendStatement(
            HttpSession session,
            Model model) {

        Customer customer =
                (Customer) session.getAttribute("customer");

        if (customer == null) {
            return "redirect:/login";
        }

        Customer currentCustomer =
                customerService.findByEmail(
                        customer.getEmail());

        if (currentCustomer == null) {

            session.invalidate();

            return "redirect:/login";
        }

        session.setAttribute(
                "customer",
                currentCustomer);

        List<BankTransaction> transactions =
                transactionService.getMiniStatement(
                        currentCustomer
                                .getAccount()
                                .getId());

        // =================================================
        // SEND PDF STATEMENT TO CUSTOMER EMAIL
        // =================================================

        emailService.sendMiniStatement(
                currentCustomer.getEmail(),
                currentCustomer.getFullName(),
                currentCustomer
                        .getAccount()
                        .getAccountNumber(),
                transactions);

        model.addAttribute(
                "customer",
                currentCustomer);

        model.addAttribute(
                "account",
                currentCustomer.getAccount());

        model.addAttribute(
                "transactions",
                transactions);

        model.addAttribute(
                "message",
                "Your account statement has been sent to your email successfully.");

        return "mini-statement";
    }
}