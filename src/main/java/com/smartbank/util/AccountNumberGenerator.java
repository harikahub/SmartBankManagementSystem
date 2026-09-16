package com.smartbank.util;

import java.util.Random;

public class AccountNumberGenerator {

    private AccountNumberGenerator() {
    }

    public static String generateAccountNumber() {

        return "SB" +
                (10000000 + new Random().nextInt(90000000));
    }

    public static String generateUpiId(
            String accountNumber) {

        return accountNumber.toLowerCase()
                + "@smartbank";
    }
}