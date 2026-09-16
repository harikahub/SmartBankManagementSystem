package com.smartbank.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.smartbank.entity.Customer;
import com.smartbank.entity.Loan;
import com.smartbank.service.LoanService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoanController {

    private final LoanService loanService;

    public LoanController(LoanService loanService) {
        this.loanService = loanService;
    }

    // Open Loan Application Page
    @GetMapping("/loan")
    public String loanPage(HttpSession session) {

        if (session.getAttribute("customer") == null) {
            return "redirect:/login";
        }

        return "loan";
    }

    // Open Loan Application Page using /loan/apply
    @GetMapping("/loan/apply")
    public String loanApplyPage(HttpSession session) {

        if (session.getAttribute("customer") == null) {
            return "redirect:/login";
        }

        return "loan";
    }

    // Submit Loan Application
    @PostMapping("/loan/apply")
    public String applyLoan(
            Loan loan,
            HttpSession session,
            Model model) {

        Customer customer =
                (Customer) session.getAttribute("customer");

        if (customer == null) {
            return "redirect:/login";
        }

        loan.setCustomer(customer);

        loanService.applyLoan(loan);

        model.addAttribute(
                "message",
                "Loan application submitted successfully");

        return "loan";
    }

    // View Loan Status
    @GetMapping("/loan/status")
    public String loanStatus(
            HttpSession session,
            Model model) {

        Customer customer =
                (Customer) session.getAttribute("customer");

        if (customer == null) {
            return "redirect:/login";
        }

        List<Loan> loans =
                loanService.getCustomerLoans(
                        customer.getId());

        model.addAttribute("loans", loans);

        return "loan-status";
    }
}