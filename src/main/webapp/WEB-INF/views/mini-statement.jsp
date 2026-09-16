<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Mini Statement - Smart Bank</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f5f7fb;
            color: #1f2937;
        }

        .container {
            width: 92%;
            max-width: 1150px;
            margin: 40px auto;
        }

        /* Header */

        .header {
            background: linear-gradient(135deg, #0d47a1, #1565c0);
            color: white;
            padding: 30px;
            border-radius: 16px;
            margin-bottom: 25px;
            box-shadow: 0 8px 25px rgba(13, 71, 161, 0.18);
        }

        .header h1 {
            margin: 0 0 8px;
            font-size: 30px;
        }

        .header p {
            margin: 0;
            opacity: 0.9;
            font-size: 15px;
        }

        /* Success Message */

        .success {
            background: #e8f5e9;
            color: #2e7d32;
            padding: 14px 18px;
            border-radius: 10px;
            margin-bottom: 20px;
            border-left: 5px solid #43a047;
            font-size: 14px;
        }

        /* Account Card */

        .account-info {
            background: white;
            padding: 22px;
            border-radius: 14px;
            margin-bottom: 25px;
            box-shadow: 0 4px 18px rgba(0, 0, 0, 0.06);
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
        }

        .account-details {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .account-label {
            color: #6b7280;
            font-size: 13px;
        }

        .account-number {
            font-size: 18px;
            font-weight: bold;
            color: #0d47a1;
        }

        .balance-box {
            text-align: right;
        }

        .balance-label {
            color: #6b7280;
            font-size: 13px;
            margin-bottom: 5px;
        }

        .balance {
            font-size: 24px;
            font-weight: bold;
            color: #1b5e20;
        }

        /* Statement Section */

        .statement-card {
            background: white;
            border-radius: 14px;
            padding: 22px;
            box-shadow: 0 4px 18px rgba(0, 0, 0, 0.06);
            overflow: hidden;
        }

        .statement-title {
            margin: 0 0 18px;
            color: #0d47a1;
            font-size: 20px;
        }

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 750px;
        }

        th {
            background: #0d47a1;
            color: white;
            padding: 14px;
            text-align: left;
            font-size: 14px;
            white-space: nowrap;
        }

        td {
            padding: 14px;
            border-bottom: 1px solid #edf0f4;
            font-size: 14px;
        }

        tbody tr:hover {
            background: #f8faff;
        }

        tbody tr:last-child td {
            border-bottom: none;
        }

        /* Transaction Type */

        .type-badge {
            display: inline-block;
            padding: 6px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }

        .debit {
            color: #c62828;
            background: #ffebee;
        }

        .credit {
            color: #2e7d32;
            background: #e8f5e9;
        }

        /* Amount */

        .amount {
            font-weight: bold;
            white-space: nowrap;
        }

        .debit-amount {
            color: #c62828;
        }

        .credit-amount {
            color: #2e7d32;
        }

        .balance-after {
            font-weight: 600;
            white-space: nowrap;
        }

        /* Empty State */

        .empty {
            text-align: center;
            padding: 55px 20px;
            background: white;
            border-radius: 14px;
            box-shadow: 0 4px 18px rgba(0, 0, 0, 0.06);
        }

        .empty-icon {
            font-size: 42px;
            margin-bottom: 12px;
        }

        .empty h3 {
            margin: 0 0 8px;
            color: #374151;
        }

        .empty p {
            margin: 0;
            color: #6b7280;
        }

        /* Buttons */

        .actions {
            display: flex;
            gap: 12px;
            margin-top: 25px;
            flex-wrap: wrap;
        }

        .button {
            display: inline-block;
            padding: 12px 20px;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            transition: 0.2s;
        }

        .email-button {
            background: #1565c0;
        }

        .email-button:hover {
            background: #0d47a1;
        }

        .back-button {
            background: #374151;
        }

        .back-button:hover {
            background: #1f2937;
        }

        /* Responsive */

        @media (max-width: 700px) {

            .container {
                width: 94%;
                margin: 25px auto;
            }

            .header {
                padding: 24px;
            }

            .header h1 {
                font-size: 25px;
            }

            .account-info {
                flex-direction: column;
                align-items: flex-start;
            }

            .balance-box {
                text-align: left;
            }

            .statement-card {
                padding: 15px;
            }

            .actions {
                flex-direction: column;
            }

            .button {
                text-align: center;
                width: 100%;
            }
        }

    </style>

</head>

<body>

<div class="container">

    <!-- Header -->

    <div class="header">

        <h1>Mini Statement</h1>

        <p>View your latest 10 account transactions</p>

    </div>


    <!-- Email Success Message -->

    <c:if test="${param.emailSent == 'true'}">

        <div class="success">

            ✓ Mini statement email request sent successfully.

        </div>

    </c:if>


    <!-- Account Information -->

    <div class="account-info">

        <div class="account-details">

            <span class="account-label">
                ACCOUNT NUMBER
            </span>

            <span class="account-number">
                ${account.accountNumber}
            </span>

        </div>


        <div class="balance-box">

            <div class="balance-label">
                CURRENT BALANCE
            </div>

            <div class="balance">
                ₹${account.balance}
            </div>

        </div>

    </div>


    <!-- Transactions -->

    <c:choose>

        <c:when test="${not empty transactions}">

            <div class="statement-card">

                <h2 class="statement-title">
                    Recent Transactions
                </h2>

                <div class="table-wrapper">

                    <table>

                        <thead>

                        <tr>

                            <th>Date & Time</th>

                            <th>Type</th>

                            <th>Amount</th>

                            <th>Description</th>

                            <th>Balance After</th>

                        </tr>

                        </thead>


                        <tbody>

                        <c:forEach
                                var="transaction"
                                items="${transactions}">

                            <tr>

                                <td>
                                    ${transaction.transactionDate}
                                </td>


                                <td>

                                    <c:choose>

                                        <c:when
                                                test="${transaction.transactionType == 'DEBIT'}">

                                            <span class="type-badge debit">
                                                DEBIT
                                            </span>

                                        </c:when>


                                        <c:otherwise>

                                            <span class="type-badge credit">
                                                CREDIT
                                            </span>

                                        </c:otherwise>

                                    </c:choose>

                                </td>


                                <td>

                                    <c:choose>

                                        <c:when
                                                test="${transaction.transactionType == 'DEBIT'}">

                                            <span class="amount debit-amount">
                                                - ₹${transaction.amount}
                                            </span>

                                        </c:when>


                                        <c:otherwise>

                                            <span class="amount credit-amount">
                                                + ₹${transaction.amount}
                                            </span>

                                        </c:otherwise>

                                    </c:choose>

                                </td>


                                <td>
                                    ${transaction.description}
                                </td>


                                <td>

                                    <span class="balance-after">
                                        ₹${transaction.balanceAfterTransaction}
                                    </span>

                                </td>

                            </tr>

                        </c:forEach>

                        </tbody>

                    </table>

                </div>

            </div>

        </c:when>


        <c:otherwise>

            <div class="empty">

                <div class="empty-icon">
                    📄
                </div>

                <h3>
                    No transactions yet
                </h3>

                <p>
                    Your transaction history will appear here.
                </p>

            </div>

        </c:otherwise>

    </c:choose>


    <!-- Actions -->

    <div class="actions">

        <a
                href="${pageContext.request.contextPath}/mini-statement/email"
                class="button email-button">

            📧 Send Statement to Email

        </a>


        <a
                href="${pageContext.request.contextPath}/dashboard"
                class="button back-button">

            ← Back to Dashboard

        </a>

    </div>

</div>

</body>

</html>