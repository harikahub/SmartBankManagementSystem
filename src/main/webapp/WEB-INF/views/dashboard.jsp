<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Dashboard | SmartBank</title>

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

        .dashboard-wrapper {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 250px;
            background: linear-gradient(180deg, #071a35, #0b2d59);
            color: white;
            padding: 28px 18px;
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
        }

        .sidebar-logo {
            font-size: 27px;
            font-weight: bold;
            padding: 5px 12px;
            margin-bottom: 35px;
        }

        .sidebar-logo span {
            color: #35a7ff;
        }

        .sidebar-subtitle {
            color: #9db1ca;
            font-size: 11px;
            margin-top: 4px;
            font-weight: normal;
        }

        .sidebar-menu {
            display: flex;
            flex-direction: column;
            gap: 7px;
        }

        .sidebar-menu a {
            text-decoration: none;
            color: #dce8f7;
            padding: 13px 15px;
            border-radius: 10px;
            transition: 0.25s;
            font-size: 14px;
        }

        .sidebar-menu a:hover {
            background: rgba(255,255,255,0.09);
            color: white;
            transform: translateX(2px);
        }

        .sidebar-menu .active {
            background: #1687f7;
            color: white;
            box-shadow: 0 5px 15px rgba(22,135,247,0.25);
        }

        .logout-link {
            margin-top: 25px;
            color: #ffb4b4 !important;
        }

        .logout-link:hover {
            background: rgba(220,53,69,0.12) !important;
        }

        .main-content {
            margin-left: 250px;
            width: calc(100% - 250px);
            min-height: 100vh;
        }

        .topbar {
            height: 72px;
            background: white;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 35px;
            border-bottom: 1px solid #e5eaf0;
        }

        .topbar h2 {
            margin: 0;
            font-size: 20px;
        }

        .profile {
            display: flex;
            align-items: center;
            gap: 11px;
        }

        .profile-name {
            font-size: 14px;
            font-weight: bold;
        }

        .profile-icon {
            width: 42px;
            height: 42px;
            border-radius: 50%;
            background: linear-gradient(135deg, #0b3d91, #1687f7);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }

        .content {
            padding: 32px;
        }

        .welcome-banner {
            background: linear-gradient(135deg, #08244a, #147ee9);
            color: white;
            padding: 30px;
            border-radius: 18px;
            margin-bottom: 23px;
            box-shadow: 0 10px 30px rgba(11,61,145,0.17);
        }

        .welcome-banner h1 {
            margin: 0 0 8px;
            font-size: 27px;
        }

        .welcome-banner p {
            margin: 0;
            opacity: 0.88;
        }

        .balance-card {
            background: white;
            border-radius: 18px;
            padding: 27px;
            margin-bottom: 23px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.05);
            border: 1px solid #edf1f6;
        }

        .balance-label {
            color: #6c7890;
            font-size: 13px;
            margin-bottom: 8px;
        }

        .balance-amount {
            font-size: 37px;
            font-weight: bold;
            color: #0a2344;
            margin-bottom: 12px;
        }

        .account-number {
            color: #68768a;
            font-size: 13px;
            word-break: break-word;
        }

        .cards-row {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
            margin-bottom: 23px;
        }

        .info-card {
            background: white;
            border-radius: 16px;
            padding: 21px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.045);
            border: 1px solid #edf1f6;
        }

        .info-card .icon {
            width: 45px;
            height: 45px;
            border-radius: 12px;
            background: #eaf3ff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 23px;
            margin-bottom: 13px;
        }

        .info-card h3 {
            margin: 0 0 7px;
            font-size: 16px;
        }

        .info-card p {
            margin: 0;
            color: #6d7888;
            font-size: 13px;
            line-height: 1.5;
        }

        .section-card {
            background: white;
            border-radius: 18px;
            padding: 25px;
            margin-bottom: 23px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.045);
            border: 1px solid #edf1f6;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 17px;
        }

        .section-header h2 {
            margin: 0;
            font-size: 19px;
        }

        .view-all {
            text-decoration: none;
            color: #1687f7;
            font-size: 13px;
            font-weight: bold;
        }

        .transaction {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 15px 0;
            border-bottom: 1px solid #edf0f4;
        }

        .transaction:last-child {
            border-bottom: none;
        }

        .transaction-left {
            display: flex;
            align-items: center;
            gap: 13px;
            min-width: 0;
        }

        .transaction-icon {
            width: 43px;
            height: 43px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            flex-shrink: 0;
        }

        .credit-icon {
            background: #e6f8ed;
            color: #159447;
        }

        .debit-icon {
            background: #ffe9e9;
            color: #d93636;
        }

        .transaction-info {
            min-width: 0;
        }

        .transaction-info h4 {
            margin: 0 0 5px;
            font-size: 14px;
        }

        .transaction-info p {
            margin: 0 0 3px;
            color: #788494;
            font-size: 11px;
            word-break: break-word;
        }

        .transaction-right {
            text-align: right;
            margin-left: 15px;
            flex-shrink: 0;
        }

        .transaction-amount {
            font-weight: bold;
            font-size: 14px;
        }

        .credit {
            color: #159447;
        }

        .debit {
            color: #d93636;
        }

        .transaction-balance {
            color: #788494;
            font-size: 11px;
            margin-top: 5px;
        }

        .empty-state {
            text-align: center;
            padding: 35px 10px;
            color: #7a8696;
        }

        .quick-actions {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 13px;
        }

        .action-card {
            text-decoration: none;
            color: #17243a;
            background: #f8fafc;
            border: 1px solid #e8edf3;
            border-radius: 14px;
            padding: 19px;
            text-align: center;
            transition: 0.25s;
        }

        .action-card:hover {
            transform: translateY(-3px);
            border-color: #1687f7;
            box-shadow: 0 8px 18px rgba(0,0,0,0.06);
        }

        .action-card div {
            font-size: 25px;
            margin-bottom: 8px;
        }

        .action-card span {
            font-size: 12px;
            font-weight: bold;
        }

        .account-info p {
            color: #667085;
            font-size: 14px;
            padding: 10px 0;
            margin: 0;
            border-bottom: 1px solid #edf0f4;
        }

        .account-info p:last-child {
            border-bottom: none;
        }

        .account-info strong {
            color: #344054;
        }

        .footer {
            text-align: center;
            color: #8792a2;
            font-size: 12px;
            padding: 20px;
        }

        @media (max-width: 900px) {

            .sidebar {
                width: 210px;
            }

            .main-content {
                margin-left: 210px;
                width: calc(100% - 210px);
            }

            .cards-row {
                grid-template-columns: 1fr;
            }

            .quick-actions {
                grid-template-columns: repeat(2, 1fr);
            }

            .content {
                padding: 23px;
            }

        }

        @media (max-width: 650px) {

            .sidebar {
                width: 100%;
                position: relative;
                min-height: auto;
            }

            .dashboard-wrapper {
                display: block;
            }

            .main-content {
                margin-left: 0;
                width: 100%;
            }

            .sidebar-menu {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
            }

            .logout-link {
                margin-top: 0;
            }

            .topbar {
                padding: 0 18px;
            }

            .topbar h2 {
                font-size: 17px;
            }

            .profile-name {
                display: none;
            }

            .content {
                padding: 18px;
            }

            .welcome-banner h1 {
                font-size: 22px;
            }

            .balance-amount {
                font-size: 30px;
            }

            .quick-actions {
                grid-template-columns: 1fr 1fr;
            }

        }

    </style>

</head>

<body>

<div class="dashboard-wrapper">

    <aside class="sidebar">

        <div class="sidebar-logo">
            Smart<span>Bank</span>
            <div class="sidebar-subtitle">
                Digital Banking
            </div>
        </div>

        <div class="sidebar-menu">

            <a href="${pageContext.request.contextPath}/dashboard"
               class="active">
                🏠 Dashboard
            </a>

            <a href="${pageContext.request.contextPath}/transfer">
                💸 Fund Transfer
            </a>

            <a href="${pageContext.request.contextPath}/transactions">
                📊 Mini Statement
            </a>

            <a href="${pageContext.request.contextPath}/loan/apply">
                🏦 Apply Loan
            </a>

            <a href="${pageContext.request.contextPath}/loan/status">
                📋 Loan Status
            </a>

            <a href="${pageContext.request.contextPath}/logout"
               class="logout-link">
                🚪 Logout
            </a>

        </div>

    </aside>


    <main class="main-content">

        <div class="topbar">

            <h2>Customer Dashboard</h2>

            <div class="profile">

                <div class="profile-name">
                    ${sessionScope.customer.fullName}
                </div>

                <div class="profile-icon">
                    ${sessionScope.customer.fullName.substring(0,1)}
                </div>

            </div>

        </div>


        <div class="content">

            <div class="welcome-banner">

                <h1>
                    Welcome back, ${sessionScope.customer.fullName}! 👋
                </h1>

                <p>
                    Manage your SmartBank account securely from one place.
                </p>

            </div>


            <div class="balance-card">

                <div class="balance-label">
                    Available Balance
                </div>

                <div class="balance-amount">
                    ₹ ${sessionScope.customer.account.balance}
                </div>

                <div class="account-number">

                    Account Number:
                    ${sessionScope.customer.account.accountNumber}

                    &nbsp; | &nbsp;

                    UPI:
                    ${sessionScope.customer.account.upiId}

                </div>

            </div>


            <div class="cards-row">

                <div class="info-card">

                    <div class="icon">🏦</div>

                    <h3>Bank Account</h3>

                    <p>
                        Your SmartBank account is active and ready for transactions.
                    </p>

                </div>


                <div class="info-card">

                    <div class="icon">🔐</div>

                    <h3>Account Security</h3>

                    <p>
                        Your account is protected with OTP verification.
                    </p>

                </div>


                <div class="info-card">

                    <div class="icon">📧</div>

                    <h3>Email Verified</h3>

                    <p>
                        ${sessionScope.customer.email}
                    </p>

                </div>

            </div>


            <div class="section-card">

                <div class="section-header">

                    <h2>⚡ Quick Actions</h2>

                </div>

                <div class="quick-actions">

                    <a href="${pageContext.request.contextPath}/transfer"
                       class="action-card">
                        <div>💸</div>
                        <span>Fund Transfer</span>
                    </a>

                    <a href="${pageContext.request.contextPath}/transactions"
                       class="action-card">
                        <div>📊</div>
                        <span>Mini Statement</span>
                    </a>

                    <a href="${pageContext.request.contextPath}/loan/apply"
                       class="action-card">
                        <div>🏦</div>
                        <span>Apply Loan</span>
                    </a>

                    <a href="${pageContext.request.contextPath}/loan/status"
                       class="action-card">
                        <div>📋</div>
                        <span>Loan Status</span>
                    </a>

                </div>

            </div>


            <div class="section-card">

                <div class="section-header">

                    <h2>📊 Recent Transactions</h2>

                    <a href="${pageContext.request.contextPath}/transactions"
                       class="view-all">
                        View All →
                    </a>

                </div>


                <c:choose>

                    <c:when test="${not empty recentTransactions}">

                        <c:forEach
                            var="transaction"
                            items="${recentTransactions}">

                            <div class="transaction">

                                <div class="transaction-left">

                                    <c:choose>

                                        <c:when test="${transaction.transactionType == 'CREDIT'}">

                                            <div class="transaction-icon credit-icon">
                                                ↓
                                            </div>

                                        </c:when>

                                        <c:otherwise>

                                            <div class="transaction-icon debit-icon">
                                                ↑
                                            </div>

                                        </c:otherwise>

                                    </c:choose>


                                    <div class="transaction-info">

                                        <h4>
                                            ${transaction.description}
                                        </h4>

                                        <p>
                                            ${transaction.transactionDate}
                                        </p>

                                        <p>

                                            <c:choose>

                                                <c:when test="${transaction.transactionType == 'CREDIT'}">
                                                    Received from:
                                                    ${transaction.senderAccount}
                                                </c:when>

                                                <c:otherwise>
                                                    Sent to:
                                                    ${transaction.receiverAccount}
                                                </c:otherwise>

                                            </c:choose>

                                        </p>

                                    </div>

                                </div>


                                <div class="transaction-right">

                                    <c:choose>

                                        <c:when test="${transaction.transactionType == 'CREDIT'}">

                                            <div class="transaction-amount credit">
                                                + ₹ ${transaction.amount}
                                            </div>

                                        </c:when>

                                        <c:otherwise>

                                            <div class="transaction-amount debit">
                                                - ₹ ${transaction.amount}
                                            </div>

                                        </c:otherwise>

                                    </c:choose>


                                    <div class="transaction-balance">
                                        Balance:
                                        ₹ ${transaction.balanceAfterTransaction}
                                    </div>

                                </div>

                            </div>

                        </c:forEach>

                    </c:when>


                    <c:otherwise>

                        <div class="empty-state">

                            <div style="font-size:40px; margin-bottom:10px;">
                                📊
                            </div>

                            <h3>No transactions yet</h3>

                            <p>
                                Your recent transactions will appear here.
                            </p>

                        </div>

                    </c:otherwise>

                </c:choose>

            </div>


            <div class="section-card account-info">

                <div class="section-header">

                    <h2>👤 Account Information</h2>

                </div>

                <p>
                    <strong>Customer:</strong>
                    ${sessionScope.customer.fullName}
                </p>

                <p>
                    <strong>Email:</strong>
                    ${sessionScope.customer.email}
                </p>

                <p>
                    <strong>Mobile:</strong>
                    ${sessionScope.customer.mobile}
                </p>

                <p>
                    <strong>Account Number:</strong>
                    ${sessionScope.customer.account.accountNumber}
                </p>

                <p>
                    <strong>UPI ID:</strong>
                    ${sessionScope.customer.account.upiId}
                </p>

            </div>

        </div>


        <div class="footer">

            © 2026 Smart Bank Management System
            · Secure Digital Banking

        </div>

    </main>

</div>

</body>
</html>