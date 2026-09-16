package com.smartbank.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.smartbank.entity.Loan;

public interface LoanRepository extends JpaRepository<Loan, Long> {

    List<Loan> findByCustomer_Id(Long customerId);

    List<Loan> findByStatus(String status);
}