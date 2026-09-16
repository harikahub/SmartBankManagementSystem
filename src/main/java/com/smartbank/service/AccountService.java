package com.smartbank.service;

import com.smartbank.entity.Account;

public interface AccountService {

    Account createAccount(Account account);

    Account findByAccountNumber(String accountNumber);

    Account findByUpiId(String upiId);
}