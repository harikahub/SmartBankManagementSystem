<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<fmt:setLocale value="en_IN"/>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Dashboard | SmartBank</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background:
                radial-gradient(
                    circle at 15% 10%,
                    rgba(22,135,247,0.08),
                    transparent 28%
                ),
                radial-gradient(
                    circle at 90% 85%,
                    rgba(0,180,170,0.08),
                    transparent 30%
                ),
                #f4f8fc;
            color: #17243a;
        }

        /* =========================
           SIDEBAR
        ========================= */

        .dashboard-wrapper {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 255px;
            background:
                linear-gradient(
                    180deg,
                    #06152d,
                    #0b3d91 65%,
                    #087f8c
                );
            color: white;
            padding: 28px 18px;
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            box-shadow:
                8px 0 30px rgba(0,0,0,0.08);
            z-index: 10;
            overflow-y: auto;
        }

        .sidebar-brand {
            display: flex;
            align-items: center;
            gap: 11px;
            padding: 4px 9px;
            margin-bottom: 34px;
        }

        .sidebar-logo-icon {
            width: 44px;
            height: 44px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 13px;
            background:
                rgba(255,255,255,0.12);
            border:
                1px solid rgba(255,255,255,0.18);
            font-size: 21px;
            box-shadow:
                inset 0 1px
                rgba(255,255,255,0.16);
        }

        .sidebar-logo {
            font-size: 24px;
            font-weight: bold;
            margin: 0;
        }

        .sidebar-logo span {
            color: #5de7dc;
        }

        .sidebar-subtitle {
            color:
                rgba(255,255,255,0.58);
            font-size: 10px;
            margin-top: 3px;
        }

        .menu-label {
            color:
                rgba(255,255,255,0.42);
            font-size: 10px;
            text-transform: uppercase;
            letter-spacing: 1px;
            padding: 0 12px;
            margin-bottom: 9px;
        }

        .sidebar-menu {
            display: flex;
            flex-direction: column;
            gap: 7px;
        }

        .sidebar-menu a {
            text-decoration: none;
            color:
                rgba(255,255,255,0.76);
            padding: 13px 14px;
            border-radius: 12px;
            transition: 0.25s;
            font-size: 13px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .sidebar-menu a:hover {
            background:
                rgba(255,255,255,0.10);
            color: white;
            transform:
                translateX(3px);
        }

        .sidebar-menu .active {
            background:
                linear-gradient(
                    135deg,
                    #1687f7,
                    #10a9a0
                );
            color: white;
            box-shadow:
                0 8px 20px
                rgba(0,0,0,0.18);
        }

        .logout-link {
            margin-top: 20px;
            color: #ffd0d0 !important;
        }

        .logout-link:hover {
            background:
                rgba(220,53,69,0.13)
                !important;
        }

        /* =========================
           MAIN
        ========================= */

        .main-content {
            margin-left: 255px;
            width:
                calc(100% - 255px);
            min-height: 100vh;
        }

        /* =========================
           TOPBAR
        ========================= */

        .topbar {
            height: 74px;
            background:
                rgba(255,255,255,0.88);
            backdrop-filter:
                blur(15px);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 34px;
            border-bottom:
                1px solid #e6edf4;
            position: sticky;
            top: 0;
            z-index: 5;
        }

        .topbar-title {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .topbar-title h2 {
            margin: 0;
            font-size: 19px;
        }

        .topbar-title span {
            color: #1687f7;
            font-size: 12px;
        }

        .profile {
            display: flex;
            align-items: center;
            gap: 11px;
        }

        .profile-name {
            font-size: 13px;
            font-weight: bold;
            color: #344054;
        }

        .profile-icon {
            width: 42px;
            height: 42px;
            border-radius: 14px;
            background:
                linear-gradient(
                    135deg,
                    #0b3d91,
                    #1687f7 60%,
                    #10a9a0
                );
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            box-shadow:
                0 7px 16px
                rgba(11,61,145,0.20);
        }

        /* =========================
           CONTENT
        ========================= */

        .content {
            padding: 30px;
        }

        /* =========================
           WELCOME
        ========================= */

        .welcome-banner {
            position: relative;
            overflow: hidden;
            background:
                linear-gradient(
                    135deg,
                    #061a38,
                    #0b4fa8 60%,
                    #087f8c
                );
            color: white;
            padding: 29px 31px;
            border-radius: 22px;
            margin-bottom: 21px;
            box-shadow:
                0 18px 40px
                rgba(11,61,145,0.17);
        }

        .welcome-banner::after {
            content: "";
            position: absolute;
            width: 180px;
            height: 180px;
            border-radius: 50%;
            background:
                rgba(255,255,255,0.07);
            right: -55px;
            top: -80px;
        }

        .welcome-banner h1 {
            position: relative;
            z-index: 1;
            margin: 0 0 8px;
            font-size: 27px;
        }

        .welcome-banner p {
            position: relative;
            z-index: 1;
            margin: 0;
            opacity: 0.82;
            font-size: 13px;
        }

        /* =========================
           BALANCE
        ========================= */

        .balance-card {
            position: relative;
            overflow: hidden;
            background:
                linear-gradient(
                    145deg,
                    #ffffff,
                    #f5fbff
                );
            border-radius: 20px;
            padding: 27px;
            margin-bottom: 21px;
            border:
                1px solid #e3edf5;
            box-shadow:
                0 12px 30px
                rgba(20,40,70,0.07);
        }

        .balance-card::after {
            content: "";
            position: absolute;
            width: 130px;
            height: 130px;
            border-radius: 50%;
            background:
                rgba(0,214,201,0.08);
            right: -35px;
            bottom: -55px;
        }

        .balance-label {
            color: #6c7890;
            font-size: 12px;
            margin-bottom: 7px;
        }

        .balance-amount {
            font-size: 38px;
            font-weight: bold;
            color: #092b57;
            margin-bottom: 12px;
            position: relative;
            z-index: 1;
        }

        .account-number {
            color: #68768a;
            font-size: 12px;
            word-break: break-word;
            position: relative;
            z-index: 1;
        }

        /* =========================
           INFO CARDS
        ========================= */

        .cards-row {
            display: grid;
            grid-template-columns:
                repeat(3, 1fr);
            gap: 17px;
            margin-bottom: 21px;
        }

        .info-card {
            background:
                rgba(255,255,255,0.94);
            border-radius: 18px;
            padding: 21px;
            border:
                1px solid #e6edf4;
            box-shadow:
                0 10px 26px
                rgba(20,40,70,0.055);
            transition: 0.25s;
        }

        .info-card:hover {
            transform:
                translateY(-3px);
            box-shadow:
                0 15px 32px
                rgba(20,40,70,0.09);
        }

        .info-card .icon {
            width: 46px;
            height: 46px;
            border-radius: 14px;
            background:
                linear-gradient(
                    145deg,
                    #eaf5ff,
                    #e5faf7
                );
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            margin-bottom: 13px;
        }

        .info-card h3 {
            margin: 0 0 7px;
            font-size: 15px;
        }

        .info-card p {
            margin: 0;
            color: #6d7888;
            font-size: 12px;
            line-height: 1.5;
            word-break: break-word;
        }

        /* =========================
           SECTION CARDS
        ========================= */

        .section-card {
            background:
                rgba(255,255,255,0.96);
            border-radius: 19px;
            padding: 24px;
            margin-bottom: 21px;
            border:
                1px solid #e6edf4;
            box-shadow:
                0 10px 26px
                rgba(20,40,70,0.05);
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 16px;
        }

        .section-header h2 {
            margin: 0;
            font-size: 18px;
        }

        .view-all {
            text-decoration: none;
            color: #1687f7;
            font-size: 12px;
            font-weight: bold;
        }

        .view-all:hover {
            color: #087f8c;
        }

        /* =========================
           QUICK ACTIONS
        ========================= */

        .quick-actions {
            display: grid;
            grid-template-columns:
                repeat(4, 1fr);
            gap: 13px;
        }

        .action-card {
            text-decoration: none;
            color: #17243a;
            background:
                linear-gradient(
                    145deg,
                    #f9fcff,
                    #f2fbfa
                );
            border:
                1px solid #e2ebf2;
            border-radius: 15px;
            padding: 20px 12px;
            text-align: center;
            transition: 0.25s;
            position: relative;
            overflow: hidden;
        }

        .action-card::before {
            content: "";
            position: absolute;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background:
                rgba(22,135,247,0.07);
            top: -25px;
            right: -20px;
        }

        .action-card:hover {
            transform:
                translateY(-4px);
            border-color: #1687f7;
            box-shadow:
                0 10px 22px
                rgba(11,61,145,0.10);
        }

        .action-card div {
            font-size: 25px;
            margin-bottom: 9px;
            position: relative;
        }

        .action-card span {
            font-size: 11px;
            font-weight: bold;
            position: relative;
        }

        /* =========================
           TRANSACTIONS
        ========================= */

        .transaction {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 15px 0;
            border-bottom:
                1px solid #edf0f4;
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
            border-radius: 13px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 19px;
            flex-shrink: 0;
        }

        .credit-icon {
            background: #e7f8ef;
            color: #159447;
        }

        .debit-icon {
            background: #ffebeb;
            color: #d93636;
        }

        .transaction-info {
            min-width: 0;
        }

        .transaction-info h4 {
            margin: 0 0 5px;
            font-size: 13px;
        }

        .transaction-info p {
            margin: 0 0 3px;
            color: #788494;
            font-size: 10px;
            word-break: break-word;
        }

        .transaction-right {
            text-align: right;
            margin-left: 15px;
            flex-shrink: 0;
        }

        .transaction-amount {
            font-weight: bold;
            font-size: 13px;
        }

        .credit {
            color: #159447;
        }

        .debit {
            color: #d93636;
        }

        .transaction-balance {
            color: #788494;
            font-size: 10px;
            margin-top: 5px;
        }

        .empty-state {
            text-align: center;
            padding: 35px 10px;
            color: #7a8696;
        }

        /* =========================
           ACCOUNT INFORMATION
        ========================= */

        .account-info p {
            color: #667085;
            font-size: 13px;
            padding: 11px 0;
            margin: 0;
            border-bottom:
                1px solid #edf0f4;
        }

        .account-info p:last-child {
            border-bottom: none;
        }

        .account-info strong {
            color: #344054;
        }

        /* =========================
           FOOTER
        ========================= */

        .footer {
            text-align: center;
            color: #8792a2;
            font-size: 11px;
            padding: 18px;
        }

        /* =========================
           RESPONSIVE
        ========================= */

        @media (max-width: 1000px) {

            .sidebar {
                width: 220px;
            }

            .main-content {
                margin-left: 220px;
                width:
                    calc(100% - 220px);
            }

            .cards-row {
                grid-template-columns: 1fr;
            }

            .quick-actions {
                grid-template-columns:
                    repeat(2, 1fr);
            }

            .content {
                padding: 23px;
            }
        }

        @media (max-width: 700px) {

            body {
                overflow-x: hidden;
            }

            .dashboard-wrapper {
                display: block;
            }

            .sidebar {
                position: relative;
                width: 100%;
                min-height: auto;
                padding: 20px 16px;
            }

            .sidebar-brand {
                margin-bottom: 20px;
            }

            .menu-label {
                display: none;
            }

            .sidebar-menu {
                display: grid;
                grid-template-columns:
                    repeat(2, 1fr);
            }

            .logout-link {
                margin-top: 0;
            }

            .main-content {
                margin-left: 0;
                width: 100%;
            }

            .topbar {
                padding: 0 18px;
                height: 66px;
            }

            .topbar-title h2 {
                font-size: 16px;
            }

            .profile-name {
                display: none;
            }

            .content {
                padding: 18px;
            }

            .welcome-banner {
                padding: 24px 21px;
            }

            .welcome-banner h1 {
                font-size: 22px;
            }

            .balance-amount {
                font-size: 30px;
            }

            .quick-actions {
                grid-template-columns:
                    repeat(2, 1fr);
            }
        }

        @media (max-width: 430px) {

            .sidebar-menu {
                grid-template-columns: 1fr;
            }

            .quick-actions {
                grid-template-columns:
                    1fr 1fr;
            }

            .transaction {
                align-items: flex-start;
            }

            .transaction-right {
                margin-left: 8px;
            }

            .transaction-info h4 {
                font-size: 12px;
            }
        }

    </style>

</head>


<body>

<div class="dashboard-wrapper">


    <!-- =========================
         SIDEBAR
    ========================== -->

    <aside class="sidebar">

        <div class="sidebar-brand">

            <div class="sidebar-logo-icon">
                🏦
            </div>

            <div>

                <div class="sidebar-logo">
                    Smart<span>Bank</span>
                </div>

                <div class="sidebar-subtitle">
                    Secure Digital Banking
                </div>

            </div>

        </div>


        <div class="menu-label">
            Banking
        </div>


        <div class="sidebar-menu">

            <a
                href="${pageContext.request.contextPath}/dashboard"
                class="active">

                🏠
                <span>Dashboard</span>

            </a>


            <a
                href="${pageContext.request.contextPath}/transfer">

                💸
                <span>Fund Transfer</span>

            </a>


            <a
                href="${pageContext.request.contextPath}/transactions">

                📊
                <span>Mini Statement</span>

            </a>


            <a
                href="${pageContext.request.contextPath}/loan/apply">

                🏦
                <span>Apply Loan</span>

            </a>


            <a
                href="${pageContext.request.contextPath}/loan/status">

                📋
                <span>Loan Status</span>

            </a>


            <a
                href="${pageContext.request.contextPath}/logout"
                class="logout-link">

                🚪
                <span>Logout</span>

            </a>

        </div>

    </aside>


    <!-- =========================
         MAIN CONTENT
    ========================== -->

    <main class="main-content">


        <!-- TOPBAR -->

        <div class="topbar">

            <div class="topbar-title">

                <h2>
                    Customer Dashboard
                </h2>

                <span>
                    • Secure
                </span>

            </div>


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


            <!-- WELCOME -->

            <div class="welcome-banner">

                <h1>
                    Welcome back,
                    ${sessionScope.customer.fullName}! 👋
                </h1>

                <p>
                    Manage your SmartBank account securely
                    from one place.
                </p>

            </div>


            <!-- BALANCE -->

            <div class="balance-card">

                <div class="balance-label">
                    Available Balance
                </div>


                <div class="balance-amount">

                    ₹
                    <fmt:formatNumber
                        value="${sessionScope.customer.account.balance}"
                        pattern="#,##,##0.00"/>

                </div>


                <div class="account-number">

                    Account Number:
                    ${sessionScope.customer.account.accountNumber}

                    &nbsp; | &nbsp;

                    UPI:
                    ${sessionScope.customer.account.upiId}

                </div>

            </div>


            <!-- ACCOUNT STATUS -->

            <div class="cards-row">


                <div class="info-card">

                    <div class="icon">
                        🏦
                    </div>

                    <h3>
                        Bank Account
                    </h3>

                    <p>
                        Your SmartBank account is active
                        and ready for transactions.
                    </p>

                </div>


                <div class="info-card">

                    <div class="icon">
                        🔐
                    </div>

                    <h3>
                        Account Security
                    </h3>

                    <p>
                        Your account is protected with
                        OTP verification.
                    </p>

                </div>


                <div class="info-card">

                    <div class="icon">
                        📧
                    </div>

                    <h3>
                        Email Verified
                    </h3>

                    <p>
                        ${sessionScope.customer.email}
                    </p>

                </div>

            </div>


            <!-- QUICK ACTIONS -->

            <div class="section-card">

                <div class="section-header">

                    <h2>
                        ⚡ Quick Actions
                    </h2>

                </div>


                <div class="quick-actions">


                    <a
                        href="${pageContext.request.contextPath}/transfer"
                        class="action-card">

                        <div>
                            💸
                        </div>

                        <span>
                            Fund Transfer
                        </span>

                    </a>


                    <a
                        href="${pageContext.request.contextPath}/transactions"
                        class="action-card">

                        <div>
                            📊
                        </div>

                        <span>
                            Mini Statement
                        </span>

                    </a>


                    <a
                        href="${pageContext.request.contextPath}/loan/apply"
                        class="action-card">

                        <div>
                            🏦
                        </div>

                        <span>
                            Apply Loan
                        </span>

                    </a>


                    <a
                        href="${pageContext.request.contextPath}/loan/status"
                        class="action-card">

                        <div>
                            📋
                        </div>

                        <span>
                            Loan Status
                        </span>

                    </a>

                </div>

            </div>


            <!-- RECENT TRANSACTIONS -->

            <div class="section-card">


                <div class="section-header">

                    <h2>
                        📊 Recent Transactions
                    </h2>


                    <a
                        href="${pageContext.request.contextPath}/transactions"
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


                                        <c:when
                                            test="${transaction.transactionType == 'CREDIT'}">

                                            <div
                                                class="transaction-icon credit-icon">

                                                ↓

                                            </div>

                                        </c:when>


                                        <c:otherwise>

                                            <div
                                                class="transaction-icon debit-icon">

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

                                                <c:when
                                                    test="${transaction.transactionType == 'CREDIT'}">

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


                                        <c:when
                                            test="${transaction.transactionType == 'CREDIT'}">

                                            <div
                                                class="transaction-amount credit">

                                                + ₹
                                                <fmt:formatNumber
                                                    value="${transaction.amount}"
                                                    pattern="#,##,##0.00"/>

                                            </div>

                                        </c:when>


                                        <c:otherwise>

                                            <div
                                                class="transaction-amount debit">

                                                - ₹
                                                <fmt:formatNumber
                                                    value="${transaction.amount}"
                                                    pattern="#,##,##0.00"/>

                                            </div>

                                        </c:otherwise>


                                    </c:choose>


                                    <div class="transaction-balance">

                                        Balance:
                                        ₹
                                        <fmt:formatNumber
                                            value="${transaction.balanceAfterTransaction}"
                                            pattern="#,##,##0.00"/>

                                    </div>

                                </div>


                            </div>


                        </c:forEach>


                    </c:when>


                    <c:otherwise>


                        <div class="empty-state">

                            <div
                                style="font-size:40px; margin-bottom:10px;">

                                📊

                            </div>


                            <h3>
                                No transactions yet
                            </h3>


                            <p>
                                Your recent transactions
                                will appear here.
                            </p>

                        </div>


                    </c:otherwise>


                </c:choose>


            </div>


            <!-- ACCOUNT INFORMATION -->

            <div class="section-card account-info">


                <div class="section-header">

                    <h2>
                        👤 Account Information
                    </h2>

                </div>


                <p>

                    <strong>
                        Customer:
                    </strong>

                    ${sessionScope.customer.fullName}

                </p>


                <p>

                    <strong>
                        Email:
                    </strong>

                    ${sessionScope.customer.email}

                </p>


                <p>

                    <strong>
                        Mobile:
                    </strong>

                    ${sessionScope.customer.mobile}

                </p>


                <p>

                    <strong>
                        Account Number:
                    </strong>

                    ${sessionScope.customer.account.accountNumber}

                </p>


                <p>

                    <strong>
                        UPI ID:
                    </strong>

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
