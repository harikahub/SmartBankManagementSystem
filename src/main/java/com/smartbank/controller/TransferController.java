package com.smartbank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smartbank.entity.Customer;
import com.smartbank.service.TransactionService;

import jakarta.servlet.http.HttpSession;

@Controller
public class TransferController {

    private final TransactionService transactionService;

    public TransferController(TransactionService transactionService) {
        this.transactionService = transactionService;
    }

    // =========================
    // TRANSFER PAGE
    // =========================

    @GetMapping("/transfer")
    public String transferPage(
            HttpSession session,
            Model model) {

        Customer customer =
                (Customer) session.getAttribute("customer");

        if (customer == null) {
            return "redirect:/login";
        }

        model.addAttribute("customer", customer);

        return "transfer";
    }


    // =========================
    // ACCOUNT NUMBER TRANSFER
    // =========================

    @PostMapping("/transfer")
    public String transferByAccount(
            @RequestParam("receiverAccount") String receiverAccount,
            @RequestParam("amount") double amount,
            HttpSession session,
            Model model) {

        Customer customer =
                (Customer) session.getAttribute("customer");

        if (customer == null) {
            return "redirect:/login";
        }

        String senderAccount =
                customer.getAccount().getAccountNumber();

        boolean success =
                transactionService.transfer(
                        senderAccount,
                        receiverAccount,
                        amount);

        if (success) {

            model.addAttribute(
                    "message",
                    "Fund transfer successful!");

        } else {

            model.addAttribute(
                    "error",
                    "Transfer failed. Please check the receiver account and available balance.");
        }

        model.addAttribute("customer", customer);

        return "transfer";
    }


    // =========================
    // UPI TRANSFER
    // =========================

    @PostMapping("/transfer/upi")
    public String transferByUpi(
            @RequestParam("receiverUpiId") String receiverUpiId,
            @RequestParam("amount") double amount,
            HttpSession session,
            Model model) {

        Customer customer =
                (Customer) session.getAttribute("customer");

        if (customer == null) {
            return "redirect:/login";
        }

        String senderAccount =
                customer.getAccount().getAccountNumber();

        boolean success =
                transactionService.transferByUpi(
                        senderAccount,
                        receiverUpiId,
                        amount);

        if (success) {

            model.addAttribute(
                    "message",
                    "UPI transfer successful!");

        } else {

            model.addAttribute(
                    "error",
                    "UPI transfer failed. Please check the UPI ID and available balance.");
        }

        model.addAttribute("customer", customer);

        return "transfer";
    }
}