<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Login | SmartBank</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: Arial, sans-serif;

            background:
                radial-gradient(circle at 15% 20%, rgba(22,135,247,0.25), transparent 30%),
                radial-gradient(circle at 85% 80%, rgba(0,214,201,0.18), transparent 30%),
                linear-gradient(135deg, #06152d, #0b3d91 55%, #087f8c);

            display: flex;
            align-items: center;
            justify-content: center;

            padding: 30px;

            color: white;

            overflow: hidden;
        }

        /* Decorative background shapes */

        .shape {
            position: fixed;
            border-radius: 50%;
            filter: blur(2px);
            pointer-events: none;
        }

        .shape.one {
            width: 220px;
            height: 220px;
            background: rgba(22,135,247,0.18);
            top: -80px;
            left: -70px;
        }

        .shape.two {
            width: 280px;
            height: 280px;
            background: rgba(0,214,201,0.13);
            bottom: -120px;
            right: -90px;
        }

        .wrapper {
            width: 100%;
            max-width: 950px;

            display: grid;
            grid-template-columns: 1fr 430px;
            gap: 50px;

            align-items: center;

            position: relative;
            z-index: 2;
        }

        /* LEFT SIDE */

        .intro {
            padding: 20px;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 14px;
            margin-bottom: 25px;
        }

        .brand-icon {
            width: 58px;
            height: 58px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 18px;

            background: rgba(255,255,255,0.12);

            border: 1px solid rgba(255,255,255,0.22);

            box-shadow:
                0 12px 30px rgba(0,0,0,0.25),
                inset 0 1px rgba(255,255,255,0.18);

            font-size: 27px;

            transform: rotate(-4deg);
        }

        .brand-text h1 {
            margin: 0;
            font-size: 27px;
            letter-spacing: 0.3px;
        }

        .brand-text p {
            margin: 5px 0 0;
            font-size: 12px;
            color: rgba(255,255,255,0.65);
        }

        .intro h2 {
            margin: 0 0 16px;

            font-size: 46px;
            line-height: 1.08;

            letter-spacing: -1px;
        }

        .intro h2 span {
            color: #5de7dc;
        }

        .intro-description {
            max-width: 470px;

            color: rgba(255,255,255,0.72);

            font-size: 15px;
            line-height: 1.7;

            margin-bottom: 28px;
        }

        .highlights {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
        }

        .highlight {
            padding: 10px 14px;

            border-radius: 12px;

            background: rgba(255,255,255,0.08);

            border: 1px solid rgba(255,255,255,0.12);

            font-size: 12px;

            color: rgba(255,255,255,0.82);

            backdrop-filter: blur(10px);
        }

        /* LOGIN CARD */

        .box {

            background:
                linear-gradient(
                    145deg,
                    rgba(255,255,255,0.98),
                    rgba(244,249,255,0.96)
                );

            color: #17243a;

            padding: 34px;

            border-radius: 26px;

            border: 1px solid rgba(255,255,255,0.8);

            box-shadow:
                0 30px 70px rgba(0,0,0,0.30),
                0 10px 25px rgba(0,0,0,0.12);

            position: relative;

            transform: perspective(1000px) rotateY(-2deg);

            transition: 0.3s ease;
        }

        .box:hover {
            transform:
                perspective(1000px)
                rotateY(0deg)
                translateY(-3px);

            box-shadow:
                0 35px 80px rgba(0,0,0,0.34);
        }

        .box::before {
            content: "";

            position: absolute;

            width: 100px;
            height: 100px;

            top: -35px;
            right: -35px;

            background: rgba(0,214,201,0.15);

            border-radius: 50%;

            filter: blur(2px);

            pointer-events: none;
        }

        .box-header {
            text-align: left;
            margin-bottom: 25px;
        }

        .secure-badge {
            display: inline-flex;

            align-items: center;

            padding: 7px 11px;

            border-radius: 20px;

            background: #e7f8f7;

            color: #087f8c;

            font-size: 11px;

            font-weight: bold;

            margin-bottom: 14px;
        }

        .box-header h2 {
            margin: 0 0 7px;

            color: #17243a;

            font-size: 27px;
        }

        .box-header p {
            margin: 0;

            color: #7a8696;

            font-size: 13px;

            line-height: 1.5;
        }

        .error {
            background: #fff0ef;

            color: #b42318;

            padding: 12px;

            border-radius: 10px;

            margin-bottom: 18px;

            text-align: center;

            font-size: 13px;

            border: 1px solid #ffd5d1;
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            display: block;

            color: #344054;

            font-size: 13px;

            font-weight: bold;

            margin-bottom: 7px;
        }

        .input-wrapper {
            position: relative;
        }

        .input-icon {
            position: absolute;

            left: 13px;
            top: 50%;

            transform: translateY(-50%);

            font-size: 15px;

            opacity: 0.65;

            pointer-events: none;
        }

        input {
            width: 100%;

            padding: 14px 14px 14px 40px;

            border: 1px solid #d7dee8;

            border-radius: 11px;

            font-size: 14px;

            background: #fbfdff;

            color: #17243a;

            transition: 0.2s;
        }

        input:focus {
            outline: none;

            border-color: #1687f7;

            background: white;

            box-shadow:
                0 0 0 4px rgba(22,135,247,0.10);
        }

        input::placeholder {
            color: #a0a9b5;
        }

        button {
            width: 100%;

            padding: 14px;

            margin-top: 3px;

            background:
                linear-gradient(
                    135deg,
                    #0b3d91,
                    #1687f7 60%,
                    #10a9a0
                );

            color: white;

            border: none;

            border-radius: 11px;

            font-size: 15px;

            font-weight: bold;

            cursor: pointer;

            transition: 0.25s;

            box-shadow:
                0 10px 22px rgba(11,61,145,0.22);
        }

        button:hover {
            transform: translateY(-2px);

            box-shadow:
                0 14px 28px rgba(11,61,145,0.30);
        }

        button:active {
            transform: translateY(0);
        }

        .register {
            text-align: center;

            margin-top: 21px;

            padding-top: 18px;

            border-top: 1px solid #edf0f4;

            color: #667085;

            font-size: 13px;
        }

        .register a {
            color: #0b3d91;

            font-weight: bold;

            text-decoration: none;

            margin-left: 3px;
        }

        .register a:hover {
            color: #087f8c;
        }

        .admin-link {
            display: block;

            text-align: center;

            margin-top: 17px;

            color: #667085;

            font-size: 12px;

            text-decoration: none;

            transition: 0.2s;
        }

        .admin-link:hover {
            color: #0b3d91;
        }

        .security-note {
            display: flex;

            justify-content: center;

            align-items: center;

            gap: 6px;

            margin-top: 19px;

            font-size: 11px;

            color: #98a2b3;
        }

        /* MOBILE */

        @media (max-width: 800px) {

            body {
                overflow: auto;
            }

            .wrapper {
                grid-template-columns: 1fr;

                max-width: 500px;

                gap: 25px;
            }

            .intro {
                text-align: center;
                padding: 5px;
            }

            .brand {
                justify-content: center;
            }

            .intro h2 {
                font-size: 36px;
            }

            .intro-description {
                margin-left: auto;
                margin-right: auto;
            }

            .highlights {
                justify-content: center;
            }

            .box {
                transform: none;
            }

            .box:hover {
                transform: translateY(-2px);
            }
        }

        @media (max-width: 500px) {

            body {
                padding: 18px;
            }

            .intro h2 {
                font-size: 31px;
            }

            .intro-description {
                font-size: 14px;
            }

            .box {
                padding: 27px 21px;
                border-radius: 22px;
            }

            .box-header h2 {
                font-size: 24px;
            }
        }

    </style>

</head>

<body>

    <div class="shape one"></div>
    <div class="shape two"></div>

    <div class="wrapper">

        <!-- LEFT SIDE -->

        <div class="intro">

            <div class="brand">

                <div class="brand-icon">
                    🏦
                </div>

                <div class="brand-text">

                    <h1>SmartBank</h1>

                    <p>Secure Digital Banking</p>

                </div>

            </div>

            <h2>
                Your money.<br>
                Your control.<br>
                <span>Your SmartBank.</span>
            </h2>

            <div class="intro-description">

                Manage your account, transfer funds, track loans
                and stay connected with your banking activity —
                all from one secure place.

            </div>

            <div class="highlights">

                <div class="highlight">
                    🔐 Secure Login
                </div>

                <div class="highlight">
                    ⚡ Fast Banking
                </div>

                <div class="highlight">
                    🛡️ Protected Account
                </div>

            </div>

        </div>


        <!-- LOGIN CARD -->

        <div class="box">

            <div class="box-header">

                <div class="secure-badge">
                    🔒 Secure Customer Login
                </div>

                <h2>
                    Welcome Back 👋
                </h2>

                <p>
                    Login to access your SmartBank account
                </p>

            </div>


            <%

                String error =
                    (String) request.getAttribute("error");

                if (error != null) {

            %>

                <div class="error">

                    ⚠ <%= error %>

                </div>

            <%

                }

            %>


            <form
                action="${pageContext.request.contextPath}/login"
                method="post">

                <div class="form-group">

                    <label>
                        Email Address
                    </label>

                    <div class="input-wrapper">

                        <span class="input-icon">
                            ✉
                        </span>

                        <input
                            type="email"
                            name="email"
                            placeholder="Enter your email"
                            required>

                    </div>

                </div>


                <div class="form-group">

                    <label>
                        Password
                    </label>

                    <div class="input-wrapper">

                        <span class="input-icon">
                            🔑
                        </span>

                        <input
                            type="password"
                            name="password"
                            placeholder="Enter your password"
                            required>

                    </div>

                </div>


                <button type="submit">

                    Login Securely →

                </button>

            </form>


            <div class="register">

                Don't have an account?

                <a
                    href="${pageContext.request.contextPath}/register">

                    Create Account

                </a>

            </div>


            <a
                class="admin-link"
                href="${pageContext.request.contextPath}/admin/login">

                🔐 Admin Login

            </a>


            <div class="security-note">

                🛡️ Your login information is securely processed

            </div>

        </div>

    </div>

</body>

</html>