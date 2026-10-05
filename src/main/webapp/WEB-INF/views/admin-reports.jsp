<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Reports | SmartBank</title>

<style>

    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        font-family: Arial, sans-serif;
        color: #17243a;
        min-height: 100vh;

        background:
            radial-gradient(circle at 8% 8%, rgba(22,135,247,0.18), transparent 28%),
            radial-gradient(circle at 92% 18%, rgba(0,195,190,0.16), transparent 28%),
            linear-gradient(135deg, #eef7ff, #f7fbff 45%, #edfafa);
    }

    /* ================= HEADER ================= */

    .header {
        position: sticky;
        top: 0;
        z-index: 100;

        padding: 17px 5%;

        display: flex;
        justify-content: space-between;
        align-items: center;

        color: white;

        background:
            linear-gradient(135deg, #061b38, #0b4ea2 55%, #087f91);

        box-shadow:
            0 12px 35px rgba(7,44,91,0.25);
    }

    .brand {
        display: flex;
        align-items: center;
        gap: 13px;
    }

    .brand-icon {
        width: 45px;
        height: 45px;

        display: flex;
        align-items: center;
        justify-content: center;

        border-radius: 14px;

        font-size: 22px;

        background: rgba(255,255,255,0.14);
        border: 1px solid rgba(255,255,255,0.22);

        box-shadow:
            inset 0 1px 0 rgba(255,255,255,0.25),
            0 8px 20px rgba(0,0,0,0.18);
    }

    .brand h2 {
        margin: 0;
        font-size: 21px;
    }

    .brand p {
        margin: 3px 0 0;
        font-size: 12px;
        opacity: 0.72;
    }

    .logout {
        padding: 10px 18px;

        color: white;
        text-decoration: none;

        font-size: 13px;
        font-weight: bold;

        border-radius: 11px;

        background: rgba(255,255,255,0.12);
        border: 1px solid rgba(255,255,255,0.25);

        transition: 0.25s ease;
    }

    .logout:hover {
        color: #07519f;
        background: white;
        transform: translateY(-2px);

        box-shadow: 0 8px 20px rgba(0,0,0,0.18);
    }

    /* ================= MAIN ================= */

    .container {
        width: 94%;
        max-width: 1450px;
        margin: 42px auto;
    }

    .page-heading {
        margin-bottom: 25px;
    }

    .eyebrow {
        display: inline-flex;
        align-items: center;
        gap: 7px;

        padding: 7px 13px;
        margin-bottom: 12px;

        border-radius: 20px;

        color: #075fa7;
        background: rgba(255,255,255,0.65);

        border: 1px solid rgba(33,142,220,0.18);

        font-size: 12px;
        font-weight: bold;
        letter-spacing: 0.4px;

        box-shadow:
            0 6px 18px rgba(18,92,145,0.08);
    }

    .page-heading h1 {
        margin: 0 0 8px;

        color: #082b57;

        font-size: 30px;
        letter-spacing: -0.5px;
    }

    .page-heading p {
        margin: 0;

        color: #68788d;
        font-size: 14px;
    }

    /* ================= FILTER GLASS CARD ================= */

    .filters {
        position: relative;
        overflow: hidden;

        padding: 27px;

        margin-bottom: 30px;

        border-radius: 23px;

        background: rgba(255,255,255,0.72);

        border: 1px solid rgba(255,255,255,0.85);

        box-shadow:
            0 20px 50px rgba(18,68,108,0.10),
            inset 0 1px 0 rgba(255,255,255,0.8);

        backdrop-filter: blur(16px);
    }

    .filters::after {
        content: "";

        position: absolute;

        width: 170px;
        height: 170px;

        right: -70px;
        top: -95px;

        border-radius: 50%;

        background: rgba(0,191,190,0.10);

        pointer-events: none;
    }

    .filter-heading {
        position: relative;
        z-index: 2;

        display: flex;
        align-items: center;
        gap: 11px;

        margin-bottom: 21px;
    }

    .filter-icon {
        width: 40px;
        height: 40px;

        display: flex;
        align-items: center;
        justify-content: center;

        border-radius: 12px;

        background: linear-gradient(135deg, #0b5dcc, #06a6a6);

        box-shadow:
            0 8px 18px rgba(8,104,175,0.20);
    }

    .filter-heading h3 {
        margin: 0;

        color: #172f4d;
        font-size: 19px;
    }

    .filter-heading span {
        display: block;

        margin-top: 3px;

        color: #7b8b9d;
        font-size: 12px;
    }

    .filter-row {
        position: relative;
        z-index: 2;

        display: flex;
        gap: 15px;
        align-items: flex-end;
        flex-wrap: wrap;
    }

    .filter-group {
        display: flex;
        flex-direction: column;
    }

    .filter-group label {
        margin-bottom: 7px;

        color: #475467;

        font-size: 12px;
        font-weight: bold;
    }

    select {
        min-width: 175px;

        padding: 12px 13px;

        color: #344054;

        background: rgba(255,255,255,0.9);

        border: 1px solid #d6e1ec;

        border-radius: 10px;

        font-size: 13px;

        cursor: pointer;

        transition: 0.2s ease;
    }

    select:focus {
        outline: none;

        border-color: #1687f7;

        box-shadow:
            0 0 0 3px rgba(22,135,247,0.10);
    }

    button,
    .all-button {
        display: inline-flex;
        align-items: center;
        justify-content: center;

        min-height: 42px;

        padding: 11px 18px;

        border: none;
        border-radius: 10px;

        color: white;

        background:
            linear-gradient(135deg, #0b5dcc, #087f91);

        font-size: 13px;
        font-weight: bold;

        text-decoration: none;

        cursor: pointer;

        transition: 0.25s ease;

        box-shadow:
            0 8px 18px rgba(9,105,170,0.18);
    }

    button:hover,
    .all-button:hover {
        transform: translateY(-2px);

        box-shadow:
            0 12px 23px rgba(9,105,170,0.25);
    }

    .all-button {
        color: #075da7;

        background: rgba(235,247,255,0.9);

        border: 1px solid rgba(22,135,247,0.15);

        box-shadow: none;
    }

    .all-button:hover {
        color: white;

        background:
            linear-gradient(135deg, #0b5dcc, #087f91);
    }

    /* ================= REPORT TITLE ================= */

    .report-title {
        margin: 0 0 18px;

        color: #173552;

        font-size: 20px;
    }

    /* ================= SUMMARY CARDS ================= */

    .cards {
        display: grid;

        grid-template-columns:
            repeat(3, 1fr);

        gap: 20px;

        margin-bottom: 30px;
    }

    .card {
        position: relative;
        overflow: hidden;

        padding: 24px;

        min-height: 145px;

        border-radius: 21px;

        background: rgba(255,255,255,0.75);

        border: 1px solid rgba(255,255,255,0.85);

        box-shadow:
            0 18px 42px rgba(18,68,108,0.10),
            inset 0 1px 0 rgba(255,255,255,0.8);

        backdrop-filter: blur(14px);

        transition: 0.25s ease;
    }

    .card:hover {
        transform: translateY(-5px);

        box-shadow:
            0 24px 50px rgba(18,68,108,0.15);
    }

    .card::after {
        content: "";

        position: absolute;

        width: 100px;
        height: 100px;

        right: -35px;
        top: -35px;

        border-radius: 50%;

        background: rgba(0,180,190,0.08);
    }

    .card-top {
        display: flex;
        align-items: center;
        gap: 11px;

        margin-bottom: 16px;
    }

    .card-icon {
        width: 42px;
        height: 42px;

        display: flex;
        align-items: center;
        justify-content: center;

        border-radius: 13px;

        font-size: 20px;
    }

    .credit-icon {
        background: #e5f9ef;
    }

    .debit-icon {
        background: #fff0ef;
    }

    .total-icon {
        background: #e8f4ff;
    }

    .card-label {
        color: #667085;
        font-size: 13px;
        font-weight: bold;
    }

    .amount {
        color: #0b4d8e;

        font-size: 27px;
        font-weight: bold;
    }

    /* ================= TABLE ================= */

    .table-box {
        position: relative;
        overflow: hidden;

        padding: 27px;

        border-radius: 23px;

        background: rgba(255,255,255,0.74);

        border: 1px solid rgba(255,255,255,0.85);

        box-shadow:
            0 20px 50px rgba(18,68,108,0.10),
            inset 0 1px 0 rgba(255,255,255,0.8);

        backdrop-filter: blur(16px);
    }

    .table-box h2 {
        margin: 0;

        color: #172f4d;
        font-size: 20px;
    }

    .table-subtitle {
        margin-top: 5px;

        color: #7a899b;
        font-size: 12px;
    }

    .table-container {
        overflow-x: auto;

        margin-top: 20px;

        border-radius: 16px;

        border: 1px solid #dfe9f2;
    }

    table {
        width: 100%;

        min-width: 1050px;

        border-collapse: separate;
        border-spacing: 0;
    }

    th {
        padding: 14px 12px;

        color: white;

        background:
            linear-gradient(135deg, #073c82, #087aa1);

        text-align: center;

        font-size: 12px;
        white-space: nowrap;
    }

    td {
        padding: 13px 12px;

        color: #43546a;

        background: rgba(255,255,255,0.62);

        border-bottom: 1px solid #e8eef4;

        text-align: center;

        font-size: 12px;

        vertical-align: middle;
    }

    tbody tr {
        transition: 0.2s ease;
    }

    tbody tr:hover td {
        background: rgba(235,247,255,0.92);
    }

    tbody tr:last-child td {
        border-bottom: none;
    }

    .transaction-id {
        display: inline-flex;
        align-items: center;
        justify-content: center;

        min-width: 32px;
        height: 27px;

        padding: 0 8px;

        border-radius: 8px;

        color: #075da7;

        background: #e9f5ff;

        font-weight: bold;
    }

    .credit {
        display: inline-block;

        padding: 6px 10px;

        border-radius: 18px;

        color: #087449;

        background: #e7f9f0;

        font-weight: bold;
    }

    .debit {
        display: inline-block;

        padding: 6px 10px;

        border-radius: 18px;

        color: #b42318;

        background: #fff0ef;

        font-weight: bold;
    }

    .transaction-amount {
        color: #173f67;
        font-weight: bold;
        white-space: nowrap;
    }

    .date {
        white-space: nowrap;
        color: #596b7f;
    }

    .balance-after {
        color: #143a61;
        font-weight: bold;
        white-space: nowrap;
    }

    .no-data {
        padding: 45px 20px !important;

        color: #758497 !important;

        text-align: center !important;

        background: #f8fbfd !important;
    }

    /* ================= BACK ================= */

    .back {
        display: inline-flex;
        align-items: center;
        gap: 8px;

        margin-top: 24px;
        padding: 11px 16px;

        color: #075da7;

        background: rgba(235,247,255,0.85);

        border: 1px solid rgba(22,135,247,0.14);

        border-radius: 11px;

        text-decoration: none;

        font-size: 13px;
        font-weight: bold;

        transition: 0.25s ease;
    }

    .back:hover {
        color: white;

        background:
            linear-gradient(135deg, #0b5dcc, #08a2a2);

        transform: translateX(-3px);

        box-shadow:
            0 8px 20px rgba(9,105,170,0.20);
    }

    /* ================= RESPONSIVE ================= */

    @media (max-width: 950px) {

        .cards {
            grid-template-columns: 1fr;
        }

        .filter-row {
            align-items: stretch;
        }

        .filter-group {
            width: 100%;
        }

        select,
        button,
        .all-button {
            width: 100%;
        }
    }

    @media (max-width: 700px) {

        .header {
            padding: 14px 20px;
        }

        .brand h2 {
            font-size: 17px;
        }

        .brand p {
            display: none;
        }

        .brand-icon {
            width: 40px;
            height: 40px;
        }

        .logout {
            padding: 8px 12px;
            font-size: 12px;
        }

        .container {
            width: 94%;
            margin: 28px auto;
        }

        .page-heading h1 {
            font-size: 24px;
        }

        .filters,
        .table-box {
            padding: 19px;
            border-radius: 19px;
        }

        .amount {
            font-size: 24px;
        }
    }

</style>

</head>

<body>

<!-- ================= HEADER ================= -->

<div class="header">

<div class="brand">

    <div class="brand-icon">
        📊
    </div>

    <div>
        <h2>SmartBank Reports</h2>
        <p>Transaction Analytics</p>
    </div>

</div>

<a class="logout"
   href="${pageContext.request.contextPath}/admin/logout">
    Logout
</a>

</div>

<!-- ================= MAIN ================= -->

<div class="container">

<div class="page-heading">

    <div class="eyebrow">
        📊 ADMIN ANALYTICS
    </div>

    <h1>
        Transaction Reports
    </h1>

    <p>
        Review transaction activity and financial summaries across SmartBank.
    </p>

</div>


<!-- ================= FILTERS ================= -->

<div class="filters">

    <div class="filter-heading">

        <div class="filter-icon">
            🔎
        </div>

        <div>

            <h3>Filter Reports</h3>

            <span>
                Select a period to generate a transaction report
            </span>

        </div>

    </div>


    <form
        action="${pageContext.request.contextPath}/admin/reports"
        method="get">

        <div class="filter-row">


            <div class="filter-group">

                <label>Report Type</label>

                <select name="type">

                    <option value=""
                        ${empty selectedType ? 'selected' : ''}>
                        All Transactions
                    </option>

                    <option value="MONTHLY"
                        ${selectedType == 'MONTHLY' ? 'selected' : ''}>
                        Monthly Report
                    </option>

                    <option value="ANNUAL"
                        ${selectedType == 'ANNUAL' ? 'selected' : ''}>
                        Annual Report
                    </option>

                </select>

            </div>


            <div class="filter-group">

                <label>Month</label>

                <select name="month">

                    <option value="">
                        Select Month
                    </option>

                    <option value="1" ${selectedMonth == 1 ? 'selected' : ''}>January</option>
                    <option value="2" ${selectedMonth == 2 ? 'selected' : ''}>February</option>
                    <option value="3" ${selectedMonth == 3 ? 'selected' : ''}>March</option>
                    <option value="4" ${selectedMonth == 4 ? 'selected' : ''}>April</option>
                    <option value="5" ${selectedMonth == 5 ? 'selected' : ''}>May</option>
                    <option value="6" ${selectedMonth == 6 ? 'selected' : ''}>June</option>
                    <option value="7" ${selectedMonth == 7 ? 'selected' : ''}>July</option>
                    <option value="8" ${selectedMonth == 8 ? 'selected' : ''}>August</option>
                    <option value="9" ${selectedMonth == 9 ? 'selected' : ''}>September</option>
                    <option value="10" ${selectedMonth == 10 ? 'selected' : ''}>October</option>
                    <option value="11" ${selectedMonth == 11 ? 'selected' : ''}>November</option>
                    <option value="12" ${selectedMonth == 12 ? 'selected' : ''}>December</option>

                </select>

            </div>


            <div class="filter-group">

                <label>Year</label>

                <select name="year">

                    <option value="">
                        Select Year
                    </option>

                    <option value="2026" ${selectedYear == 2026 ? 'selected' : ''}>2026</option>
                    <option value="2025" ${selectedYear == 2025 ? 'selected' : ''}>2025</option>
                    <option value="2024" ${selectedYear == 2024 ? 'selected' : ''}>2024</option>

                </select>

            </div>


            <div class="filter-group">

                <button type="submit">
                    🔍 Generate Report
                </button>

            </div>


            <div class="filter-group">

                <a class="all-button"
                   href="${pageContext.request.contextPath}/admin/reports">

                    View All

                </a>

            </div>

        </div>

    </form>

</div>


<!-- ================= REPORT TITLE ================= -->

<c:choose>

    <c:when test="${selectedType == 'MONTHLY'}">

        <h3 class="report-title">
            📅 Monthly Report
        </h3>

    </c:when>

    <c:when test="${selectedType == 'ANNUAL'}">

        <h3 class="report-title">
            📆 Annual Report
        </h3>

    </c:when>

    <c:otherwise>

        <h3 class="report-title">
            🧾 All Transactions Report
        </h3>

    </c:otherwise>

</c:choose>


<!-- ================= SUMMARY CARDS ================= -->

<div class="cards">


    <div class="card">

        <div class="card-top">

            <div class="card-icon credit-icon">
                💰
            </div>

            <div class="card-label">
                Total Credit
            </div>

        </div>

        <div class="amount">
            ₹${totalCredit}
        </div>

    </div>


    <div class="card">

        <div class="card-top">

            <div class="card-icon debit-icon">
                💸
            </div>

            <div class="card-label">
                Total Debit
            </div>

        </div>

        <div class="amount">
            ₹${totalDebit}
        </div>

    </div>


    <div class="card">

        <div class="card-top">

            <div class="card-icon total-icon">
                📊
            </div>

            <div class="card-label">
                Total Transaction Amount
            </div>

        </div>

        <div class="amount">
            ₹${totalAmount}
        </div>

    </div>


</div>


<!-- ================= TRANSACTION TABLE ================= -->

<div class="table-box">

    <h2>
        🧾 Transaction Details
    </h2>

    <div class="table-subtitle">
        Detailed transaction activity for the selected report period
    </div>


    <div class="table-container">

        <table>

            <thead>

            <tr>

                <th>ID</th>
                <th>Type</th>
                <th>Amount</th>
                <th>Description</th>
                <th>Sender Account</th>
                <th>Receiver Account</th>
                <th>Date & Time</th>
                <th>Balance After</th>

            </tr>

            </thead>


            <tbody>

            <c:choose>

                <c:when test="${not empty transactions}">

                    <c:forEach
                        var="transaction"
                        items="${transactions}">

                        <tr>

                            <td>

                                <span class="transaction-id">
                                    ${transaction.id}
                                </span>

                            </td>


                            <td>

                                <c:choose>

                                    <c:when test="${transaction.transactionType == 'CREDIT'}">

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


                            <td class="transaction-amount">
                                ₹${transaction.amount}
                            </td>


                            <td>
                                ${transaction.description}
                            </td>


                            <td>
                                ${transaction.senderAccount}
                            </td>


                            <td>
                                ${transaction.receiverAccount}
                            </td>


                            <td class="date">
                                ${transaction.transactionDate}
                            </td>


                            <td class="balance-after">
                                ₹${transaction.balanceAfterTransaction}
                            </td>

                        </tr>

                    </c:forEach>

                </c:when>


                <c:otherwise>

                    <tr>

                        <td colspan="8" class="no-data">

                            No transactions found for the selected period.

                        </td>

                    </tr>

                </c:otherwise>

            </c:choose>

            </tbody>

        </table>

    </div>

</div>


<!-- ================= BACK ================= -->

<a class="back"
   href="${pageContext.request.contextPath}/admin/dashboard">

    ← Back to Admin Dashboard

</a>


</div>

</body>
</html>
