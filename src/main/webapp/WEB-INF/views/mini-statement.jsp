<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>SmartBank - Mini Statement</title>

<style>

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    font-family: Arial, Helvetica, sans-serif;
    min-height: 100vh;

    background:
        radial-gradient(circle at top left, #d8f5f2, transparent 35%),
        radial-gradient(circle at bottom right, #dcecff, transparent 35%),
        linear-gradient(135deg, #eefbfa, #edf4ff);

    color: #17324d;
    padding: 30px;
}

/* =========================
   MAIN CONTAINER
========================= */

.container {
    max-width: 1150px;
    margin: 0 auto;
}

/* =========================
   HEADER
========================= */

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 25px;
}

.brand {
    font-size: 30px;
    font-weight: bold;
    color: #007c91;
    letter-spacing: 0.5px;
}

.brand span {
    color: #00a6a6;
}

.back-btn {
    text-decoration: none;
    background: white;
    color: #007c91;

    padding: 11px 20px;

    border-radius: 12px;

    font-weight: bold;

    box-shadow:
        0 6px 18px rgba(0, 90, 120, 0.10);

    transition: 0.3s;
}

.back-btn:hover {
    transform: translateY(-2px);

    box-shadow:
        0 10px 22px rgba(0, 90, 120, 0.16);
}

/* =========================
   MAIN CARD
========================= */

.card {
    background: rgba(255, 255, 255, 0.94);

    border-radius: 25px;

    padding: 32px;

    box-shadow:
        0 20px 50px rgba(0, 90, 120, 0.13);

    border: 1px solid rgba(255, 255, 255, 0.7);

    backdrop-filter: blur(12px);
}

/* =========================
   TITLE
========================= */

.title {
    text-align: center;

    font-size: 31px;

    color: #006d82;

    margin-bottom: 8px;
}

.subtitle {
    text-align: center;

    color: #64748b;

    margin-bottom: 28px;

    font-size: 15px;
}

/* =========================
   SUCCESS MESSAGE
========================= */

.success-message {
    display: flex;

    align-items: center;
    justify-content: center;

    gap: 10px;

    background: linear-gradient(
        135deg,
        #e8f8ef,
        #f1fff6
    );

    border: 1px solid #9adbb5;

    color: #176b3a;

    padding: 15px 20px;

    border-radius: 14px;

    margin-bottom: 24px;

    text-align: center;

    font-weight: bold;

    box-shadow:
        0 7px 18px rgba(23, 107, 58, 0.08);

    animation: successAnimation 0.4s ease;
}

@keyframes successAnimation {

    from {
        opacity: 0;
        transform: translateY(-8px);
    }

    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.success-icon {
    width: 27px;
    height: 27px;

    display: flex;
    align-items: center;
    justify-content: center;

    border-radius: 50%;

    background: #198754;

    color: white;

    font-size: 15px;

    flex-shrink: 0;
}

/* =========================
   ERROR MESSAGE
========================= */

.error-message {
    display: flex;

    align-items: center;
    justify-content: center;

    gap: 10px;

    background: #fff1f1;

    border: 1px solid #efaaaa;

    color: #a52a2a;

    padding: 15px 20px;

    border-radius: 14px;

    margin-bottom: 24px;

    text-align: center;

    font-weight: bold;
}

/* =========================
   ACCOUNT INFO
========================= */

.account-info {
    display: grid;

    grid-template-columns:
        repeat(auto-fit, minmax(220px, 1fr));

    gap: 16px;

    margin-bottom: 28px;
}

.info-box {
    background:
        linear-gradient(
            135deg,
            #e7f8f8,
            #f4fbff
        );

    padding: 19px;

    border-radius: 17px;

    border: 1px solid #d5edf2;

    box-shadow:
        0 6px 15px rgba(0, 90, 120, 0.06);

    transition: 0.3s;
}

.info-box:hover {
    transform: translateY(-3px);

    box-shadow:
        0 10px 22px rgba(0, 90, 120, 0.10);
}

.info-label {
    font-size: 12px;

    color: #64748b;

    margin-bottom: 7px;

    text-transform: uppercase;

    letter-spacing: 0.5px;
}

.info-value {
    font-size: 17px;

    font-weight: bold;

    color: #17445a;

    word-break: break-word;
}

/* =========================
   EMAIL SECTION
========================= */

.email-section {
    display: flex;

    justify-content: flex-end;

    margin-bottom: 22px;
}

.email-form {
    margin: 0;
}

.email-btn {
    border: none;

    cursor: pointer;

    background:
        linear-gradient(
            135deg,
            #007c91,
            #00a6a6
        );

    color: white;

    padding: 14px 24px;

    border-radius: 13px;

    font-size: 15px;

    font-weight: bold;

    box-shadow:
        0 8px 20px rgba(0, 124, 145, 0.25);

    transition: 0.3s;
}

.email-btn:hover {
    transform: translateY(-2px);

    box-shadow:
        0 12px 25px rgba(0, 124, 145, 0.32);
}

.email-btn:active {
    transform: translateY(0);
}

/* =========================
   TABLE
========================= */

.table-wrapper {
    width: 100%;

    overflow-x: auto;

    border-radius: 17px;

    border: 1px solid #e1ebef;
}

table {
    width: 100%;

    border-collapse: collapse;

    min-width: 780px;
}

thead {
    background:
        linear-gradient(
            135deg,
            #006d82,
            #008fa3
        );

    color: white;
}

th {
    padding: 16px 13px;

    text-align: left;

    font-size: 13px;

    letter-spacing: 0.2px;
}

td {
    padding: 15px 13px;

    border-bottom: 1px solid #e6eef2;

    font-size: 14px;

    background: white;
}

tbody tr {
    transition: 0.2s;
}

tbody tr:hover td {
    background: #f3fbfd;
}

/* =========================
   TRANSACTION TYPES
========================= */

.credit {
    display: inline-block;

    background: #e8f8ef;

    color: #168548;

    padding: 6px 10px;

    border-radius: 20px;

    font-size: 12px;

    font-weight: bold;
}

.debit {
    display: inline-block;

    background: #fff0f0;

    color: #c0392b;

    padding: 6px 10px;

    border-radius: 20px;

    font-size: 12px;

    font-weight: bold;
}

.amount {
    font-weight: bold;
}

/* =========================
   NO DATA
========================= */

.no-data {
    text-align: center;

    padding: 40px;

    color: #64748b;

    font-size: 16px;
}

/* =========================
   FOOTER
========================= */

.footer {
    text-align: center;

    margin-top: 25px;

    color: #64748b;

    font-size: 13px;
}

/* =========================
   MOBILE
========================= */

@media (max-width: 700px) {

    body {
        padding: 15px;
    }

    .card {
        padding: 20px;
    }

    .header {
        flex-direction: column;

        gap: 15px;
    }

    .brand {
        font-size: 26px;
    }

    .title {
        font-size: 26px;
    }

    .email-section {
        justify-content: center;
    }

    .email-btn {
        width: 100%;
    }

    .success-message,
    .error-message {
        font-size: 13px;
    }

}

</style>

</head>

<body>

<div class="container">

    <!-- =========================
         HEADER
    ========================== -->

    <div class="header">

        <div class="brand">
            🏦 Smart<span>Bank</span>
        </div>

        <a
            href="${pageContext.request.contextPath}/dashboard"
            class="back-btn">

            ← Dashboard

        </a>

    </div>


    <!-- =========================
         MAIN CARD
    ========================== -->

    <div class="card">

        <h1 class="title">
            Mini Statement
        </h1>

        <p class="subtitle">
            View your latest account transactions
            and send your statement securely to email.
        </p>


        <!-- =========================
             SUCCESS MESSAGE
        ========================== -->

        <c:if test="${not empty message}">

            <div class="success-message">

                <span class="success-icon">
                    ✓
                </span>

                <span>
                    ${message}
                </span>

            </div>

        </c:if>


        <!-- =========================
             ERROR MESSAGE
        ========================== -->

        <c:if test="${not empty error}">

            <div class="error-message">

                <span>
                    ✕
                </span>

                <span>
                    ${error}
                </span>

            </div>

        </c:if>


        <!-- =========================
             ACCOUNT DETAILS
        ========================== -->

        <div class="account-info">

            <div class="info-box">

                <div class="info-label">
                    Customer Name
                </div>

                <div class="info-value">
                    ${customer.fullName}
                </div>

            </div>


            <div class="info-box">

                <div class="info-label">
                    Account Number
                </div>

                <div class="info-value">
                    ${account.accountNumber}
                </div>

            </div>


            <div class="info-box">

                <div class="info-label">
                    UPI ID
                </div>

                <div class="info-value">
                    ${account.upiId}
                </div>

            </div>


            <div class="info-box">

                <div class="info-label">
                    Current Balance
                </div>

                <div class="info-value">
                    ₹ ${account.balance}
                </div>

            </div>

        </div>


        <!-- =========================
             SEND EMAIL BUTTON
        ========================== -->

        <div class="email-section">

            <form
                method="post"
                action="${pageContext.request.contextPath}/mini-statement/email"
                class="email-form">

                <button
                    type="submit"
                    class="email-btn">

                    📧 Send Statement to Email

                </button>

            </form>

        </div>


        <!-- =========================
             TRANSACTIONS
        ========================== -->

        <div class="table-wrapper">

            <c:choose>

                <c:when test="${not empty transactions}">

                    <table>

                        <thead>

                            <tr>

                                <th>
                                    Date & Time
                                </th>

                                <th>
                                    Type
                                </th>

                                <th>
                                    Description
                                </th>

                                <th>
                                    Amount
                                </th>

                                <th>
                                    Balance
                                </th>

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
                                                test="${transaction.transactionType == 'CREDIT'}">

                                                <span class="credit">
                                                    CREDIT
                                                </span>

                                            </c:when>


                                            <c:otherwise>

                                                <span class="debit">
                                                    DEBIT
                                                </span>

                                            </c:otherwise>

                                        </c:choose>

                                    </td>


                                    <td>
                                        ${transaction.description}
                                    </td>


                                    <td class="amount">

                                        ₹ ${transaction.amount}

                                    </td>


                                    <td class="amount">

                                        ₹ ${transaction.balanceAfterTransaction}

                                    </td>

                                </tr>

                            </c:forEach>

                        </tbody>

                    </table>

                </c:when>


                <c:otherwise>

                    <div class="no-data">

                        No transactions available.

                    </div>

                </c:otherwise>

            </c:choose>

        </div>

    </div>


    <!-- =========================
         FOOTER
    ========================== -->

    <div class="footer">

        SmartBank © 2026
        &nbsp;|&nbsp;
        Secure • Simple • Smart

    </div>

</div>

</body>

</html>
