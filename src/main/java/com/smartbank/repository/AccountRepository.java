package com.smartbank.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.smartbank.entity.Account;

public interface AccountRepository extends JpaRepository<Account, Long> {

    Optional<Account> findByAccountNumber(String accountNumber);

    Optional<Account> findByUpiId(String upiId);
}