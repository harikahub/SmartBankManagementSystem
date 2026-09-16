package com.smartbank.service.impl;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Service;

import com.smartbank.entity.Loan;
import com.smartbank.repository.LoanRepository;
import com.smartbank.service.LoanService;

@Service
public class LoanServiceImpl
        implements LoanService {

    private final LoanRepository loanRepository;

    public LoanServiceImpl(
            LoanRepository loanRepository) {

        this.loanRepository = loanRepository;
    }

    @Override
    public Loan applyLoan(Loan loan) {

        loan.setStatus("PENDING");

        loan.setAppliedDate(
                LocalDateTime.now());

        return loanRepository.save(loan);
    }

    @Override
    public List<Loan> getCustomerLoans(
            Long customerId) {

        return loanRepository
                .findByCustomer_Id(customerId);
    }

    @Override
    public List<Loan> getPendingLoans() {

        return loanRepository
                .findByStatus("PENDING");
    }

    @Override
    public void updateLoanStatus(
            Long loanId,
            String status) {

        Loan loan =
                loanRepository
                .findById(loanId)
                .orElse(null);

        if (loan != null) {

            loan.setStatus(status);

            loanRepository.save(loan);
        }
    }
}