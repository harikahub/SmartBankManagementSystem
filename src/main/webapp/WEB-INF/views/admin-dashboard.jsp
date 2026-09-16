<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Admin Dashboard | SmartBank</title>

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
            width: 44px;
            height: 44px;
            border-radius: 12px;
            background: rgba(255,255,255,0.14);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 23px;
        }

        .brand h2 {
            margin: 0;
            font-size: 21px;
        }

        .brand p {
            margin: 3px 0 0;
            font-size: 12px;
            opacity: 0.75;
        }

        .logout {
            background: rgba(255,255,255,0.12);
            border: 1px solid rgba(255,255,255,0.25);
            color: white;
            padding: 10px 18px;
            border-radius: 9px;
            text-decoration: none;
            font-weight: bold;
            transition: 0.25s;
        }

        .logout:hover {
            background: white;
            color: #0b3d91;
        }

        .container {
            width: 92%;
            max-width: 1250px;
            margin: 35px auto;
        }

        .welcome {
            background: linear-gradient(135deg, #08244a, #147ee9);
            color: white;
            padding: 30px;
            border-radius: 18px;
            margin-bottom: 25px;
            box-shadow: 0 10px 30px rgba(11,61,145,0.18);
        }

        .welcome h1 {
            margin: 0 0 8px;
            font-size: 28px;
        }

        .welcome p {
            margin: 0;
            opacity: 0.88;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 17px;
            box-shadow: 0 8px 25px rgba(20,40,70,0.06);
            border: 1px solid #edf1f6;
            transition: 0.25s;
        }

        .card:hover {
            transform: translateY(-4px);
            box-shadow: 0 13px 30px rgba(20,40,70,0.1);
        }

        .card-icon {
            width: 48px;
            height: 48px;
            border-radius: 13px;
            background: #eaf3ff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 23px;
            margin-bottom: 15px;
        }

        .card h3 {
            margin: 0 0 8px;
            font-size: 18px;
        }

        .card p {
            color: #718096;
            font-size: 14px;
            line-height: 1.6;
            min-height: 45px;
        }

        .card a {
            display: inline-block;
            margin-top: 8px;
            padding: 10px 17px;
            background: #0b3d91;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 13px;
            font-weight: bold;
            transition: 0.25s;
        }

        .card a:hover {
            background: #1687f7;
        }

        .section {
            background: white;
            padding: 28px;
            border-radius: 18px;
            box-shadow: 0 8px 25px rgba(20,40,70,0.06);
            border: 1px solid #edf1f6;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 22px;
        }

        .section-header h2 {
            margin: 0;
            font-size: 21px;
        }

        .loan-count {
            background: #fff5d8;
            color: #a15c00;
            padding: 7px 13px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }

        .loan {
            border: 1px solid #e8edf3;
            padding: 21px;
            margin-bottom: 15px;
            border-radius: 14px;
            background: #fbfcfe;
        }

        .loan:last-child {
            margin-bottom: 0;
        }

        .loan h3 {
            margin: 0 0 17px;
            color: #0b3d91;
            font-size: 18px;
        }

        .loan-details {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 10px 25px;
        }

        .detail {
            font-size: 14px;
            color: #667085;
        }

        .detail strong {
            color: #344054;
        }

        .actions {
            margin-top: 20px;
            display: flex;
            gap: 10px;
        }

        .actions form {
            display: inline;
        }

        .approve,
        .reject {
            border: none;
            padding: 10px 18px;
            border-radius: 8px;
            color: white;
            cursor: pointer;
            font-weight: bold;
            transition: 0.25s;
        }

        .approve {
            background: #198754;
        }

        .approve:hover {
            background: #146c43;
        }

        .reject {
            background: #dc3545;
        }

        .reject:hover {
            background: #b02a37;
        }

        .empty {
            text-align: center;
            padding: 45px 20px;
            background: #f8fafc;
            border-radius: 14px;
            color: #718096;
        }

        .empty-icon {
            font-size: 40px;
            margin-bottom: 10px;
        }

        .empty h3 {
            color: #344054;
            margin: 0 0 8px;
        }

        .footer {
            text-align: center;
            color: #8792a2;
            font-size: 12px;
            padding: 25px;
        }

        @media (max-width: 900px) {

            .cards {
                grid-template-columns: 1fr;
            }

            .loan-details {
                grid-template-columns: 1fr;
            }

            .container {
                width: 94%;
            }

        }

        @media (max-width: 600px) {

            .header {
                padding: 15px 20px;
            }

            .brand h2 {
                font-size: 17px;
            }

            .brand p {
                display: none;
            }

            .logout {
                padding: 8px 12px;
                font-size: 12px;
            }

            .welcome {
                padding: 23px;
            }

            .welcome h1 {
                font-size: 23px;
            }

            .section {
                padding: 20px;
            }

            .actions {
                flex-direction: column;
            }

            .approve,
            .reject {
                width: 100%;
            }

        }

    </style>

</head>

<body>

<div class="header">

    <div class="brand">

        <div class="brand-icon">🏦</div>

        <div>
            <h2>SmartBank Admin</h2>
            <p>Administration Portal</p>
        </div>

    </div>

    <a class="logout"
       href="${pageContext.request.contextPath}/admin/logout">
        Logout
    </a>

</div>


<div class="container">

    <div class="welcome">

        <h1>
            Welcome, ${admin.username} 👨‍💼
        </h1>

        <p>
            Manage customers, loan applications and transaction reports
            from your administration dashboard.
        </p>

    </div>


    <div class="cards">

        <div class="card">

            <div class="card-icon">💰</div>

            <h3>Loan Requests</h3>

            <p>
                Review and manage pending customer loan applications.
            </p>

            <a href="${pageContext.request.contextPath}/admin/dashboard">
                View Requests →
            </a>

        </div>


        <div class="card">

            <div class="card-icon">👥</div>

            <h3>Customers</h3>

            <p>
                View registered customers and their account details.
            </p>

            <a href="${pageContext.request.contextPath}/admin/customers">
                Manage Customers →
            </a>

        </div>


        <div class="card">

            <div class="card-icon">📊</div>

            <h3>Reports</h3>

            <p>
                View monthly, annual and transaction summaries.
            </p>

            <a href="${pageContext.request.contextPath}/admin/reports">
                View Reports →
            </a>

        </div>

    </div>


    <div class="section">

        <div class="section-header">

            <h2>📋 Pending Loan Applications</h2>

            <c:if test="${not empty pendingLoans}">
                <span class="loan-count">
                    ${pendingLoans.size()} Pending
                </span>
            </c:if>

        </div>


        <c:if test="${not empty pendingLoans}">

            <c:forEach var="loan" items="${pendingLoans}">

                <div class="loan">

                    <h3>
                        🏦 ${loan.loanType}
                    </h3>

                    <div class="loan-details">

                        <div class="detail">
                            <strong>Customer:</strong>
                            ${loan.customer.fullName}
                        </div>

                        <div class="detail">
                            <strong>Email:</strong>
                            ${loan.customer.email}
                        </div>

                        <div class="detail">
                            <strong>Loan Amount:</strong>
                            ₹${loan.amount}
                        </div>

                        <div class="detail">
                            <strong>Tenure:</strong>
                            ${loan.tenureMonths} months
                        </div>

                        <div class="detail">
                            <strong>Purpose:</strong>
                            ${loan.purpose}
                        </div>

                        <div class="detail">
                            <strong>Applied Date:</strong>
                            ${loan.appliedDate}
                        </div>

                    </div>


                    <div class="actions">

                        <form
                            action="${pageContext.request.contextPath}/admin/loan/status"
                            method="post">

                            <input
                                type="hidden"
                                name="loanId"
                                value="${loan.id}">

                            <input
                                type="hidden"
                                name="status"
                                value="APPROVED">

                            <button
                                type="submit"
                                class="approve">

                                ✓ Approve

                            </button>

                        </form>


                        <form
                            action="${pageContext.request.contextPath}/admin/loan/status"
                            method="post">

                            <input
                                type="hidden"
                                name="loanId"
                                value="${loan.id}">

                            <input
                                type="hidden"
                                name="status"
                                value="REJECTED">

                            <button
                                type="submit"
                                class="reject">

                                ✕ Reject

                            </button>

                        </form>

                    </div>

                </div>

            </c:forEach>

        </c:if>


        <c:if test="${empty pendingLoans}">

            <div class="empty">

                <div class="empty-icon">✓</div>

                <h3>No Pending Loan Applications</h3>

                <p>
                    There are currently no loan requests waiting for review.
                </p>

            </div>

        </c:if>

    </div>

</div>


<div class="footer">

    © 2026 Smart Bank Management System · Secure Administration Portal

</div>

</body>
</html>