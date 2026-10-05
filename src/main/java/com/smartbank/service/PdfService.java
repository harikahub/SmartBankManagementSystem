package com.smartbank.service;

import java.util.List;

import com.smartbank.entity.BankTransaction;

public interface PdfService {

    byte[] generateStatement(
            String customerName,
            String accountNumber,
            List<BankTransaction> transactions
    );
}