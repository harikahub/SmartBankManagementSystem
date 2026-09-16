<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Verify Login | SmartBank</title>

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
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #e9eef5;
        }

        .logo {
            text-decoration: none;
            color: #0b3d91;
            font-size: 24px;
            font-weight: bold;
        }

        .logo span {
            color: #1687f7;
        }

        .nav-links {
            display: flex;
            gap: 20px;
        }

        .nav-links a {
            text-decoration: none;
            color: #475467;
            font-size: 13px;
            font-weight: bold;
        }

        .register-section {
            padding: 55px 7%;
        }

        .register-container {
            max-width: 1050px;
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
            margin-bottom: 17px;
        }

        .register-info h1 {
            font-size: 42px;
            line-height: 1.12;
            margin: 0 0 17px;
            color: #071a35;
        }

        .register-info h1 span {
            color: #1687f7;
        }

        .register-info > p {
            color: #667085;
            line-height: 1.7;
            font-size: 14px;
        }

        .register-benefits {
            margin-top: 25px;
        }

        .benefit {
            display: flex;
            gap: 13px;
            margin-bottom: 17px;
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
            font-size: 14px;
        }

        .benefit p {
            margin: 0;
            color: #7a8696;
            font-size: 12px;
            line-height: 1.5;
        }

        .register-card {
            background: white;
            padding: 34px;
            border-radius: 20px;
            box-shadow: 0 12px 35px rgba(20,40,70,0.08);
            border: 1px solid #e9eef5;
        }

        .register-card-header {
            display: flex;
            align-items: center;
            gap: 13px;
            margin-bottom: 24px;
        }

        .register-icon {
            width: 50px;
            height: 50px;
            border-radius: 14px;
            background: #eaf3ff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
        }

        .register-card-header h2 {
            margin: 0 0 5px;
        }

        .register-card-header p {
            margin: 0;
            color: #7a8696;
            font-size: 12px;
        }

        .error {
            background: #fff0ef;
            color: #b42318;
            padding: 12px;
            border-radius: 9px;
            margin-bottom: 18px;
            text-align: center;
            font-size: 13px;
            border: 1px solid #ffd5d1;
        }

        .email-box {
            background: #f7f9fc;
            border: 1px solid #e7ecf2;
            padding: 12px;
            border-radius: 9px;
            margin-bottom: 20px;
            font-size: 13px;
            color: #475467;
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            font-size: 13px;
            font-weight: bold;
            margin-bottom: 7px;
            color: #344054;
        }

        .form-control {
            width: 100%;
            padding: 14px;
            border: 1px solid #d7dee8;
            border-radius: 9px;
            font-size: 20px;
            letter-spacing: 7px;
            text-align: center;
        }

        .form-control:focus {
            outline: none;
            border-color: #1687f7;
            box-shadow: 0 0 0 3px rgba(22,135,247,0.1);
        }

        .register-submit {
            width: 100%;
            padding: 13px;
            background: linear-gradient(135deg, #0b3d91, #1687f7);
            color: white;
            border: none;
            border-radius: 9px;
            font-weight: bold;
            cursor: pointer;
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
            padding: 22px;
            font-size: 12px;
        }

        @media (max-width: 850px) {

            .register-container {
                grid-template-columns: 1fr;
            }

            .register-info {
                text-align: center;
            }

        }

        @media (max-width: 600px) {

            .register-section {
                padding: 30px 15px;
            }

            .register-card {
                padding: 25px 20px;
            }

            .register-info h1 {
                font-size: 34px;
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

        <a href="${pageContext.request.contextPath}/login">
            Login
        </a>

    </div>

</nav>


<section class="register-section">

    <div class="register-container">


        <div class="register-info">

            <div class="register-badge">
                🔐 Secure Login
            </div>

            <h1>
                Verify your
                <span>login.</span>
            </h1>

            <p>
                We have sent a one-time password (OTP)
                to your registered email address.
            </p>


            <div class="register-benefits">

                <div class="benefit">

                    <div class="benefit-icon">
                        🔐
                    </div>

                    <div>

                        <h3>Secure Verification</h3>

                        <p>
                            Your OTP helps verify that it is really
                            you trying to access your account.
                        </p>

                    </div>

                </div>


                <div class="benefit">

                    <div class="benefit-icon">
                        ⏱️
                    </div>

                    <div>

                        <h3>OTP Validity</h3>

                        <p>
                            Your OTP is valid for 5 minutes.
                        </p>

                    </div>

                </div>


                <div class="benefit">

                    <div class="benefit-icon">
                        ✉️
                    </div>

                    <div>

                        <h3>Check Your Email</h3>

                        <p>
                            Check your inbox and spam folder
                            if you cannot find the OTP.
                        </p>

                    </div>

                </div>

            </div>

        </div>


        <div class="register-card">

            <div class="register-card-header">

                <div class="register-icon">
                    ✉️
                </div>

                <div>

                    <h2>Verify Login</h2>

                    <p>
                        Enter the OTP sent to your email
                    </p>

                </div>

            </div>


            <%
                String error =
                    (String) request.getAttribute("error");

                if (error != null) {
            %>

                <div class="error">
                    <%= error %>
                </div>

            <%
                }
            %>


            <div class="email-box">

                <strong>Email:</strong>
                ${email}

            </div>


            <form
                action="${pageContext.request.contextPath}/verify-login-otp"
                method="post">


                <input
                    type="hidden"
                    name="email"
                    value="${email}">


                <div class="form-group">

                    <label for="otp">
                        One-Time Password
                    </label>

                    <input
                        type="text"
                        id="otp"
                        name="otp"
                        class="form-control"
                        placeholder="000000"
                        maxlength="6"
                        pattern="[0-9]{6}"
                        inputmode="numeric"
                        autocomplete="one-time-code"
                        required>

                </div>


                <button
                    type="submit"
                    class="register-submit">

                    Verify & Login →

                </button>

            </form>


            <div class="register-login">

                Didn't receive the OTP?

                <a href="${pageContext.request.contextPath}/login">
                    Try Again
                </a>

            </div>

        </div>

    </div>

</section>


<footer class="footer">

    © 2026 Smart Bank Management System · Secure Digital Banking

</footer>

</body>
</html>