package com.smartbank.service.impl;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.smartbank.entity.Account;
import com.smartbank.entity.BankTransaction;
import com.smartbank.repository.AccountRepository;
import com.smartbank.repository.BankTransactionRepository;
import com.smartbank.service.TransactionService;

@Service
public class TransactionServiceImpl
        implements TransactionService {

    private final AccountRepository accountRepository;
    private final BankTransactionRepository transactionRepository;

    public TransactionServiceImpl(
            AccountRepository accountRepository,
            BankTransactionRepository transactionRepository) {

        this.accountRepository = accountRepository;
        this.transactionRepository = transactionRepository;
    }

    @Override
    @Transactional
    public boolean transfer(
            String senderAccount,
            String receiverAccount,
            double amount) {

        Account sender =
                accountRepository
                .findByAccountNumber(senderAccount)
                .orElse(null);

        Account receiver =
                accountRepository
                .findByAccountNumber(receiverAccount)
                .orElse(null);

        if (sender == null || receiver == null) {
            return false;
        }

        if (sender.getId().equals(receiver.getId())) {
            return false;
        }

        if (amount <= 0 ||
                sender.getBalance() < amount) {

            return false;
        }

        sender.setBalance(
                sender.getBalance() - amount);

        receiver.setBalance(
                receiver.getBalance() + amount);

        accountRepository.save(sender);
        accountRepository.save(receiver);

        // Debit transaction

        BankTransaction debit =
                new BankTransaction();

        debit.setAccount(sender);
        debit.setTransactionType("DEBIT");
        debit.setAmount(amount);
        debit.setDescription("Fund Transfer");
        debit.setSenderAccount(senderAccount);
        debit.setReceiverAccount(receiverAccount);
        debit.setTransactionDate(
                LocalDateTime.now());
        debit.setBalanceAfterTransaction(
                sender.getBalance());

        transactionRepository.save(debit);

        // Credit transaction

        BankTransaction credit =
                new BankTransaction();

        credit.setAccount(receiver);
        credit.setTransactionType("CREDIT");
        credit.setAmount(amount);
        credit.setDescription("Fund Transfer");
        credit.setSenderAccount(senderAccount);
        credit.setReceiverAccount(receiverAccount);
        credit.setTransactionDate(
                LocalDateTime.now());
        credit.setBalanceAfterTransaction(
                receiver.getBalance());

        transactionRepository.save(credit);

        return true;
    }

    @Override
    @Transactional
    public boolean transferByUpi(
            String senderAccount,
            String receiverUpiId,
            double amount) {

        Account sender =
                accountRepository
                .findByAccountNumber(senderAccount)
                .orElse(null);

        Account receiver =
                accountRepository
                .findByUpiId(receiverUpiId)
                .orElse(null);

        if (sender == null || receiver == null) {
            return false;
        }

        if (sender.getId().equals(receiver.getId())) {
            return false;
        }

        if (amount <= 0 ||
                sender.getBalance() < amount) {

            return false;
        }

        sender.setBalance(
                sender.getBalance() - amount);

        receiver.setBalance(
                receiver.getBalance() + amount);

        accountRepository.save(sender);
        accountRepository.save(receiver);

        // Debit transaction

        BankTransaction debit =
                new BankTransaction();

        debit.setAccount(sender);
        debit.setTransactionType("DEBIT");
        debit.setAmount(amount);
        debit.setDescription("UPI Fund Transfer");
        debit.setSenderAccount(senderAccount);
        debit.setReceiverAccount(
                receiver.getAccountNumber());
        debit.setTransactionDate(
                LocalDateTime.now());
        debit.setBalanceAfterTransaction(
                sender.getBalance());

        transactionRepository.save(debit);

        // Credit transaction

        BankTransaction credit =
                new BankTransaction();

        credit.setAccount(receiver);
        credit.setTransactionType("CREDIT");
        credit.setAmount(amount);
        credit.setDescription("UPI Fund Transfer");
        credit.setSenderAccount(senderAccount);
        credit.setReceiverAccount(
                receiver.getAccountNumber());
        credit.setTransactionDate(
                LocalDateTime.now());
        credit.setBalanceAfterTransaction(
                receiver.getBalance());

        transactionRepository.save(credit);

        return true;
    }

    @Override
    public List<BankTransaction> getMiniStatement(
            Long accountId) {

        return transactionRepository
                .findTop10ByAccount_IdOrderByTransactionDateDesc(
                        accountId);
    }

    @Override
    public List<BankTransaction> getAllTransactions() {

        return transactionRepository
                .findAllByOrderByTransactionDateDesc();
    }
}