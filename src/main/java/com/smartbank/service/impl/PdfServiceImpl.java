package com.smartbank.service.impl;

import java.io.ByteArrayOutputStream;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import org.springframework.stereotype.Service;

import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.smartbank.entity.BankTransaction;
import com.smartbank.service.PdfService;

@Service
public class PdfServiceImpl implements PdfService {

    private static final String RUPEE = "\u20B9";

    // SMARTBANK colors
    private static final java.awt.Color NAVY =
            new java.awt.Color(20, 42, 78);

    private static final java.awt.Color GOLD =
            new java.awt.Color(196, 157, 76);

    private static final java.awt.Color LIGHT_BLUE =
            new java.awt.Color(242, 247, 252);

    private static final java.awt.Color SUMMARY_BLUE =
            new java.awt.Color(235, 243, 251);

    private static final java.awt.Color TABLE_HEADER =
            new java.awt.Color(31, 57, 94);

    private static final java.awt.Color LIGHT_GREEN =
            new java.awt.Color(235, 247, 239);

    private static final java.awt.Color LIGHT_RED =
            new java.awt.Color(252, 238, 238);

    private static final java.awt.Color GREEN =
            new java.awt.Color(30, 125, 67);

    private static final java.awt.Color RED =
            new java.awt.Color(185, 55, 55);

    private static final java.awt.Color DARK_TEXT =
            new java.awt.Color(45, 52, 60);

    private static final java.awt.Color MUTED_TEXT =
            new java.awt.Color(105, 115, 125);

    @Override
    public byte[] generateStatement(
            String customerName,
            String accountNumber,
            List<BankTransaction> transactions) {

        ByteArrayOutputStream outputStream =
                new ByteArrayOutputStream();

        Document document =
                new Document(
                        PageSize.A4,
                        36,
                        36,
                        40,
                        42
                );

        try {

            PdfWriter.getInstance(
                    document,
                    outputStream
            );

            document.open();

            // =========================================
            // FONTS
            // =========================================

            Font bankNameFont =
                    new Font(
                            Font.HELVETICA,
                            21,
                            Font.BOLD,
                            NAVY
                    );

            Font taglineFont =
                    new Font(
                            Font.HELVETICA,
                            8,
                            Font.NORMAL,
                            MUTED_TEXT
                    );

            Font statementFont =
                    new Font(
                            Font.HELVETICA,
                            12,
                            Font.BOLD,
                            NAVY
                    );

            Font generatedFont =
                    new Font(
                            Font.HELVETICA,
                            7,
                            Font.NORMAL,
                            MUTED_TEXT
                    );

            Font sectionFont =
                    new Font(
                            Font.HELVETICA,
                            10,
                            Font.BOLD,
                            NAVY
                    );

            Font labelFont =
                    new Font(
                            Font.HELVETICA,
                            7,
                            Font.BOLD,
                            MUTED_TEXT
                    );

            Font valueFont =
                    new Font(
                            Font.HELVETICA,
                            10,
                            Font.BOLD,
                            DARK_TEXT
                    );

            Font summaryValueFont =
                    new Font(
                            Font.HELVETICA,
                            9,
                            Font.BOLD,
                            NAVY
                    );

            Font tableHeaderFont =
                    new Font(
                            Font.HELVETICA,
                            7,
                            Font.BOLD,
                            java.awt.Color.WHITE
                    );

            Font tableFont =
                    new Font(
                            Font.HELVETICA,
                            7,
                            Font.NORMAL,
                            DARK_TEXT
                    );

            Font creditFont =
                    new Font(
                            Font.HELVETICA,
                            7,
                            Font.BOLD,
                            GREEN
                    );

            Font debitFont =
                    new Font(
                            Font.HELVETICA,
                            7,
                            Font.BOLD,
                            RED
                    );

            Font footerFont =
                    new Font(
                            Font.HELVETICA,
                            7,
                            Font.NORMAL,
                            MUTED_TEXT
                    );

            // =========================================
            // BANK HEADER
            // =========================================

            PdfPTable headerTable =
                    new PdfPTable(2);

            headerTable.setWidthPercentage(100);

            headerTable.setWidths(
                    new float[]{62, 38}
            );

            PdfPCell brandCell =
                    new PdfPCell();

            brandCell.setBorder(
                    Rectangle.NO_BORDER
            );

            brandCell.setPadding(0);

            Paragraph bankName =
                    new Paragraph(
                            "SMARTBANK",
                            bankNameFont
                    );

            bankName.setSpacingAfter(1);

            brandCell.addElement(bankName);

            Paragraph tagline =
                    new Paragraph(
                            "SECURE  •  SIMPLE  •  SMART",
                            taglineFont
                    );

            brandCell.addElement(tagline);

            headerTable.addCell(brandCell);

            PdfPCell statementCell =
                    new PdfPCell();

            statementCell.setBorder(
                    Rectangle.NO_BORDER
            );

            statementCell.setPadding(0);

            statementCell.setHorizontalAlignment(
                    Element.ALIGN_RIGHT
            );

            Paragraph statement =
                    new Paragraph(
                            "ACCOUNT STATEMENT",
                            statementFont
                    );

            statement.setAlignment(
                    Element.ALIGN_RIGHT
            );

            statementCell.addElement(statement);

            Paragraph generated =
                    new Paragraph(
                            "Generated "
                            + LocalDateTime.now().format(
                                    DateTimeFormatter.ofPattern(
                                            "dd MMM yyyy, HH:mm"
                                    )
                            ),
                            generatedFont
                    );

            generated.setAlignment(
                    Element.ALIGN_RIGHT
            );

            generated.setSpacingBefore(3);

            statementCell.addElement(generated);

            headerTable.addCell(statementCell);

            document.add(headerTable);

            // =========================================
            // GOLD ACCENT LINE
            // =========================================

            PdfPTable goldLine =
                    new PdfPTable(1);

            goldLine.setWidthPercentage(100);

            PdfPCell goldCell =
                    new PdfPCell();

            goldCell.setBorder(
                    Rectangle.NO_BORDER
            );

            goldCell.setBackgroundColor(GOLD);

            goldCell.setFixedHeight(3);

            goldCell.setPadding(0);

            goldLine.addCell(goldCell);

            document.add(goldLine);

            // =========================================
            // ACCOUNT INFORMATION
            // =========================================

            Paragraph accountHeading =
                    new Paragraph(
                            "ACCOUNT INFORMATION",
                            sectionFont
                    );

            accountHeading.setSpacingBefore(16);
            accountHeading.setSpacingAfter(7);

            document.add(accountHeading);

            PdfPTable accountTable =
                    new PdfPTable(2);

            accountTable.setWidthPercentage(100);

            accountTable.setWidths(
                    new float[]{50, 50}
            );

            addInfoCell(
                    accountTable,
                    "ACCOUNT HOLDER",
                    customerName,
                    labelFont,
                    valueFont
            );

            addInfoCell(
                    accountTable,
                    "ACCOUNT NUMBER",
                    accountNumber,
                    labelFont,
                    valueFont
            );

            document.add(accountTable);

            // =========================================
            // SORT TRANSACTIONS
            // =========================================

            List<BankTransaction> sortedTransactions =
                    new ArrayList<>();

            if (transactions != null) {
                sortedTransactions.addAll(transactions);
            }

            sortedTransactions.sort(
                    Comparator.comparing(
                            BankTransaction::getTransactionDate
                    )
            );

            // =========================================
            // CALCULATE SUMMARY
            // =========================================

            double totalCredit = 0.0;
            double totalDebit = 0.0;
            double openingBalance = 0.0;
            double closingBalance = 0.0;

            if (!sortedTransactions.isEmpty()) {

                BankTransaction oldest =
                        sortedTransactions.get(0);

                BankTransaction latest =
                        sortedTransactions.get(
                                sortedTransactions.size() - 1
                        );

                double oldestBalance =
                        oldest.getBalanceAfterTransaction();

                double oldestAmount =
                        oldest.getAmount();

                if ("CREDIT".equalsIgnoreCase(
                        oldest.getTransactionType())) {

                    openingBalance =
                            oldestBalance
                            - oldestAmount;

                } else if ("DEBIT".equalsIgnoreCase(
                        oldest.getTransactionType())) {

                    openingBalance =
                            oldestBalance
                            + oldestAmount;

                } else {

                    openingBalance =
                            oldestBalance;
                }

                for (BankTransaction transaction :
                        sortedTransactions) {

                    if ("CREDIT".equalsIgnoreCase(
                            transaction.getTransactionType())) {

                        totalCredit +=
                                transaction.getAmount();

                    } else if ("DEBIT".equalsIgnoreCase(
                            transaction.getTransactionType())) {

                        totalDebit +=
                                transaction.getAmount();
                    }
                }

                closingBalance =
                        latest.getBalanceAfterTransaction();

            } else {

                openingBalance = 0.0;
                closingBalance = 0.0;
            }

            // =========================================
            // ACCOUNT SUMMARY
            // =========================================

            Paragraph summaryHeading =
                    new Paragraph(
                            "ACCOUNT SUMMARY",
                            sectionFont
                    );

            summaryHeading.setSpacingBefore(16);
            summaryHeading.setSpacingAfter(7);

            document.add(summaryHeading);

            PdfPTable summaryTable =
                    new PdfPTable(4);

            summaryTable.setWidthPercentage(100);

            summaryTable.setWidths(
                    new float[]{
                            25, 25, 25, 25
                    }
            );

            addSummaryCell(
                    summaryTable,
                    "OPENING BALANCE",
                    RUPEE + " "
                            + formatAmount(
                                    openingBalance
                            ),
                    labelFont,
                    summaryValueFont,
                    SUMMARY_BLUE
            );

            addSummaryCell(
                    summaryTable,
                    "TOTAL CREDIT",
                    "+ " + RUPEE + " "
                            + formatAmount(
                                    totalCredit
                            ),
                    labelFont,
                    new Font(
                            Font.HELVETICA,
                            9,
                            Font.BOLD,
                            GREEN
                    ),
                    LIGHT_GREEN
            );

            addSummaryCell(
                    summaryTable,
                    "TOTAL DEBIT",
                    "- " + RUPEE + " "
                            + formatAmount(
                                    totalDebit
                            ),
                    labelFont,
                    new Font(
                            Font.HELVETICA,
                            9,
                            Font.BOLD,
                            RED
                    ),
                    LIGHT_RED
            );

            addSummaryCell(
                    summaryTable,
                    "CLOSING BALANCE",
                    RUPEE + " "
                            + formatAmount(
                                    closingBalance
                            ),
                    labelFont,
                    summaryValueFont,
                    SUMMARY_BLUE
            );

            document.add(summaryTable);

            // =========================================
            // STATEMENT PERIOD
            // =========================================

            String period =
                    "No transactions";

            if (!sortedTransactions.isEmpty()) {

                DateTimeFormatter periodFormatter =
                        DateTimeFormatter.ofPattern(
                                "dd MMM yyyy"
                        );

                String start =
                        sortedTransactions
                                .get(0)
                                .getTransactionDate()
                                .format(
                                        periodFormatter
                                );

                String end =
                        sortedTransactions
                                .get(
                                        sortedTransactions.size() - 1
                                )
                                .getTransactionDate()
                                .format(
                                        periodFormatter
                                );

                period =
                        start
                        + "  —  "
                        + end;
            }

            PdfPTable periodTable =
                    new PdfPTable(2);

            periodTable.setWidthPercentage(100);

            periodTable.setWidths(
                    new float[]{25, 75}
            );

            PdfPCell periodLabel =
                    new PdfPCell(
                            new Phrase(
                                    "STATEMENT PERIOD",
                                    labelFont
                            )
                    );

            periodLabel.setBackgroundColor(
                    LIGHT_BLUE
            );

            periodLabel.setBorderColor(
                    new java.awt.Color(
                            220, 228, 236
                    )
            );

            periodLabel.setPadding(8);

            PdfPCell periodValue =
                    new PdfPCell(
                            new Phrase(
                                    period,
                                    valueFont
                            )
                    );

            periodValue.setBackgroundColor(
                    LIGHT_BLUE
            );

            periodValue.setBorderColor(
                    new java.awt.Color(
                            220, 228, 236
                    )
            );

            periodValue.setPadding(8);

            periodTable.addCell(periodLabel);
            periodTable.addCell(periodValue);

            document.add(periodTable);

            // =========================================
            // TRANSACTION HISTORY
            // =========================================

            Paragraph transactionHeading =
                    new Paragraph(
                            "TRANSACTION HISTORY",
                            sectionFont
                    );

            transactionHeading.setSpacingBefore(16);
            transactionHeading.setSpacingAfter(7);

            document.add(transactionHeading);

            PdfPTable transactionTable =
                    new PdfPTable(5);

            transactionTable.setWidthPercentage(100);

            transactionTable.setWidths(
                    new float[]{
                            21,
                            29,
                            13,
                            19,
                            18
                    }
            );

            addHeaderCell(
                    transactionTable,
                    "DATE & TIME",
                    tableHeaderFont
            );

            addHeaderCell(
                    transactionTable,
                    "DESCRIPTION",
                    tableHeaderFont
            );

            addHeaderCell(
                    transactionTable,
                    "TYPE",
                    tableHeaderFont
            );

            addHeaderCell(
                    transactionTable,
                    "AMOUNT",
                    tableHeaderFont
            );

            addHeaderCell(
                    transactionTable,
                    "BALANCE",
                    tableHeaderFont
            );

            if (!sortedTransactions.isEmpty()) {

                DateTimeFormatter transactionFormatter =
                        DateTimeFormatter.ofPattern(
                                "dd MMM yyyy\nHH:mm"
                        );

                for (BankTransaction transaction :
                        sortedTransactions) {

                    String date =
                            transaction
                                    .getTransactionDate()
                                    .format(
                                            transactionFormatter
                                    );

                    String description =
                            transaction.getDescription();

                    String type =
                            transaction.getTransactionType();

                    String amount =
                            formatAmount(
                                    transaction.getAmount()
                            );

                    String balance =
                            formatAmount(
                                    transaction
                                            .getBalanceAfterTransaction()
                            );

                    Font amountFont = tableFont;
                    Font typeFont = tableFont;

                    if ("CREDIT".equalsIgnoreCase(type)) {

                        amount =
                                "+ " + RUPEE + " "
                                + amount;

                        amountFont = creditFont;
                        typeFont = creditFont;

                    } else if ("DEBIT".equalsIgnoreCase(type)) {

                        amount =
                                "- " + RUPEE + " "
                                + amount;

                        amountFont = debitFont;
                        typeFont = debitFont;

                    } else {

                        amount =
                                RUPEE + " "
                                + amount;
                    }

                    addTransactionCell(
                            transactionTable,
                            date,
                            tableFont,
                            Element.ALIGN_LEFT
                    );

                    addTransactionCell(
                            transactionTable,
                            description,
                            tableFont,
                            Element.ALIGN_LEFT
                    );

                    addTransactionCell(
                            transactionTable,
                            type,
                            typeFont,
                            Element.ALIGN_CENTER
                    );

                    addTransactionCell(
                            transactionTable,
                            amount,
                            amountFont,
                            Element.ALIGN_RIGHT
                    );

                    addTransactionCell(
                            transactionTable,
                            RUPEE + " " + balance,
                            tableFont,
                            Element.ALIGN_RIGHT
                    );
                }

            } else {

                PdfPCell emptyCell =
                        new PdfPCell(
                                new Phrase(
                                        "No transactions available",
                                        tableFont
                                )
                        );

                emptyCell.setColspan(5);

                emptyCell.setHorizontalAlignment(
                        Element.ALIGN_CENTER
                );

                emptyCell.setPadding(12);

                transactionTable.addCell(
                        emptyCell
                );
            }

            document.add(transactionTable);

            // =========================================
            // FOOTER
            // =========================================

            PdfPTable footerLine =
                    new PdfPTable(1);

            footerLine.setWidthPercentage(100);

            PdfPCell footerBorder =
                    new PdfPCell();

            footerBorder.setBorder(
                    Rectangle.TOP
            );

            footerBorder.setBorderColor(GOLD);

            footerBorder.setBorderWidthTop(1);

            footerBorder.setPadding(0);

            footerBorder.setFixedHeight(7);

            footerLine.addCell(
                    footerBorder
            );

            document.add(footerLine);

            Paragraph footer =
                    new Paragraph(
                            "SMARTBANK  •  Secure • Simple • Smart",
                            new Font(
                                    Font.HELVETICA,
                                    8,
                                    Font.BOLD,
                                    NAVY
                            )
                    );

            footer.setAlignment(
                    Element.ALIGN_CENTER
            );

            footer.setSpacingBefore(3);

            document.add(footer);

            Paragraph disclaimer =
                    new Paragraph(
                            "This is a computer-generated statement "
                            + "and does not require a signature.",
                            footerFont
                    );

            disclaimer.setAlignment(
                    Element.ALIGN_CENTER
            );

            disclaimer.setSpacingBefore(4);

            document.add(disclaimer);

            Paragraph security =
                    new Paragraph(
                            "Please keep this statement confidential "
                            + "and do not share it with unauthorized persons.",
                            footerFont
                    );

            security.setAlignment(
                    Element.ALIGN_CENTER
            );

            security.setSpacingBefore(2);

            document.add(security);

            document.close();

            return outputStream.toByteArray();

        } catch (Exception e) {

            throw new RuntimeException(
                    "Failed to generate PDF statement",
                    e
            );
        }
    }

    // =========================================
    // INDIAN NUMBER FORMAT
    // =========================================

    private String formatAmount(double amount) {

        DecimalFormat formatter =
                new DecimalFormat(
                        "##,##,##0.00"
                );

        return formatter.format(amount);
    }

    // =========================================
    // ACCOUNT INFORMATION CELL
    // =========================================

    private void addInfoCell(
            PdfPTable table,
            String label,
            String value,
            Font labelFont,
            Font valueFont) {

        PdfPCell cell =
                new PdfPCell();

        cell.setBackgroundColor(
                LIGHT_BLUE
        );

        cell.setBorderColor(
                new java.awt.Color(
                        220, 228, 236
                )
        );

        cell.setPaddingTop(9);
        cell.setPaddingBottom(9);
        cell.setPaddingLeft(10);
        cell.setPaddingRight(10);

        Paragraph labelParagraph =
                new Paragraph(
                        label,
                        labelFont
                );

        labelParagraph.setSpacingAfter(4);

        Paragraph valueParagraph =
                new Paragraph(
                        value == null
                                ? ""
                                : value,
                        valueFont
                );

        cell.addElement(labelParagraph);
        cell.addElement(valueParagraph);

        table.addCell(cell);
    }

    // =========================================
    // SUMMARY CELL
    // =========================================

    private void addSummaryCell(
            PdfPTable table,
            String label,
            String value,
            Font labelFont,
            Font valueFont,
            java.awt.Color background) {

        PdfPCell cell =
                new PdfPCell();

        cell.setBackgroundColor(
                background
        );

        cell.setBorderColor(
                new java.awt.Color(
                        220, 228, 236
                )
        );

        cell.setPaddingTop(9);
        cell.setPaddingBottom(10);
        cell.setPaddingLeft(8);
        cell.setPaddingRight(8);

        Paragraph labelParagraph =
                new Paragraph(
                        label,
                        labelFont
                );

        labelParagraph.setSpacingAfter(5);

        Paragraph valueParagraph =
                new Paragraph(
                        value,
                        valueFont
                );

        cell.addElement(labelParagraph);
        cell.addElement(valueParagraph);

        table.addCell(cell);
    }

    // =========================================
    // TABLE HEADER CELL
    // =========================================

    private void addHeaderCell(
            PdfPTable table,
            String text,
            Font font) {

        PdfPCell cell =
                new PdfPCell(
                        new Phrase(
                                text,
                                font
                        )
                );

        cell.setBackgroundColor(
                TABLE_HEADER
        );

        cell.setBorderColor(
                TABLE_HEADER
        );

        cell.setHorizontalAlignment(
                Element.ALIGN_CENTER
        );

        cell.setVerticalAlignment(
                Element.ALIGN_MIDDLE
        );

        cell.setPaddingTop(7);
        cell.setPaddingBottom(7);

        table.addCell(cell);
    }

    // =========================================
    // TRANSACTION CELL
    // =========================================

    private void addTransactionCell(
            PdfPTable table,
            String text,
            Font font,
            int alignment) {

        PdfPCell cell =
                new PdfPCell(
                        new Phrase(
                                text == null
                                        ? ""
                                        : text,
                                font
                        )
                );

        cell.setHorizontalAlignment(
                alignment
        );

        cell.setVerticalAlignment(
                Element.ALIGN_MIDDLE
        );

        cell.setPaddingTop(6);
        cell.setPaddingBottom(6);
        cell.setPaddingLeft(5);
        cell.setPaddingRight(5);

        cell.setBorderColor(
                new java.awt.Color(
                        225, 230, 235
                )
        );

        table.addCell(cell);
    }
}
