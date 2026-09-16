package com.smartbank.service;

import java.util.List;

import com.smartbank.entity.BankTransaction;

public interface TransactionService {

    boolean transfer(String senderAccount,
                    String receiverAccount,
                    double amount);

    boolean transferByUpi(String senderAccount,
                          String receiverUpiId,
                          double amount);

    List<BankTransaction> getMiniStatement(Long accountId);

    List<BankTransaction> getAllTransactions();
}