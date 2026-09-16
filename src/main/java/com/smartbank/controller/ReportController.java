package com.smartbank.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smartbank.entity.BankTransaction;
import com.smartbank.service.TransactionService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ReportController {

    private final TransactionService transactionService;

    public ReportController(TransactionService transactionService) {
        this.transactionService = transactionService;
    }

    @GetMapping("/admin/reports")
    public String reports(
            @RequestParam(value = "type", required = false) String type,
            @RequestParam(value = "month", required = false) Integer month,
            @RequestParam(value = "year", required = false) Integer year,
            HttpSession session,
            Model model) {

        if (session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }

        List<BankTransaction> allTransactions =
                transactionService.getAllTransactions();

        List<BankTransaction> transactions =
                new ArrayList<>();

        for (BankTransaction transaction : allTransactions) {

            LocalDateTime date =
                    transaction.getTransactionDate();

            boolean include = true;

            if ("MONTHLY".equals(type)) {

                if (month == null || year == null) {
                    include = false;
                } else {
                    include =
                            date.getMonthValue() == month
                            && date.getYear() == year;
                }

            } else if ("ANNUAL".equals(type)) {

                if (year == null) {
                    include = false;
                } else {
                    include = date.getYear() == year;
                }
            }

            if (include) {
                transactions.add(transaction);
            }
        }

        double totalCredit = 0;
        double totalDebit = 0;

        for (BankTransaction transaction : transactions) {

            if ("CREDIT".equals(transaction.getTransactionType())) {
                totalCredit += transaction.getAmount();
            }

            if ("DEBIT".equals(transaction.getTransactionType())) {
                totalDebit += transaction.getAmount();
            }
        }

        double totalAmount =
                totalCredit + totalDebit;

        model.addAttribute("transactions", transactions);
        model.addAttribute("totalCredit", totalCredit);
        model.addAttribute("totalDebit", totalDebit);
        model.addAttribute("totalAmount", totalAmount);

        model.addAttribute("selectedType", type);
        model.addAttribute("selectedMonth", month);
        model.addAttribute("selectedYear", year);

        return "admin-reports";
    }
}