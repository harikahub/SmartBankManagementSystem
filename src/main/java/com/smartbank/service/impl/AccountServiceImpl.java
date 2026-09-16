package com.smartbank.service.impl;

import java.util.Random;

import org.springframework.stereotype.Service;

import com.smartbank.entity.Account;
import com.smartbank.repository.AccountRepository;
import com.smartbank.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService {

    private final AccountRepository accountRepository;

    public AccountServiceImpl(
            AccountRepository accountRepository) {

        this.accountRepository = accountRepository;
    }

    @Override
    public Account createAccount(Account account) {

        String accountNumber =
                "SB" +
                (10000000 + new Random().nextInt(90000000));

        String upiId =
                accountNumber.toLowerCase()
                + "@smartbank";

        account.setAccountNumber(accountNumber);
        account.setUpiId(upiId);
        account.setBalance(0.0);

        return accountRepository.save(account);
    }

    @Override
    public Account findByAccountNumber(
            String accountNumber) {

        return accountRepository
                .findByAccountNumber(accountNumber)
                .orElse(null);
    }

    @Override
    public Account findByUpiId(String upiId) {

        return accountRepository
                .findByUpiId(upiId)
                .orElse(null);
    }
}