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
            background: #f5f8fc;
            color: #17243a;
        }

        .header {
            background: linear-gradient(135deg, #071a35, #0b3d91);
            color: white;
            padding: 18px 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 18px rgba(0,0,0,0.12);
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .brand-icon {
            width: 43px;
            height: 43px;
            border-radius: 12px;
            background: rgba(255,255,255,0.14);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
        }

        .brand h2 {
            margin: 0;
            font-size: 20px;
        }

        .brand p {
            margin: 3px 0 0;
            font-size: 12px;
            opacity: 0.75;
        }

        .logout {
            color: white;
            text-decoration: none;
            background: rgba(255,255,255,0.12);
            border: 1px solid rgba(255,255,255,0.25);
            padding: 10px 18px;
            border-radius: 9px;
            font-weight: bold;
        }

        .logout:hover {
            background: white;
            color: #0b3d91;
        }

        .container {
            width: 92%;
            max-width: 1450px;
            margin: 35px auto;
        }

        .page-title {
            margin: 0 0 22px;
            color: #0b3d91;
            font-size: 28px;
        }

        .filters {
            background: white;
            padding: 25px;
            border-radius: 18px;
            box-shadow: 0 8px 25px rgba(20,40,70,0.06);
            border: 1px solid #edf1f6;
            margin-bottom: 28px;
        }

        .filters h3 {
            margin: 0 0 20px;
            color: #17243a;
        }

        .filter-row {
            display: flex;
            gap: 15px;
            align-items: end;
            flex-wrap: wrap;
        }

        .filter-group {
            display: flex;
            flex-direction: column;
        }

        .filter-group label {
            font-weight: bold;
            margin-bottom: 7px;
            color: #475467;
            font-size: 13px;
        }

        select {
            padding: 11px 12px;
            border: 1px solid #d7dee8;
            border-radius: 9px;
            font-size: 14px;
            min-width: 165px;
            background: white;
            color: #344054;
        }

        select:focus {
            outline: none;
            border-color: #1687f7;
        }

        button,
        .all-button {
            padding: 11px 18px;
            border: none;
            border-radius: 9px;
            background: #0b3d91;
            color: white;
            font-size: 14px;
            cursor: pointer;
            text-decoration: none;
            font-weight: bold;
        }

        button:hover {
            background: #1687f7;
        }

        .all-button {
            background: #667085;
        }

        .all-button:hover {
            background: #475467;
        }

        .report-title {
            color: #344054;
            margin: 0 0 18px;
            font-size: 19px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 28px;
        }

        .card {
            background: white;
            padding: 24px;
            border-radius: 17px;
            box-shadow: 0 8px 25px rgba(20,40,70,0.06);
            border: 1px solid #edf1f6;
        }

        .card-label {
            color: #667085;
            font-size: 13px;
            margin-bottom: 12px;
        }

        .amount {
            font-size: 27px;
            font-weight: bold;
            color: #0b3d91;
        }

        .table-box {
            background: white;
            padding: 26px;
            border-radius: 18px;
            box-shadow: 0 8px 25px rgba(20,40,70,0.06);
            border: 1px solid #edf1f6;
            overflow-x: auto;
        }

        .table-box h2 {
            color: #17243a;
            margin: 0;
            font-size: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            min-width: 1050px;
        }

        th {
            background: #0b3d91;
            color: white;
            padding: 13px;
            text-align: center;
            font-size: 13px;
            white-space: nowrap;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #edf0f4;
            text-align: center;
            font-size: 13px;
        }

        tbody tr:hover {
            background: #f8fbff;
        }

        .credit {
            color: #16803c;
            font-weight: bold;
        }

        .debit {
            color: #d92d20;
            font-weight: bold;
        }

        .no-data {
            text-align: center;
            color: #777;
            padding: 30px;
        }

        .back {
            display: inline-flex;
            margin-top: 23px;
            text-decoration: none;
            color: #0b3d91;
            font-weight: bold;
        }

        .back:hover {
            color: #1687f7;
        }

        @media (max-width: 900px) {

            .cards {
                grid-template-columns: 1fr;
            }

            .container {
                width: 94%;
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

    </style>

</head>

<body>

<div class="header">

    <div class="brand">

        <div class="brand-icon">📊</div>

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


<div class="container">

    <h1 class="page-title">
        📈 Transaction Reports
    </h1>


    <div class="filters">

        <h3>🔎 Filter Reports</h3>

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

                        <option value="">Select Month</option>

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

                        <option value="">Select Year</option>

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


    <div class="cards">

        <div class="card">

            <div class="card-label">
                💰 Total Credit
            </div>

            <div class="amount">
                ₹${totalCredit}
            </div>

        </div>


        <div class="card">

            <div class="card-label">
                💸 Total Debit
            </div>

            <div class="amount">
                ₹${totalDebit}
            </div>

        </div>


        <div class="card">

            <div class="card-label">
                📊 Total Transaction Amount
            </div>

            <div class="amount">
                ₹${totalAmount}
            </div>

        </div>

    </div>


    <div class="table-box">

        <h2>🧾 Transaction Details</h2>

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

                            <td>${transaction.id}</td>

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

                            <td>
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

                            <td>
                                ${transaction.transactionDate}
                            </td>

                            <td>
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


    <a class="back"
       href="${pageContext.request.contextPath}/admin/dashboard">

        ← Back to Admin Dashboard

    </a>

</div>

</body>
</html>