<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Verify Login | SmartBank</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {

            margin: 0;

            min-height: 100vh;

            font-family: Arial, sans-serif;

            background:
                radial-gradient(
                    circle at 12% 18%,
                    rgba(22,135,247,0.25),
                    transparent 30%
                ),
                radial-gradient(
                    circle at 88% 82%,
                    rgba(0,214,201,0.18),
                    transparent 30%
                ),
                linear-gradient(
                    135deg,
                    #06152d,
                    #0b3d91 55%,
                    #087f8c
                );

            display: flex;

            align-items: center;

            justify-content: center;

            padding: 30px;

            color: white;

            overflow: hidden;
        }


        /* BACKGROUND SHAPES */

        .shape {

            position: fixed;

            border-radius: 50%;

            pointer-events: none;

        }

        .shape.one {

            width: 240px;

            height: 240px;

            background:
                rgba(22,135,247,0.16);

            top: -90px;

            left: -80px;

            filter: blur(2px);
        }

        .shape.two {

            width: 300px;

            height: 300px;

            background:
                rgba(0,214,201,0.13);

            bottom: -130px;

            right: -100px;

            filter: blur(2px);
        }


        /* MAIN */

        .wrapper {

            width: 100%;

            max-width: 1050px;

            display: grid;

            grid-template-columns:
                1fr 430px;

            gap: 55px;

            align-items: center;

            position: relative;

            z-index: 2;
        }


        /* LEFT INFORMATION */

        .info {

            padding: 20px;
        }


        .brand {

            display: flex;

            align-items: center;

            gap: 14px;

            margin-bottom: 27px;
        }

        .brand-icon {

            width: 58px;

            height: 58px;

            display: flex;

            align-items: center;

            justify-content: center;

            border-radius: 18px;

            background:
                rgba(255,255,255,0.12);

            border:
                1px solid rgba(255,255,255,0.22);

            box-shadow:
                0 12px 30px rgba(0,0,0,0.25),
                inset 0 1px
                rgba(255,255,255,0.18);

            font-size: 27px;

            transform: rotate(-4deg);
        }

        .brand-text h1 {

            margin: 0;

            font-size: 27px;
        }

        .brand-text p {

            margin: 5px 0 0;

            font-size: 12px;

            color:
                rgba(255,255,255,0.65);
        }


        .badge {

            display: inline-block;

            padding: 8px 13px;

            border-radius: 20px;

            background:
                rgba(255,255,255,0.10);

            border:
                1px solid rgba(255,255,255,0.16);

            color: #7deee5;

            font-size: 11px;

            font-weight: bold;

            margin-bottom: 17px;

            backdrop-filter: blur(10px);
        }


        .info h2 {

            margin: 0 0 17px;

            font-size: 45px;

            line-height: 1.08;

            letter-spacing: -1px;
        }

        .info h2 span {

            color: #5de7dc;
        }


        .description {

            max-width: 480px;

            color:
                rgba(255,255,255,0.72);

            font-size: 14px;

            line-height: 1.7;

            margin-bottom: 28px;
        }


        /* BENEFITS */

        .benefits {

            display: flex;

            flex-direction: column;

            gap: 13px;
        }

        .benefit {

            display: flex;

            align-items: center;

            gap: 13px;

            max-width: 450px;

            padding: 12px 14px;

            border-radius: 14px;

            background:
                rgba(255,255,255,0.07);

            border:
                1px solid rgba(255,255,255,0.10);

            backdrop-filter: blur(10px);
        }

        .benefit-icon {

            width: 40px;

            height: 40px;

            flex-shrink: 0;

            display: flex;

            align-items: center;

            justify-content: center;

            border-radius: 12px;

            background:
                rgba(255,255,255,0.10);

            font-size: 18px;
        }

        .benefit h3 {

            margin: 0 0 4px;

            font-size: 13px;
        }

        .benefit p {

            margin: 0;

            font-size: 11px;

            line-height: 1.5;

            color:
                rgba(255,255,255,0.60);
        }


        /* OTP CARD */

        .card {

            background:
                linear-gradient(
                    145deg,
                    rgba(255,255,255,0.98),
                    rgba(244,249,255,0.96)
                );

            color: #17243a;

            padding: 34px;

            border-radius: 26px;

            border:
                1px solid rgba(255,255,255,0.8);

            box-shadow:
                0 30px 70px rgba(0,0,0,0.30),
                0 10px 25px rgba(0,0,0,0.12);

            position: relative;

            transform:
                perspective(1000px)
                rotateY(-2deg);

            transition: 0.3s ease;

            overflow: hidden;
        }

        .card:hover {

            transform:
                perspective(1000px)
                rotateY(0deg)
                translateY(-3px);

            box-shadow:
                0 35px 80px
                rgba(0,0,0,0.34);
        }


        .card::before {

            content: "";

            position: absolute;

            width: 120px;

            height: 120px;

            top: -55px;

            right: -50px;

            background:
                rgba(0,214,201,0.14);

            border-radius: 50%;

            pointer-events: none;
        }


        .card-header {

            display: flex;

            align-items: center;

            gap: 13px;

            margin-bottom: 24px;

            position: relative;

            z-index: 1;
        }


        .otp-icon {

            width: 52px;

            height: 52px;

            border-radius: 15px;

            display: flex;

            align-items: center;

            justify-content: center;

            background:
                linear-gradient(
                    145deg,
                    #eaf7ff,
                    #e5f8f6
                );

            font-size: 24px;

            box-shadow:
                inset 0 1px
                rgba(255,255,255,0.8);
        }


        .card-header h3 {

            margin: 0 0 5px;

            font-size: 24px;

            color: #17243a;
        }

        .card-header p {

            margin: 0;

            color: #7a8696;

            font-size: 12px;
        }


        /* ERROR */

        .error {

            background: #fff0ef;

            color: #b42318;

            padding: 12px;

            border-radius: 10px;

            margin-bottom: 18px;

            text-align: center;

            font-size: 13px;

            border:
                1px solid #ffd5d1;
        }


        /* EMAIL */

        .email-box {

            background:
                linear-gradient(
                    135deg,
                    #f5faff,
                    #f2fbfa
                );

            border:
                1px solid #e1edf4;

            padding: 13px;

            border-radius: 11px;

            margin-bottom: 21px;

            font-size: 13px;

            color: #475467;

            word-break: break-word;
        }

        .email-label {

            color: #7a8696;

            font-size: 11px;

            display: block;

            margin-bottom: 4px;
        }


        /* FORM */

        .form-group {

            margin-bottom: 19px;
        }

        label {

            display: block;

            color: #344054;

            font-size: 13px;

            font-weight: bold;

            margin-bottom: 8px;
        }


        .otp-input-wrapper {

            position: relative;
        }

        .otp-input-icon {

            position: absolute;

            left: 14px;

            top: 50%;

            transform:
                translateY(-50%);

            font-size: 16px;

            opacity: 0.55;

            pointer-events: none;
        }


        .form-control {

            width: 100%;

            padding:
                15px
                14px
                15px
                45px;

            border:
                1px solid #d7dee8;

            border-radius: 11px;

            font-size: 23px;

            letter-spacing: 9px;

            text-align: center;

            background: #fbfdff;

            color: #17243a;

            transition: 0.2s;
        }

        .form-control:focus {

            outline: none;

            border-color: #1687f7;

            background: white;

            box-shadow:
                0 0 0 4px
                rgba(22,135,247,0.10);
        }

        .form-control::placeholder {

            color: #b4bdc9;

            letter-spacing: 5px;
        }


        /* BUTTON */

        .submit-btn {

            width: 100%;

            padding: 14px;

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
                0 10px 22px
                rgba(11,61,145,0.22);
        }

        .submit-btn:hover {

            transform: translateY(-2px);

            box-shadow:
                0 14px 28px
                rgba(11,61,145,0.30);
        }

        .submit-btn:active {

            transform: translateY(0);
        }


        /* TRY AGAIN */

        .try-again {

            text-align: center;

            margin-top: 20px;

            padding-top: 18px;

            border-top:
                1px solid #edf0f4;

            font-size: 12px;

            color: #667085;
        }

        .try-again a {

            color: #0b3d91;

            font-weight: bold;

            text-decoration: none;

            margin-left: 3px;
        }

        .try-again a:hover {

            color: #087f8c;
        }


        .security-note {

            display: flex;

            justify-content: center;

            align-items: center;

            gap: 6px;

            margin-top: 18px;

            font-size: 11px;

            color: #98a2b3;
        }


        /* RESPONSIVE */

        @media (max-width: 850px) {

            body {

                overflow: auto;
            }

            .wrapper {

                grid-template-columns: 1fr;

                max-width: 500px;

                gap: 28px;
            }

            .info {

                text-align: center;

                padding: 5px;
            }

            .brand {

                justify-content: center;
            }

            .info h2 {

                font-size: 36px;
            }

            .description {

                margin-left: auto;

                margin-right: auto;
            }

            .benefit {

                max-width: 100%;

                text-align: left;
            }

            .card {

                transform: none;
            }

            .card:hover {

                transform:
                    translateY(-2px);
            }
        }


        @media (max-width: 500px) {

            body {

                padding: 18px;
            }

            .info h2 {

                font-size: 31px;
            }

            .description {

                font-size: 13px;
            }

            .card {

                padding: 27px 21px;

                border-radius: 22px;
            }

            .card-header h3 {

                font-size: 22px;
            }

            .form-control {

                font-size: 21px;

                letter-spacing: 7px;
            }
        }

    </style>

</head>


<body>

    <div class="shape one"></div>
    <div class="shape two"></div>


    <div class="wrapper">


        <!-- LEFT SIDE -->

        <div class="info">


            <div class="brand">

                <div class="brand-icon">
                    🏦
                </div>

                <div class="brand-text">

                    <h1>SmartBank</h1>

                    <p>
                        Secure Digital Banking
                    </p>

                </div>

            </div>


            <div class="badge">
                🔐 Secure Login Verification
            </div>


            <h2>

                One more step<br>

                to access your<br>

                <span>SmartBank.</span>

            </h2>


            <div class="description">

                We have sent a one-time password to your
                registered email address. Enter the OTP to
                securely verify your identity and continue
                to your account.

            </div>


            <div class="benefits">


                <div class="benefit">

                    <div class="benefit-icon">
                        🔐
                    </div>

                    <div>

                        <h3>
                            Secure Verification
                        </h3>

                        <p>
                            Your OTP confirms that it is really
                            you trying to access your account.
                        </p>

                    </div>

                </div>


                <div class="benefit">

                    <div class="benefit-icon">
                        ⏱️
                    </div>

                    <div>

                        <h3>
                            OTP Validity
                        </h3>

                        <p>
                            Your OTP remains valid for 5 minutes.
                        </p>

                    </div>

                </div>


                <div class="benefit">

                    <div class="benefit-icon">
                        ✉️
                    </div>

                    <div>

                        <h3>
                            Check Your Email
                        </h3>

                        <p>
                            Check your inbox and spam folder
                            if you cannot find the OTP.
                        </p>

                    </div>

                </div>


            </div>

        </div>


        <!-- OTP CARD -->

        <div class="card">


            <div class="card-header">

                <div class="otp-icon">
                    ✉️
                </div>

                <div>

                    <h3>
                        Verify Login
                    </h3>

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

                    ⚠ <%= error %>

                </div>

            <%

                }

            %>


            <div class="email-box">

                <span class="email-label">
                    OTP sent to
                </span>

                <strong>
                    ${email}
                </strong>

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


                    <div class="otp-input-wrapper">

                        <span class="otp-input-icon">
                            🔢
                        </span>

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

                </div>


                <button
                    type="submit"
                    class="submit-btn">

                    Verify & Login →

                </button>

            </form>


            <div class="try-again">

                Didn't receive the OTP?

                <a
                    href="${pageContext.request.contextPath}/login">

                    Try Again

                </a>

            </div>


            <div class="security-note">

                🛡️ Secure verification · OTP expires in 5 minutes

            </div>


        </div>

    </div>

</body>

</html>