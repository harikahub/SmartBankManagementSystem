package com.smartbank.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smartbank.entity.Admin;
import com.smartbank.entity.Customer;
import com.smartbank.entity.Loan;
import com.smartbank.service.AdminService;
import com.smartbank.service.CustomerService;
import com.smartbank.service.LoanService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

    private final AdminService adminService;
    private final LoanService loanService;
    private final CustomerService customerService;

    public AdminController(
            AdminService adminService,
            LoanService loanService,
            CustomerService customerService) {

        this.adminService = adminService;
        this.loanService = loanService;
        this.customerService = customerService;
    }

    @GetMapping("/admin/login")
    public String adminLoginPage() {
        return "admin-login";
    }

    @PostMapping("/admin/login")
    public String adminLogin(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            HttpSession session,
            Model model) {

        Admin admin =
                adminService.login(username, password);

        if (admin == null) {

            model.addAttribute(
                    "error",
                    "Invalid username or password");

            return "admin-login";
        }

        session.setAttribute("admin", admin);

        return "redirect:/admin/dashboard";
    }

    @GetMapping("/admin/dashboard")
    public String adminDashboard(
            HttpSession session,
            Model model) {

        if (session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }

        List<Loan> pendingLoans =
                loanService.getPendingLoans();

        model.addAttribute(
                "admin",
                session.getAttribute("admin"));

        model.addAttribute(
                "pendingLoans",
                pendingLoans);

        return "admin-dashboard";
    }

    @PostMapping("/admin/loan/status")
    public String updateLoanStatus(
            @RequestParam("loanId") Long loanId,
            @RequestParam("status") String status,
            HttpSession session) {

        if (session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }

        loanService.updateLoanStatus(
                loanId,
                status);

        return "redirect:/admin/dashboard";
    }

    @GetMapping("/admin/customers")
    public String customers(
            HttpSession session,
            Model model) {

        if (session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }

        List<Customer> customers =
                customerService.getAllCustomers();

        model.addAttribute(
                "customers",
                customers);

        return "admin-customers";
    }

    @GetMapping("/admin/logout")
    public String adminLogout(
            HttpSession session) {

        session.invalidate();

        return "redirect:/admin/login";
    }
}