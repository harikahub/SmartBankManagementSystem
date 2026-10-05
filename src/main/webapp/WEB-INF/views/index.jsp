<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>SmartBank | Digital Banking</title>

<style>

/* =========================
   RESET
========================= */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html {
    scroll-behavior: smooth;
}

body {
    font-family: "Segoe UI", Arial, sans-serif;
    background: #f8fcff;
    color: #092653;
}

a {
    text-decoration: none;
}

.container {
    width: 90%;
    max-width: 1180px;
    margin: auto;
}


/* =========================
   NAVBAR
========================= */

.navbar {
    height: 72px;
    background: rgba(255,255,255,0.94);
    backdrop-filter: blur(15px);
    border-bottom: 1px solid #e4f0fa;

    position: sticky;
    top: 0;
    z-index: 1000;
}

.nav-container {
    width: 90%;
    max-width: 1280px;
    height: 100%;
    margin: auto;

    display: flex;
    align-items: center;
    justify-content: space-between;
}

.logo {
    display: flex;
    align-items: center;
    gap: 10px;
}

.logo-icon {
    width: 42px;
    height: 42px;

    display: flex;
    align-items: center;
    justify-content: center;

    background: linear-gradient(145deg,#087ee7,#06499f);
    color: white;

    border-radius: 12px;

    box-shadow:
        inset 3px 3px 7px rgba(255,255,255,.25),
        0 8px 18px rgba(7,101,180,.22);

    font-size: 21px;
}

.logo-text h2 {
    color: #082d63;
    font-size: 22px;
}

.logo-text h2 span {
    color: #0887e8;
}

.logo-text small {
    display: block;
    color: #7188a2;
    font-size: 9px;
    letter-spacing: .5px;
}

.nav-links {
    display: flex;
    align-items: center;
    gap: 30px;
}

.nav-links a {
    color: #244263;
    font-size: 14px;
    font-weight: 500;
}

.nav-links a:hover {
    color: #0784e5;
}

.nav-links .active {
    color: #087fe2;
}

.open-account {
    padding: 11px 19px;

    color: white !important;

    border-radius: 10px;

    background: linear-gradient(135deg,#0752af,#0789ed);

    box-shadow:
        0 8px 18px rgba(7,111,205,.25),
        inset 1px 1px 2px rgba(255,255,255,.25);
}


/* =========================
   HERO
========================= */

.hero {
    position: relative;
    overflow: hidden;

    padding: 65px 0 75px;

    background:
        radial-gradient(circle at 78% 40%,rgba(73,190,255,.25),transparent 28%),
        linear-gradient(135deg,#f5fbff,#e7f5ff);
}

.hero::before {
    content: "";
    position: absolute;

    width: 500px;
    height: 500px;

    border-radius: 50%;

    background: rgba(86,194,255,.09);

    right: -160px;
    top: -180px;
}

.hero-content {
    position: relative;
    z-index: 2;

    display: grid;
    grid-template-columns: 1fr 1fr;

    align-items: center;

    gap: 40px;
}

.badge {
    display: inline-block;

    padding: 9px 16px;

    border-radius: 30px;

    color: #087ce2;
    background: #e1f3ff;

    font-size: 12px;
    font-weight: 600;

    box-shadow:
        inset 2px 2px 5px rgba(255,255,255,.8),
        0 5px 12px rgba(41,141,211,.08);
}

.hero h1 {
    margin-top: 20px;

    font-size: 58px;
    line-height: 1.02;

    color: #082653;
}

.hero h1 span {
    color: #087fe2;
}

.hero-description {
    max-width: 560px;

    margin-top: 22px;

    color: #607995;

    font-size: 16px;
    line-height: 1.7;
}

.hero-buttons {
    display: flex;
    gap: 14px;

    margin-top: 30px;
}

.primary-btn {
    display: inline-block;

    padding: 15px 24px;

    color: white;

    border-radius: 11px;

    background: linear-gradient(135deg,#0754b3,#078cf0);

    box-shadow:
        0 12px 25px rgba(8,123,220,.25),
        inset 1px 1px 2px rgba(255,255,255,.3);

    font-size: 14px;
    font-weight: 600;

    transition: .25s;
}

.secondary-btn {
    display: inline-block;

    padding: 15px 24px;

    color: #0b3267;

    border: 1px solid #bfdcf3;
    border-radius: 11px;

    background: rgba(255,255,255,.8);

    box-shadow:
        5px 5px 15px rgba(26,108,163,.06),
        inset 2px 2px 5px white;

    font-size: 14px;
    font-weight: 600;

    transition: .25s;
}

.primary-btn:hover,
.secondary-btn:hover {
    transform: translateY(-3px);
}

.highlights {
    display: flex;
    gap: 32px;

    margin-top: 38px;
}

.highlight {
    display: flex;
    align-items: center;
    gap: 9px;
}

.highlight-icon {
    width: 34px;
    height: 34px;

    border-radius: 10px;

    display: flex;
    align-items: center;
    justify-content: center;

    background: #e0f3ff;
    color: #087fe2;

    box-shadow:
        3px 3px 8px rgba(34,122,179,.1),
        inset 2px 2px 5px white;
}

.highlight strong {
    display: block;

    color: #173b65;
    font-size: 11px;
}

.highlight small {
    color: #8093a8;
    font-size: 9px;
}


/* =========================
   3D HERO VISUAL
========================= */

.hero-visual {
    height: 430px;

    position: relative;

    display: flex;
    align-items: center;
    justify-content: center;

    perspective: 1200px;
}

.glow-circle {
    position: absolute;

    width: 390px;
    height: 390px;

    border-radius: 50%;

    background:
        radial-gradient(circle,
        rgba(104,211,255,.35),
        rgba(104,211,255,.08) 55%,
        transparent 70%);
}


/* PHONE */

.phone {
    position: absolute;

    width: 220px;
    height: 385px;

    right: 45px;
    top: 20px;

    padding: 27px 17px;

    border: 7px solid #104b82;
    border-radius: 31px;

    background: rgba(255,255,255,.93);

    box-shadow:
        20px 25px 45px rgba(12,82,139,.25),
        inset 3px 3px 8px white;

    transform:
        rotateY(-8deg)
        rotateX(4deg)
        rotateZ(2deg);

    z-index: 4;
}

.phone-notch {
    width: 65px;
    height: 8px;

    margin: -17px auto 25px;

    background: #123b69;

    border-radius: 10px;
}

.phone-label {
    color: #7b90a7;
    font-size: 9px;
}

.phone-balance {
    color: #082d63;

    font-size: 24px;
    font-weight: 700;

    margin: 5px 0 25px;
}

.phone-row {
    height: 48px;

    border-bottom: 1px solid #eaf1f7;

    display: flex;
    align-items: center;
    justify-content: space-between;

    color: #365575;

    font-size: 10px;
}

.phone-row .icon {
    color: #087fe2;
    font-size: 15px;
}


/* CARD */

.bank-card {
    position: absolute;

    width: 285px;
    height: 175px;

    left: 5px;
    bottom: 60px;

    padding: 22px;

    border-radius: 20px;

    color: white;

    background:
        linear-gradient(135deg,#062b61,#087fe4);

    box-shadow:
        20px 25px 35px rgba(5,65,125,.32),
        inset 2px 2px 4px rgba(255,255,255,.25);

    transform:
        perspective(800px)
        rotateY(12deg)
        rotateX(4deg)
        rotateZ(-7deg);

    z-index: 6;
}

.bank-card::after {
    content: "";

    position: absolute;

    width: 130px;
    height: 130px;

    border-radius: 50%;

    background: rgba(255,255,255,.08);

    right: -50px;
    top: -55px;
}

.card-name {
    font-size: 11px;
    letter-spacing: 2px;
}

.chip {
    width: 34px;
    height: 25px;

    background: linear-gradient(135deg,#e6d28e,#bba95f);

    border-radius: 5px;

    margin-top: 25px;
}

.card-number {
    margin-top: 12px;

    letter-spacing: 3px;
    font-size: 12px;
}

.card-bottom {
    display: flex;
    justify-content: space-between;

    margin-top: 10px;

    font-size: 8px;
}

.card-holder {
    font-size: 10px;
    font-weight: 600;
}


/* FLOATING SHAPES */

.float-shape {
    position: absolute;

    border-radius: 50%;

    background: linear-gradient(145deg,#d9f4ff,#72cfff);

    box-shadow:
        8px 10px 20px rgba(28,124,183,.12),
        inset 2px 2px 5px white;
}

.shape-one {
    width: 35px;
    height: 35px;

    top: 60px;
    right: 10px;
}

.shape-two {
    width: 20px;
    height: 20px;

    bottom: 40px;
    right: 10px;
}

.shape-three {
    width: 28px;
    height: 28px;

    top: 110px;
    left: 55px;
}


/* =========================
   SERVICES
========================= */

.services {
    padding: 70px 0 55px;
    background: white;
}

.section-label {
    color: #1187e5;

    font-size: 12px;
    font-weight: 700;

    letter-spacing: 1px;
}

.services h2 {
    margin-top: 8px;

    color: #092653;

    font-size: 34px;
}

.section-text {
    margin-top: 8px;
    margin-bottom: 30px;

    color: #71869f;

    font-size: 15px;
}

.service-grid {
    display: grid;

    grid-template-columns: repeat(4,1fr);

    gap: 20px;
}

.service-card {
    padding: 24px;

    border: 1px solid #deedf8;
    border-radius: 16px;

    background: linear-gradient(145deg,#ffffff,#f8fcff);

    box-shadow:
        8px 10px 25px rgba(24,107,159,.06),
        inset 2px 2px 5px white;

    transition: .25s;
}

.service-card:hover {
    transform: translateY(-7px);

    box-shadow:
        12px 18px 35px rgba(24,107,159,.11);
}

.service-icon {
    width: 50px;
    height: 50px;

    display: flex;
    align-items: center;
    justify-content: center;

    border-radius: 50%;

    color: #087fe2;
    background: #e1f3ff;

    box-shadow:
        5px 6px 12px rgba(34,126,184,.08),
        inset 2px 2px 5px white;

    font-size: 20px;
}

.service-card h3 {
    margin-top: 18px;

    color: #0b3267;

    font-size: 16px;
}

.service-card p {
    margin-top: 9px;

    color: #72869d;

    font-size: 12px;
    line-height: 1.6;
}


/* =========================
   TRUST
========================= */

.trust {
    padding: 25px 0 65px;
}

.trust-box {
    padding: 42px 50px;

    border-radius: 20px;

    background:
        radial-gradient(circle at 100% 0%,rgba(83,194,255,.2),transparent 30%),
        linear-gradient(135deg,#edf8ff,#f7fcff);

    box-shadow:
        8px 12px 30px rgba(24,105,160,.07),
        inset 2px 2px 7px white;

    display: grid;

    grid-template-columns: .85fr 1.15fr;

    gap: 40px;
}

.trust-box h2 {
    margin-top: 8px;

    color: #092653;

    font-size: 32px;
    line-height: 1.15;
}

.trust-box p {
    max-width: 400px;

    margin: 15px 0 22px;

    color: #647b95;

    font-size: 13px;
    line-height: 1.7;
}

.trust-grid {
    display: grid;

    grid-template-columns: 1fr 1fr;

    gap: 24px;
}

.trust-item {
    display: flex;
    gap: 12px;
}

.trust-icon {
    width: 42px;
    height: 42px;

    flex-shrink: 0;

    display: flex;
    align-items: center;
    justify-content: center;

    border-radius: 50%;

    background: #e0f3ff;
    color: #087fe2;

    box-shadow:
        4px 6px 12px rgba(32,119,178,.08),
        inset 2px 2px 5px white;
}

.trust-item strong {
    display: block;

    color: #183b62;

    font-size: 12px;
}

.trust-item small {
    display: block;

    margin-top: 4px;

    color: #7890a7;

    font-size: 10px;
    line-height: 1.4;
}


/* =========================
   CTA
========================= */

.cta {
    padding-bottom: 55px;
}

.cta-box {
    padding: 28px 42px;

    border-radius: 17px;

    color: white;

    background:
        radial-gradient(circle at 90% 50%,rgba(255,255,255,.15),transparent 20%),
        linear-gradient(135deg,#062c67,#0789ed);

    box-shadow:
        10px 15px 35px rgba(7,86,155,.22),
        inset 2px 2px 4px rgba(255,255,255,.15);

    display: flex;
    align-items: center;
    justify-content: space-between;
}

.cta-box h2 {
    font-size: 21px;
}

.cta-box p {
    margin-top: 5px;

    font-size: 12px;
    opacity: .82;
}

.cta-btn {
    padding: 12px 21px;

    border-radius: 10px;

    background: white;
    color: #0755b3;

    font-size: 12px;
    font-weight: 700;
}


/* =========================
   BANKING SERVICES
========================= */

.banking-services {
    padding-bottom: 65px;
}

.banking-services h2 {
    color: #092653;
    font-size: 25px;
}

.banking-services > .container > p {
    color: #71869f;
    font-size: 13px;

    margin-top: 5px;
}

.banking-grid {
    display: grid;

    grid-template-columns: repeat(4,1fr);

    margin-top: 22px;
}

.banking-item {
    text-align: center;

    padding: 15px;

    border-right: 1px solid #e5eef6;
}

.banking-item:last-child {
    border-right: none;
}

.banking-icon {
    width: 48px;
    height: 48px;

    margin: auto;

    display: flex;
    align-items: center;
    justify-content: center;

    border-radius: 50%;

    color: #087fe2;
    background: #e2f4ff;

    box-shadow:
        4px 6px 12px rgba(32,119,178,.07),
        inset 2px 2px 5px white;
}

.banking-item h4 {
    margin-top: 9px;

    color: #173b62;

    font-size: 11px;
}


/* =========================
   FOOTER
========================= */

.footer {
    padding: 28px 0;

    border-top: 1px solid #e5eef6;

    background: white;
}

.footer-container {
    width: 90%;
    max-width: 1180px;

    margin: auto;

    display: flex;
    align-items: center;
    justify-content: space-between;
}

.footer-brand {
    display: flex;
    align-items: center;
    gap: 8px;
}

.footer-brand-icon {
    color: #087fe2;
    font-size: 24px;
}

.footer-brand strong {
    display: block;

    color: #092d63;

    font-size: 14px;
}

.footer-brand small {
    color: #8293a7;
    font-size: 9px;
}

.footer-links {
    display: flex;
    gap: 20px;
}

.footer-links a {
    color: #647a94;
    font-size: 10px;
}

.footer-copy {
    color: #8495a9;
    font-size: 9px;
}


/* =========================
   RESPONSIVE
========================= */

@media(max-width:900px) {

    .hero-content {
        grid-template-columns: 1fr;
    }

    .hero-visual {
        margin-top: 20px;
    }

    .service-grid {
        grid-template-columns: 1fr 1fr;
    }

    .trust-box {
        grid-template-columns: 1fr;
    }

    .banking-grid {
        grid-template-columns: 1fr 1fr;
    }
}

@media(max-width:600px) {

    .nav-links {
        gap: 10px;
    }

    .nav-links a:nth-child(2),
    .nav-links a:nth-child(3) {
        display: none;
    }

    .hero h1 {
        font-size: 42px;
    }

    .hero-buttons {
        flex-direction: column;
    }

    .highlights {
        flex-direction: column;
        gap: 12px;
    }

    .hero-visual {
        transform: scale(.78);
        margin-left: -35px;
    }

    .service-grid {
        grid-template-columns: 1fr;
    }

    .trust-grid {
        grid-template-columns: 1fr;
    }

    .cta-box {
        flex-direction: column;
        align-items: flex-start;
        gap: 20px;
    }

    .footer-container {
        flex-direction: column;
        gap: 18px;
        text-align: center;
    }

}

</style>
</head>


<body>


<!-- =========================
     NAVBAR
========================= -->

<header class="navbar">

    <div class="nav-container">

        <a href="${pageContext.request.contextPath}/"
           class="logo">

            <div class="logo-icon">
                🏦
            </div>

            <div class="logo-text">

                <h2>
                    Smart<span>Bank</span>
                </h2>

                <small>
                    Digital Banking
                </small>

            </div>

        </a>


        <nav class="nav-links">

            <a href="${pageContext.request.contextPath}/"
               class="active">
                Home
            </a>

            <a href="#services">
                Features
            </a>

            <a href="#about">
                About
            </a>

            <a href="${pageContext.request.contextPath}/login">
                Login
            </a>

            <a href="${pageContext.request.contextPath}/register"
               class="open-account">
                Open Account
            </a>

        </nav>

    </div>

</header>


<!-- =========================
     HERO
========================= -->

<section class="hero">

    <div class="container hero-content">


        <div>

            <div class="badge">
                🛡 Secure &nbsp;•&nbsp; ⚡ Fast &nbsp;•&nbsp; ✓ Reliable
            </div>


            <h1>
                Bank smarter.<br>
                <span>Live simpler.</span>
            </h1>


            <p class="hero-description">

                Manage your money, transfer funds, track transactions
                and apply for loans — all from one secure banking platform.

            </p>


            <div class="hero-buttons">

                <a href="${pageContext.request.contextPath}/register"
                   class="primary-btn">
                    Open Your Account →
                </a>

                <a href="${pageContext.request.contextPath}/login"
                   class="secondary-btn">
                    Login to Bank
                </a>

            </div>


            <div class="highlights">


                <div class="highlight">

                    <div class="highlight-icon">
                        🛡
                    </div>

                    <div>
                        <strong>100% Secure</strong>
                        <small>Your data is safe with us</small>
                    </div>

                </div>


                <div class="highlight">

                    <div class="highlight-icon">
                        ⚡
                    </div>

                    <div>
                        <strong>Fast Transactions</strong>
                        <small>Quick & hassle-free</small>
                    </div>

                </div>


                <div class="highlight">

                    <div class="highlight-icon">
                        🎧
                    </div>

                    <div>
                        <strong>24/7 Support</strong>
                        <small>We're always here</small>
                    </div>

                </div>


            </div>

        </div>


        <!-- =========================
             3D BANKING VISUAL
        ========================= -->

        <div class="hero-visual">

            <div class="glow-circle"></div>


            <div class="float-shape shape-one"></div>
            <div class="float-shape shape-two"></div>
            <div class="float-shape shape-three"></div>


            <!-- PHONE -->

            <div class="phone">

                <div class="phone-notch"></div>

                <div class="phone-label">
                    Available Balance
                </div>

                <div class="phone-balance">
                    ₹ 1,00,000.00
                </div>


                <div class="phone-row">

                    <span class="icon">↔</span>
                    <span>Fund Transfer</span>
                    <span>›</span>

                </div>


                <div class="phone-row">

                    <span class="icon">▤</span>
                    <span>Mini Statement</span>
                    <span>›</span>

                </div>


                <div class="phone-row">

                    <span class="icon">♙</span>
                    <span>Apply Loan</span>
                    <span>›</span>

                </div>


                <div class="phone-row">

                    <span class="icon">✓</span>
                    <span>Loan Status</span>
                    <span>›</span>

                </div>

            </div>


            <!-- CARD -->

            <div class="bank-card">

                <div class="card-name">
                    SMART BANK
                </div>

                <div class="chip"></div>

                <div class="card-number">
                    •••• •••• •••• 2026
                </div>


                <div class="card-bottom">

                    <div>

                        <small>CARD HOLDER</small>

                        <div class="card-holder">
                            SMART CUSTOMER
                        </div>

                    </div>


                    <div>

                        <small>VALID THRU</small>

                        <div class="card-holder">
                            12/30
                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</section>


<!-- =========================
     SERVICES
========================= -->

<section class="services" id="services">

    <div class="container">

        <div class="section-label">
            OUR SERVICES
        </div>

        <h2>
            Everything you need in one place
        </h2>

        <p class="section-text">
            Powerful banking features designed to make your everyday banking easier.
        </p>


        <div class="service-grid">


            <div class="service-card">

                <div class="service-icon">
                    💳
                </div>

                <h3>
                    Smart Account
                </h3>

                <p>
                    Create your secure bank account and manage your
                    balance from your personal dashboard.
                </p>

            </div>


            <div class="service-card">

                <div class="service-icon">
                    ↔
                </div>

                <h3>
                    Fund Transfer
                </h3>

                <p>
                    Transfer money quickly using an account number
                    or UPI ID.
                </p>

            </div>


            <div class="service-card">

                <div class="service-icon">
                    📊
                </div>

                <h3>
                    Mini Statement
                </h3>

                <p>
                    View your latest transactions and receive your
                    mini statement through email.
                </p>

            </div>


            <div class="service-card">

                <div class="service-icon">
                    🏦
                </div>

                <h3>
                    Easy Loans
                </h3>

                <p>
                    Apply for a loan online and track your
                    application status anytime.
                </p>

            </div>


        </div>

    </div>

</section>


<!-- =========================
     TRUST
========================= -->

<section class="trust" id="about">

    <div class="container">

        <div class="trust-box">


            <div>

                <div class="section-label">
                    WHY CHOOSE SMARTBANK
                </div>

                <h2>
                    Your Trust<br>
                    Our Commitment
                </h2>

                <p>
                    We bring you a secure, simple and seamless banking
                    experience — designed for your comfort and convenience.
                </p>

                <a href="${pageContext.request.contextPath}/register"
                   class="primary-btn">
                    Open Your Account →
                </a>

            </div>


            <div class="trust-grid">


                <div class="trust-item">

                    <div class="trust-icon">
                        🛡
                    </div>

                    <div>
                        <strong>High Security</strong>

                        <small>
                            OTP verification & advanced protection.
                        </small>
                    </div>

                </div>


                <div class="trust-item">

                    <div class="trust-icon">
                        ⚡
                    </div>

                    <div>
                        <strong>Instant Access</strong>

                        <small>
                            Bank anytime, anywhere on any device.
                        </small>
                    </div>

                </div>


                <div class="trust-item">

                    <div class="trust-icon">
                        👤
                    </div>

                    <div>
                        <strong>Customer Support</strong>

                        <small>
                            We're here when you need us.
                        </small>
                    </div>

                </div>


                <div class="trust-item">

                    <div class="trust-icon">
                        ✓
                    </div>

                    <div>
                        <strong>Easy & Convenient</strong>

                        <small>
                            Simple steps, less paperwork, more freedom.
                        </small>
                    </div>

                </div>


            </div>

        </div>

    </div>

</section>


<!-- =========================
     CTA
========================= -->

<section class="cta">

    <div class="container">

        <div class="cta-box">

            <div>

                <h2>
                    🚀 Ready to start banking smarter?
                </h2>

                <p>
                    Create your Smart Bank account and experience simple digital banking.
                </p>

            </div>


            <a href="${pageContext.request.contextPath}/register"
               class="cta-btn">
                Create Account →
            </a>

        </div>

    </div>

</section>


<!-- =========================
     BANKING SERVICES
========================= -->

<section class="banking-services">

    <div class="container">

        <h2>
            Our Banking Services
        </h2>

        <p>
            Everything you need, all in one place.
        </p>


        <div class="banking-grid">


            <div class="banking-item">

                <div class="banking-icon">
                    💳
                </div>

                <h4>
                    Account<br>
                    Management
                </h4>

            </div>


            <div class="banking-item">

                <div class="banking-icon">
                    ↔
                </div>

                <h4>
                    Fund<br>
                    Transfer
                </h4>

            </div>


            <div class="banking-item">

                <div class="banking-icon">
                    🏦
                </div>

                <h4>
                    Loan<br>
                    Services
                </h4>

            </div>


            <div class="banking-item">

                <div class="banking-icon">
                    📄
                </div>

                <h4>
                    Transaction<br>
                    History
                </h4>

            </div>


        </div>

    </div>

</section>


<!-- =========================
     FOOTER
========================= -->

<footer class="footer">

    <div class="footer-container">


        <div class="footer-brand">

            <div class="footer-brand-icon">
                🏦
            </div>

            <div>

                <strong>
                    SmartBank
                </strong>

                <small>
                    Digital Banking
                </small>

            </div>

        </div>


        <div class="footer-links">

            <a href="${pageContext.request.contextPath}/">
                Home
            </a>

            <a href="#services">
                Features
            </a>

            <a href="#about">
                About
            </a>

            <a href="${pageContext.request.contextPath}/login">
                Login
            </a>

            <a href="${pageContext.request.contextPath}/register">
                Open Account
            </a>

        </div>


        <div class="footer-copy">
            © 2026 Smart Bank Management System · Secure Digital Banking
        </div>

    </div>

</footer>


</body>
</html>