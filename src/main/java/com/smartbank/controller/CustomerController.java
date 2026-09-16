package com.smartbank.controller;

import java.util.List;
import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smartbank.entity.Account;
import com.smartbank.entity.BankTransaction;
import com.smartbank.entity.Customer;
import com.smartbank.service.AccountService;
import com.smartbank.service.CustomerService;
import com.smartbank.service.TransactionService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CustomerController {

    private final CustomerService customerService;
    private final AccountService accountService;
    private final TransactionService transactionService;

    public CustomerController(
            CustomerService customerService,
            AccountService accountService,
            TransactionService transactionService) {

        this.customerService = customerService;
        this.accountService = accountService;
        this.transactionService = transactionService;
    }

    // =========================
    // REGISTER
    // =========================

    @PostMapping("/register")
    public String register(
            @RequestParam("fullName") String fullName,
            @RequestParam("email") String email,
            @RequestParam("mobile") String mobile,
            @RequestParam("password") String password,
            @RequestParam("address") String address,
            @RequestParam(value = "aadharNumber", required = false) String aadharNumber,
            @RequestParam(value = "panNumber", required = false) String panNumber,
            Model model) {

        // Check whether email already exists
        Customer existingCustomer =
                customerService.findByEmail(email);

        if (existingCustomer != null) {

            model.addAttribute(
                    "error",
                    "An account already exists with this email.");

            return "register";
        }

        // Create customer
        Customer customer = new Customer();

        customer.setFullName(fullName);
        customer.setEmail(email);
        customer.setMobile(mobile);
        customer.setPassword(password);
        customer.setAddress(address);
        customer.setAadharNumber(aadharNumber);
        customer.setPanNumber(panNumber);

        Customer savedCustomer =
                customerService.register(customer);

        // Create bank account
        Account account = new Account();

        account.setAccountNumber(generateAccountNumber());

        account.setUpiId(
                generateUpiId(email));

        account.setBalance(10000.0);

        account.setCustomer(savedCustomer);

        Account savedAccount =
                accountService.createAccount(account);

        // Connect account with customer
        savedCustomer.setAccount(savedAccount);

        model.addAttribute("email", email);

        return "verify-otp";
    }


    // =========================
    // VERIFY REGISTRATION OTP
    // =========================

    @PostMapping("/verify")
    public String verifyCustomer(
            @RequestParam("email") String email,
            @RequestParam("otp") String otp,
            Model model) {

        boolean verified =
                customerService.verifyCustomer(email, otp);

        if (!verified) {

            model.addAttribute(
                    "error",
                    "Invalid or expired OTP.");

            model.addAttribute(
                    "email",
                    email);

            return "verify-otp";
        }

        return "redirect:/login";
    }


    // =========================
    // LOGIN
    // =========================

    @PostMapping("/login")
    public String login(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            Model model) {

        boolean success =
                customerService.login(email, password);

        if (!success) {

            model.addAttribute(
                    "error",
                    "Invalid email or password.");

            return "login";
        }

        // Generate OTP and send to email
        boolean otpGenerated =
                customerService.generateLoginOtp(email);

        if (!otpGenerated) {

            model.addAttribute(
                    "error",
                    "Unable to generate login OTP.");

            return "login";
        }

        // Send email to OTP page
        model.addAttribute(
                "email",
                email);

        // IMPORTANT:
        // Your JSP file is verify-login-otp.jsp
        return "verify-login-otp";
    }


    // =========================
    // VERIFY LOGIN OTP
    // =========================

    @PostMapping("/verify-login-otp")
    public String verifyLoginOtp(
            @RequestParam("email") String email,
            @RequestParam("otp") String otp,
            HttpSession session,
            Model model) {

        boolean verified =
                customerService.verifyLoginOtp(email, otp);

        if (!verified) {

            model.addAttribute(
                    "error",
                    "Invalid or expired OTP.");

            model.addAttribute(
                    "email",
                    email);

            return "verify-login-otp";
        }

        Customer customer =
                customerService.findByEmail(email);

        if (customer == null) {

            model.addAttribute(
                    "error",
                    "Customer account not found.");

            return "login";
        }

        // Store customer in session
        session.setAttribute(
                "customer",
                customer);

        return "redirect:/dashboard";
    }


    // =========================
    // CUSTOMER DASHBOARD
    // =========================

    @GetMapping("/dashboard")
    public String dashboard(
            HttpSession session,
            Model model) {

        Customer customer =
                (Customer) session.getAttribute("customer");

        if (customer == null) {
            return "redirect:/login";
        }

        // Refresh customer from database
        Customer currentCustomer =
                customerService.findByEmail(
                        customer.getEmail());

        if (currentCustomer == null) {
            session.invalidate();
            return "redirect:/login";
        }

        // Update session with latest customer data
        session.setAttribute(
                "customer",
                currentCustomer);

        // Get recent transactions
        List<BankTransaction> recentTransactions =
                transactionService.getMiniStatement(
                        currentCustomer.getAccount().getId());

        // Dashboard should show only latest 3
        if (recentTransactions.size() > 3) {

            recentTransactions =
                    recentTransactions.subList(0, 3);
        }

        model.addAttribute(
                "recentTransactions",
                recentTransactions);

        return "dashboard";
    }


    // =========================
    // LOGOUT
    // =========================

    @GetMapping("/logout")
    public String logout(
            HttpSession session) {

        session.invalidate();

        return "redirect:/login";
    }


    // =========================
    // ACCOUNT NUMBER
    // =========================

    private String generateAccountNumber() {

        Random random = new Random();

        long number =
                1000000000L
                + (long) (random.nextDouble() * 9000000000L);

        return String.valueOf(number);
    }


    // =========================
    // UPI ID
    // =========================

    private String generateUpiId(String email) {

        String username =
                email.substring(
                        0,
                        email.indexOf("@"));

        return username.toLowerCase()
                + "@smartbank";
    }
}