package com.smartbank.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.smartbank.entity.BankTransaction;
import com.smartbank.entity.Customer;
import com.smartbank.service.CustomerService;
import com.smartbank.service.TransactionService;

import jakarta.servlet.http.HttpSession;

@Controller
public class TransactionController {

    private final TransactionService transactionService;
    private final CustomerService customerService;

    public TransactionController(
            TransactionService transactionService,
            CustomerService customerService) {

        this.transactionService = transactionService;
        this.customerService = customerService;
    }


    // =========================
    // MINI STATEMENT
    // =========================

    @GetMapping("/transactions")
    public String transactions(
            HttpSession session,
            Model model) {

        Customer customer =
                (Customer) session.getAttribute("customer");

        if (customer == null) {
            return "redirect:/login";
        }

        // Get latest customer/account details from database
        Customer currentCustomer =
                customerService.findByEmail(
                        customer.getEmail());

        if (currentCustomer == null) {
            session.invalidate();
            return "redirect:/login";
        }

        // Update session with latest account balance
        session.setAttribute(
                "customer",
                currentCustomer);

        List<BankTransaction> transactions =
                transactionService.getMiniStatement(
                        currentCustomer.getAccount().getId());

        model.addAttribute(
                "customer",
                currentCustomer);

        model.addAttribute(
                "transactions",
                transactions);

        return "transactions";
    }


    // =========================
    // SEND MINI STATEMENT EMAIL
    // =========================

    @PostMapping("/mini-statement/email")
    public String sendMiniStatementEmailPost(
            HttpSession session,
            Model model) {

        return sendStatement(session, model);
    }


    @GetMapping("/mini-statement/email")
    public String sendMiniStatementEmailGet(
            HttpSession session,
            Model model) {

        return sendStatement(session, model);
    }


    private String sendStatement(
            HttpSession session,
            Model model) {

        Customer customer =
                (Customer) session.getAttribute("customer");

        if (customer == null) {
            return "redirect:/login";
        }

        // Refresh customer/account from database
        Customer currentCustomer =
                customerService.findByEmail(
                        customer.getEmail());

        if (currentCustomer == null) {
            session.invalidate();
            return "redirect:/login";
        }

        // Update session
        session.setAttribute(
                "customer",
                currentCustomer);

        List<BankTransaction> transactions =
                transactionService.getMiniStatement(
                        currentCustomer.getAccount().getId());

        model.addAttribute(
                "customer",
                currentCustomer);

        model.addAttribute(
                "transactions",
                transactions);

        model.addAttribute(
                "message",
                "Mini statement email request sent successfully.");

        return "transactions";
    }
}