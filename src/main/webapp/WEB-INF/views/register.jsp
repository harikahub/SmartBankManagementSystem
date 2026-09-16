<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Create Account | SmartBank</title>

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

        .navbar {
            height: 70px;
            background: white;
            padding: 0 6%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 1px solid #e9eef5;
        }

        .logo {
            color: #0b3d91;
            text-decoration: none;
            font-size: 24px;
            font-weight: bold;
        }

        .logo span {
            color: #1687f7;
        }

        .nav-links {
            display: flex;
            gap: 20px;
            align-items: center;
        }

        .nav-links a {
            text-decoration: none;
            color: #475467;
            font-size: 13px;
            font-weight: bold;
        }

        .nav-links a:hover {
            color: #1687f7;
        }

        .register-section {
            padding: 50px 7%;
        }

        .register-container {
            max-width: 1150px;
            margin: auto;
            display: grid;
            grid-template-columns: 0.9fr 1.1fr;
            gap: 45px;
            align-items: center;
        }

        .register-info {
            padding: 20px;
        }

        .register-badge {
            display: inline-block;
            background: #eaf3ff;
            color: #0b5dcc;
            padding: 8px 13px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
            margin-bottom: 18px;
        }

        .register-info h1 {
            font-size: 43px;
            line-height: 1.12;
            margin: 0 0 18px;
            color: #071a35;
        }

        .register-info h1 span {
            color: #1687f7;
        }

        .register-info > p {
            color: #667085;
            line-height: 1.7;
            font-size: 15px;
            max-width: 520px;
        }

        .register-benefits {
            margin-top: 28px;
        }

        .benefit {
            display: flex;
            gap: 13px;
            margin-bottom: 18px;
        }

        .benefit-icon {
            width: 43px;
            height: 43px;
            flex-shrink: 0;
            border-radius: 12px;
            background: #eaf3ff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
        }

        .benefit h3 {
            margin: 0 0 5px;
            font-size: 15px;
        }

        .benefit p {
            margin: 0;
            color: #7a8696;
            font-size: 12px;
            line-height: 1.5;
        }

        .register-card {
            background: white;
            padding: 32px;
            border-radius: 20px;
            box-shadow: 0 12px 35px rgba(20,40,70,0.08);
            border: 1px solid #e9eef5;
        }

        .register-card-header {
            display: flex;
            align-items: center;
            gap: 13px;
            margin-bottom: 25px;
        }

        .register-icon {
            width: 48px;
            height: 48px;
            border-radius: 13px;
            background: #eaf3ff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 23px;
        }

        .register-card-header h2 {
            margin: 0 0 4px;
            color: #17243a;
        }

        .register-card-header p {
            margin: 0;
            color: #7a8696;
            font-size: 12px;
        }

        .form-group {
            margin-bottom: 16px;
        }

        .form-group label {
            display: block;
            margin-bottom: 7px;
            font-size: 13px;
            font-weight: bold;
            color: #344054;
        }

        .form-control {
            width: 100%;
            padding: 12px 13px;
            border: 1px solid #d7dee8;
            border-radius: 9px;
            font-family: inherit;
            font-size: 13px;
            transition: 0.2s;
        }

        .form-control:focus {
            outline: none;
            border-color: #1687f7;
            box-shadow: 0 0 0 3px rgba(22,135,247,0.1);
        }

        textarea.form-control {
            resize: vertical;
        }

        .optional {
            color: #98a2b3;
            font-size: 11px;
            font-weight: normal;
        }

        .register-submit {
            width: 100%;
            padding: 13px;
            margin-top: 5px;
            background: linear-gradient(135deg, #0b3d91, #1687f7);
            color: white;
            border: none;
            border-radius: 9px;
            font-weight: bold;
            cursor: pointer;
            font-size: 14px;
        }

        .register-submit:hover {
            box-shadow: 0 8px 18px rgba(11,61,145,0.2);
            transform: translateY(-1px);
        }

        .register-login {
            text-align: center;
            margin-top: 18px;
            padding-top: 17px;
            border-top: 1px solid #edf0f4;
            font-size: 12px;
            color: #667085;
        }

        .register-login a {
            color: #0b3d91;
            font-weight: bold;
            text-decoration: none;
        }

        .footer {
            text-align: center;
            color: #8792a2;
            padding: 25px;
            font-size: 12px;
        }

        @media (max-width: 850px) {

            .register-container {
                grid-template-columns: 1fr;
            }

            .register-info {
                text-align: center;
            }

            .register-info > p {
                margin-left: auto;
                margin-right: auto;
            }

            .benefit {
                text-align: left;
            }

        }

        @media (max-width: 600px) {

            .navbar {
                padding: 0 20px;
            }

            .nav-links a:first-child {
                display: none;
            }

            .register-section {
                padding: 30px 15px;
            }

            .register-info h1 {
                font-size: 34px;
            }

            .register-card {
                padding: 23px 19px;
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

        <a href="${pageContext.request.contextPath}/login">
            Login
        </a>

    </div>

</nav>


<section class="register-section">

    <div class="register-container">


        <div class="register-info">

            <div class="register-badge">
                ✦ Join SmartBank
            </div>

            <h1>
                Start your smarter
                <span>banking journey.</span>
            </h1>

            <p>
                Create your SmartBank account and get access to
                secure digital banking, fund transfers, mini
                statements and loan services.
            </p>


            <div class="register-benefits">

                <div class="benefit">

                    <div class="benefit-icon">🔐</div>

                    <div>

                        <h3>Secure Banking</h3>

                        <p>
                            Your account and personal information stay protected.
                        </p>

                    </div>

                </div>


                <div class="benefit">

                    <div class="benefit-icon">💸</div>

                    <div>

                        <h3>Easy Transfers</h3>

                        <p>
                            Transfer funds easily using your banking details.
                        </p>

                    </div>

                </div>


                <div class="benefit">

                    <div class="benefit-icon">📊</div>

                    <div>

                        <h3>Track Everything</h3>

                        <p>
                            View your balance and transaction history anytime.
                        </p>

                    </div>

                </div>

            </div>

        </div>


        <div class="register-card">

            <div class="register-card-header">

                <div class="register-icon">
                    🏦
                </div>

                <div>

                    <h2>Create Account</h2>

                    <p>
                        Enter your details to get started
                    </p>

                </div>

            </div>


            <form
                action="${pageContext.request.contextPath}/register"
                method="post">


                <div class="form-group">

                    <label for="fullName">
                        Full Name
                    </label>

                    <input
                        type="text"
                        id="fullName"
                        name="fullName"
                        class="form-control"
                        placeholder="Enter your full name"
                        required>

                </div>


                <div class="form-group">

                    <label for="email">
                        Email Address
                    </label>

                    <input
                        type="email"
                        id="email"
                        name="email"
                        class="form-control"
                        placeholder="Enter your email address"
                        required>

                </div>


                <div class="form-group">

                    <label for="mobile">
                        Mobile Number
                    </label>

                    <input
                        type="tel"
                        id="mobile"
                        name="mobile"
                        class="form-control"
                        placeholder="Enter your mobile number"
                        required>

                </div>


                <div class="form-group">

                    <label for="password">
                        Password
                    </label>

                    <input
                        type="password"
                        id="password"
                        name="password"
                        class="form-control"
                        placeholder="Create a password"
                        required>

                </div>


                <div class="form-group">

                    <label for="address">
                        Address
                    </label>

                    <textarea
                        id="address"
                        name="address"
                        class="form-control"
                        placeholder="Enter your address"
                        rows="3"
                        required></textarea>

                </div>


                <div class="form-group">

                    <label for="aadharNumber">
                        Aadhaar Number
                        <span class="optional">(Optional)</span>
                    </label>

                    <input
                        type="text"
                        id="aadharNumber"
                        name="aadharNumber"
                        class="form-control"
                        placeholder="Enter your Aadhaar number">

                </div>


                <div class="form-group">

                    <label for="panNumber">
                        PAN Number
                        <span class="optional">(Optional)</span>
                    </label>

                    <input
                        type="text"
                        id="panNumber"
                        name="panNumber"
                        class="form-control"
                        placeholder="Enter your PAN number">

                </div>


                <button
                    type="submit"
                    class="register-submit">

                    Create SmartBank Account →

                </button>

            </form>


            <div class="register-login">

                Already have an account?

                <a href="${pageContext.request.contextPath}/login">
                    Login
                </a>

            </div>

        </div>

    </div>

</section>


<footer class="footer">

    <p>
        © 2026 Smart Bank Management System
        · Secure Digital Banking
    </p>

</footer>

</body>
</html>