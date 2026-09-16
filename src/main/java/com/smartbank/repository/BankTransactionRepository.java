package com.smartbank.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.smartbank.entity.BankTransaction;

public interface BankTransactionRepository
        extends JpaRepository<BankTransaction, Long> {

    List<BankTransaction> findTop10ByAccount_IdOrderByTransactionDateDesc(
            Long accountId);

    List<BankTransaction> findAllByOrderByTransactionDateDesc();
}