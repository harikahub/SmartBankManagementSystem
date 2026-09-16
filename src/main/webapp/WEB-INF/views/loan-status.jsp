<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Loan Status | SmartBank</title>

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

        .dashboard-link {
            color: white;
            text-decoration: none;
            background: rgba(255,255,255,0.12);
            padding: 10px 16px;
            border-radius: 8px;
            border: 1px solid rgba(255,255,255,0.18);
            font-size: 13px;
            font-weight: bold;
        }

        .dashboard-link:hover {
            background: white;
            color: #0b3d91;
        }

        .container {
            width: 92%;
            max-width: 1200px;
            margin: 35px auto;
        }

        .title-section {
            margin-bottom: 22px;
        }

        .title-section h1 {
            color: #0b3d91;
            margin: 0 0 7px;
            font-size: 28px;
        }

        .title-section p {
            color: #6d7888;
            margin: 0;
        }

        .table-container {
            background: white;
            border-radius: 18px;
            box-shadow: 0 8px 25px rgba(20,40,70,0.06);
            border: 1px solid #edf1f6;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 850px;
        }

        th {
            background: #0b3d91;
            color: white;
            padding: 15px 14px;
            text-align: left;
            white-space: nowrap;
            font-size: 13px;
        }

        td {
            padding: 15px 14px;
            border-bottom: 1px solid #e9edf2;
            vertical-align: middle;
            font-size: 13px;
        }

        tbody tr:hover {
            background: #f8fbff;
        }

        tbody tr:last-child td {
            border-bottom: none;
        }

        .amount {
            font-weight: bold;
            color: #17243a;
            white-space: nowrap;
        }

        .status {
            font-weight: bold;
            padding: 7px 12px;
            border-radius: 20px;
            display: inline-block;
            font-size: 11px;
            white-space: nowrap;
        }

        .approved {
            background: #e8f5e9;
            color: #2e7d32;
        }

        .rejected {
            background: #ffebee;
            color: #c62828;
        }

        .pending {
            background: #fff8e1;
            color: #f57f17;
        }

        .date {
            white-space: nowrap;
            font-size: 12px;
            color: #667085;
        }

        .empty {
            background: white;
            padding: 50px 20px;
            text-align: center;
            border-radius: 18px;
            box-shadow: 0 8px 25px rgba(20,40,70,0.06);
            border: 1px solid #edf1f6;
            color: #777;
        }

        .empty-icon {
            font-size: 42px;
            margin-bottom: 12px;
        }

        .empty h3 {
            color: #344054;
            margin: 0 0 8px;
        }

        .back {
            display: inline-block;
            margin-top: 23px;
            padding: 11px 18px;
            background: #0b3d91;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 13px;
            font-weight: bold;
        }

        .back:hover {
            background: #1687f7;
        }

    </style>

</head>

<body>

<div class="header">

    <div class="brand">

        <div class="brand-icon">🏦</div>

        <div>
            <h2>SmartBank</h2>
        </div>

    </div>

    <a class="dashboard-link"
       href="${pageContext.request.contextPath}/dashboard">
        🏠 Dashboard
    </a>

</div>


<div class="container">

    <div class="title-section">

        <h1>📋 My Loan Applications</h1>

        <p>
            Track your loan applications and approval status.
        </p>

    </div>


    <c:if test="${not empty loans}">

        <div class="table-container">

            <table>

                <thead>

                <tr>
                    <th>Loan Type</th>
                    <th>Amount</th>
                    <th>Tenure</th>
                    <th>Purpose</th>
                    <th>Status</th>
                    <th>Applied Date</th>
                </tr>

                </thead>

                <tbody>

                <c:forEach var="loan" items="${loans}">

                    <tr>

                        <td>
                            <strong>
                                ${loan.loanType}
                            </strong>
                        </td>

                        <td class="amount">
                            ₹ ${loan.amount}
                        </td>

                        <td>
                            ${loan.tenureMonths} months
                        </td>

                        <td>
                            ${loan.purpose}
                        </td>

                        <td>

                            <c:choose>

                                <c:when test="${loan.status == 'APPROVED'}">

                                    <span class="status approved">
                                        ✓ APPROVED
                                    </span>

                                </c:when>

                                <c:when test="${loan.status == 'REJECTED'}">

                                    <span class="status rejected">
                                        ✕ REJECTED
                                    </span>

                                </c:when>

                                <c:otherwise>

                                    <span class="status pending">
                                        ⏳ PENDING
                                    </span>

                                </c:otherwise>

                            </c:choose>

                        </td>

                        <td class="date">
                            ${loan.appliedDate}
                        </td>

                    </tr>

                </c:forEach>

                </tbody>

            </table>

        </div>

    </c:if>


    <c:if test="${empty loans}">

        <div class="empty">

            <div class="empty-icon">📋</div>

            <h3>No Loan Applications</h3>

            <p>
                You haven't submitted any loan applications yet.
            </p>

        </div>

    </c:if>


    <a class="back"
       href="${pageContext.request.contextPath}/dashboard">

        ← Back to Dashboard

    </a>

</div>

</body>
</html>