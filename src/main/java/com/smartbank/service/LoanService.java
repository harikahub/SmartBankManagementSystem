package com.smartbank.service;

import java.util.List;

import com.smartbank.entity.Loan;

public interface LoanService {

    Loan applyLoan(Loan loan);

    List<Loan> getCustomerLoans(Long customerId);

    List<Loan> getPendingLoans();

    void updateLoanStatus(Long loanId, String status);
}