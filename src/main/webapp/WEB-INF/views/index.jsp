<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>SmartBank | Simple. Secure. Smart.</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            color: #17243a;
            background: #f7faff;
        }

        .navbar {
            height: 72px;
            padding: 0 6%;
            background: white;
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 1px solid #edf1f6;
            position: sticky;
            top: 0;
            z-index: 10;
        }

        .logo {
            text-decoration: none;
            color: #0b3d91;
            font-size: 25px;
            font-weight: bold;
        }

        .logo span {
            color: #1687f7;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 24px;
        }

        .nav-links a {
            text-decoration: none;
            color: #475467;
            font-size: 14px;
            font-weight: bold;
        }

        .nav-links a:hover {
            color: #1687f7;
        }

        .nav-register {
            background: #0b3d91;
            color: white !important;
            padding: 10px 17px;
            border-radius: 8px;
        }

        .nav-register:hover {
            background: #1687f7;
        }

        .hero {
            min-height: 570px;
            padding: 80px 8%;
            display: grid;
            grid-template-columns: 1.1fr 0.9fr;
            gap: 70px;
            align-items: center;
            background:
                radial-gradient(circle at 90% 20%, rgba(22,135,247,0.14), transparent 30%),
                linear-gradient(135deg, #f8fbff, #eef6ff);
        }

        .hero-badge {
            display: inline-block;
            background: #e8f3ff;
            color: #0b5dcc;
            padding: 8px 13px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
            margin-bottom: 18px;
        }

        .hero h1 {
            font-size: 52px;
            line-height: 1.1;
            margin: 0 0 20px;
            color: #071a35;
        }

        .hero h1 span {
            color: #1687f7;
        }

        .hero p {
            max-width: 600px;
            color: #667085;
            font-size: 17px;
            line-height: 1.7;
            margin-bottom: 28px;
        }

        .hero-buttons {
            display: flex;
            gap: 13px;
            flex-wrap: wrap;
        }

        .btn-primary,
        .btn-secondary {
            text-decoration: none;
            padding: 13px 21px;
            border-radius: 9px;
            font-weight: bold;
            font-size: 14px;
            display: inline-block;
        }

        .btn-primary {
            background: #0b3d91;
            color: white;
        }

        .btn-primary:hover {
            background: #1687f7;
        }

        .btn-secondary {
            background: white;
            color: #0b3d91;
            border: 1px solid #d7e1ef;
        }

        .btn-secondary:hover {
            border-color: #1687f7;
            color: #1687f7;
        }

        .hero-card {
            background: linear-gradient(135deg, #071a35, #0b3d91, #1687f7);
            min-height: 300px;
            border-radius: 25px;
            padding: 30px;
            color: white;
            box-shadow: 0 25px 50px rgba(7,26,53,0.25);
            position: relative;
            overflow: hidden;
            transform: rotate(2deg);
        }

        .hero-card::before {
            content: "";
            position: absolute;
            width: 220px;
            height: 220px;
            border-radius: 50%;
            background: rgba(255,255,255,0.08);
            right: -80px;
            top: -80px;
        }

        .hero-card-title {
            font-size: 14px;
            font-weight: bold;
            letter-spacing: 2px;
        }

        .hero-card-number {
            margin-top: 75px;
            font-size: 25px;
            letter-spacing: 3px;
        }

        .hero-card-bottom {
            position: absolute;
            left: 30px;
            right: 30px;
            bottom: 30px;
            display: flex;
            justify-content: space-between;
        }

        .hero-card-small {
            font-size: 9px;
            opacity: 0.65;
            margin-bottom: 5px;
        }

        .hero-card-value {
            font-size: 12px;
            font-weight: bold;
        }

        .features {
            padding: 75px 8%;
            background: white;
        }

        .section-title {
            text-align: center;
            max-width: 650px;
            margin: 0 auto 40px;
        }

        .section-title h2 {
            margin: 0 0 10px;
            font-size: 30px;
            color: #071a35;
        }

        .section-title p {
            margin: 0;
            color: #748094;
            line-height: 1.6;
        }

        .feature-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            max-width: 1200px;
            margin: auto;
        }

        .feature-card {
            padding: 25px;
            border: 1px solid #e8edf3;
            border-radius: 17px;
            background: #fbfcfe;
            transition: 0.25s;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 25px rgba(0,0,0,0.07);
            border-color: #cfe2ff;
        }

        .feature-icon {
            width: 50px;
            height: 50px;
            border-radius: 13px;
            background: #eaf3ff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 25px;
            margin-bottom: 16px;
        }

        .feature-card h3 {
            margin: 0 0 9px;
        }

        .feature-card p {
            margin: 0;
            color: #718096;
            line-height: 1.6;
            font-size: 13px;
        }

        .cta {
            margin: 50px 8%;
            padding: 60px 30px;
            text-align: center;
            border-radius: 22px;
            color: white;
            background: linear-gradient(135deg, #071a35, #0b3d91, #1687f7);
        }

        .cta h2 {
            margin: 0 0 12px;
            font-size: 30px;
        }

        .cta p {
            margin: 0 auto 24px;
            opacity: 0.85;
        }

        .cta .btn-secondary {
            border: none;
        }

        .footer {
            background: #071a35;
            color: #aab8ca;
            text-align: center;
            padding: 25px;
            font-size: 12px;
        }

        @media (max-width: 950px) {

            .hero {
                grid-template-columns: 1fr;
                padding: 60px 7%;
                gap: 45px;
            }

            .hero h1 {
                font-size: 43px;
            }

            .feature-grid {
                grid-template-columns: repeat(2, 1fr);
            }

        }

        @media (max-width: 600px) {

            .navbar {
                padding: 0 20px;
            }

            .nav-links {
                gap: 10px;
            }

            .nav-links a:not(.nav-register) {
                display: none;
            }

            .hero {
                padding: 50px 20px;
            }

            .hero h1 {
                font-size: 37px;
            }

            .hero p {
                font-size: 15px;
            }

            .hero-card {
                min-height: 260px;
            }

            .features {
                padding: 55px 20px;
            }

            .feature-grid {
                grid-template-columns: 1fr;
            }

            .cta {
                margin: 30px 20px;
                padding: 45px 20px;
            }

        }

    </style>

</head>

<body>

<nav class="navbar">

    <a href="${pageContext.request.contextPath}/"
       class="logo">
        Smart<span>Bank</span>
    </a>

    <div class="nav-links">

        <a href="${pageContext.request.contextPath}/">
            Home
        </a>

        <a href="${pageContext.request.contextPath}/login"
           class="nav-login">
            Login
        </a>

        <a href="${pageContext.request.contextPath}/register"
           class="nav-register">
            Open Account
        </a>

    </div>

</nav>


<section class="hero">

    <div class="hero-content">

        <div class="hero-badge">
             Modern Digital Banking
        </div>

        <h1>
            Banking made
            <span>simple & smart.</span>
        </h1>

        <p>
            Manage your money, transfer funds, track transactions
            and apply for loans — all from one secure banking platform.
        </p>

        <div class="hero-buttons">

            <a href="${pageContext.request.contextPath}/register"
               class="btn-primary">
                Open Your Account →
            </a>

            <a href="${pageContext.request.contextPath}/login"
               class="btn-secondary">
                Login to Bank
            </a>

        </div>

    </div>


    <div class="hero-card">

        <div class="hero-card-title">
            SMART BANK
        </div>

        <div class="hero-card-number">
            •••• •••• •••• 2026
        </div>

        <div class="hero-card-bottom">

            <div>

                <div class="hero-card-small">
                    CARD HOLDER
                </div>

                <div class="hero-card-value">
                    SMART CUSTOMER
                </div>

            </div>

            <div>

                <div class="hero-card-small">
                    VALID THRU
                </div>

                <div class="hero-card-value">
                    12/30
                </div>

            </div>

        </div>

    </div>

</section>


<section class="features">

    <div class="section-title">

        <h2>
            Everything you need in one place
        </h2>

        <p>
            Powerful banking features designed to make your
            everyday banking easier.
        </p>

    </div>


    <div class="feature-grid">

        <div class="feature-card">

            <div class="feature-icon">💳</div>

            <h3>Smart Account</h3>

            <p>
                Create your secure bank account and manage
                your balance from your personal dashboard.
            </p>

        </div>


        <div class="feature-card">

            <div class="feature-icon">💸</div>

            <h3>Fund Transfer</h3>

            <p>
                Transfer money quickly using an account number
                or UPI ID.
            </p>

        </div>


        <div class="feature-card">

            <div class="feature-icon">📊</div>

            <h3>Mini Statement</h3>

            <p>
                View your latest transactions and receive
                your mini statement through email.
            </p>

        </div>


        <div class="feature-card">

            <div class="feature-icon">🏦</div>

            <h3>Easy Loans</h3>

            <p>
                Apply for a loan online and track your
                application status anytime.
            </p>

        </div>

    </div>

</section>


<section class="cta">

    <h2>
        Ready to start banking smarter?
    </h2>

    <p>
        Create your Smart Bank account and experience
        simple digital banking.
    </p>

    <a href="${pageContext.request.contextPath}/register"
       class="btn-secondary">
        Create Account
    </a>

</section>


<footer class="footer">

    <p>
        © 2026 Smart Bank Management System
        · Secure Digital Banking
    </p>

</footer>

</body>
</html>