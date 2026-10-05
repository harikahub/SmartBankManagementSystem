
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Verify OTP | SmartBank</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Segoe UI", Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;

            background:
                radial-gradient(circle at 15% 20%, rgba(45, 212, 191, 0.20), transparent 30%),
                radial-gradient(circle at 85% 80%, rgba(37, 99, 235, 0.25), transparent 35%),
                linear-gradient(135deg, #071426, #0b1f3a, #062c35);

            color: #ffffff;
            padding: 20px;
        }

        .container {
            width: 100%;
            max-width: 430px;
        }

        .card {
            position: relative;

            padding: 38px 34px;

            border-radius: 26px;

            background: rgba(15, 35, 60, 0.72);

            border: 1px solid rgba(255, 255, 255, 0.12);

            box-shadow:
                0 25px 60px rgba(0, 0, 0, 0.45),
                inset 0 1px 0 rgba(255, 255, 255, 0.08);

            backdrop-filter: blur(18px);
        }

        .icon {
            width: 70px;
            height: 70px;

            margin: 0 auto 20px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 20px;

            background: linear-gradient(
                145deg,
                rgba(45, 212, 191, 0.25),
                rgba(37, 99, 235, 0.25)
            );

            border: 1px solid rgba(45, 212, 191, 0.30);

            font-size: 32px;

            box-shadow:
                0 15px 30px rgba(0, 0, 0, 0.25),
                inset 0 1px 0 rgba(255, 255, 255, 0.12);
        }

        h1 {
            text-align: center;
            font-size: 27px;
            margin-bottom: 10px;
        }

        .subtitle {
            text-align: center;
            color: #a7b7ca;
            font-size: 14px;
            line-height: 1.6;
            margin-bottom: 26px;
        }

        .email-box {
            padding: 13px 15px;
            margin-bottom: 22px;

            border-radius: 13px;

            background: rgba(37, 99, 235, 0.10);

            border: 1px solid rgba(37, 99, 235, 0.22);

            color: #bfdbfe;

            text-align: center;
            font-size: 13px;

            word-break: break-word;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 9px;

            color: #cbd5e1;

            font-size: 13px;
            font-weight: 600;
        }

        input[type="text"] {
            width: 100%;
            height: 54px;

            border: 1px solid rgba(255, 255, 255, 0.13);

            border-radius: 14px;

            background: rgba(255, 255, 255, 0.06);

            color: #ffffff;

            outline: none;

            text-align: center;

            font-size: 24px;
            font-weight: 700;

            letter-spacing: 9px;

            transition: 0.25s ease;
        }

        input[type="text"]:focus {
            border-color: rgba(45, 212, 191, 0.65);

            box-shadow:
                0 0 0 3px rgba(45, 212, 191, 0.10);
        }

        input::placeholder {
            color: #64748b;
            letter-spacing: 7px;
        }

        .verify-btn {
            width: 100%;
            height: 50px;

            border: none;
            border-radius: 14px;

            background: linear-gradient(
                135deg,
                #2563eb,
                #0d9488
            );

            color: #ffffff;

            font-size: 15px;
            font-weight: 700;

            cursor: pointer;

            box-shadow:
                0 12px 25px rgba(37, 99, 235, 0.25);

            transition: 0.25s ease;
        }

        .verify-btn:hover {
            transform: translateY(-2px);

            box-shadow:
                0 16px 30px rgba(37, 99, 235, 0.35);
        }

        .error-message {
            margin-bottom: 18px;

            padding: 12px 14px;

            border-radius: 12px;

            background: rgba(239, 68, 68, 0.12);

            border: 1px solid rgba(239, 68, 68, 0.25);

            color: #fecaca;

            font-size: 13px;

            text-align: center;
        }

        .success-message {
            margin-bottom: 18px;

            padding: 12px 14px;

            border-radius: 12px;

            background: rgba(45, 212, 191, 0.15);

            border: 1px solid rgba(45, 212, 191, 0.30);

            color: #ccfbf1;

            font-size: 13px;

            text-align: center;
        }

        .resend-btn {
            width: 100%;
            height: 48px;

            margin-top: 12px;

            border: 1px solid rgba(45, 212, 191, 0.35);

            border-radius: 14px;

            background: rgba(45, 212, 191, 0.08);

            color: #99f6e4;

            font-size: 14px;
            font-weight: 700;

            cursor: pointer;

            transition: 0.25s ease;
        }

        .resend-btn:hover {
            background: rgba(45, 212, 191, 0.16);

            transform: translateY(-1px);
        }

        .info-box {
            margin-top: 22px;

            padding: 14px;

            border-radius: 14px;

            background: rgba(255, 255, 255, 0.04);

            border: 1px solid rgba(255, 255, 255, 0.08);

            color: #94a3b8;

            font-size: 12px;

            line-height: 1.6;

            text-align: center;
        }

        .back-link {
            display: block;

            margin-top: 20px;

            text-align: center;

            color: #5eead4;

            text-decoration: none;

            font-size: 13px;
            font-weight: 600;

            transition: 0.2s ease;
        }

        .back-link:hover {
            color: #99f6e4;
        }

        .footer {
            text-align: center;

            margin-top: 20px;

            color: #64748b;

            font-size: 11px;
        }

        @media (max-width: 480px) {

            .card {
                padding: 30px 22px;
            }

            h1 {
                font-size: 24px;
            }

            input[type="text"] {
                font-size: 21px;
            }
        }

    </style>

</head>

<body>

<div class="container">

    <div class="card">

        <div class="icon">
            🔐
        </div>

        <h1>Verify Your OTP</h1>

        <p class="subtitle">
            Enter the 6-digit OTP sent to your registered email address.
        </p>


        <!-- EMAIL -->

        <div class="email-box">
            📧 ${email}
        </div>


        <!-- ERROR MESSAGE -->

        <c:if test="${not empty error}">
            <div class="error-message">
                ❌ ${error}
            </div>
        </c:if>


        <!-- SUCCESS MESSAGE -->

        <c:if test="${not empty message}">
            <div class="success-message">
                ✅ ${message}
            </div>
        </c:if>


        <!-- VERIFY OTP FORM -->

        <form action="${pageContext.request.contextPath}/verify"
              method="post">

            <input type="hidden"
                   name="email"
                   value="${email}">

            <div class="form-group">

                <label for="otp">
                    Enter OTP
                </label>

                <input type="text"
                       id="otp"
                       name="otp"
                       maxlength="6"
                       minlength="6"
                       pattern="[0-9]{6}"
                       inputmode="numeric"
                       autocomplete="one-time-code"
                       placeholder="••••••"
                       required>

            </div>

            <button type="submit"
                    class="verify-btn">
                Verify OTP
            </button>

        </form>


        <!-- RESEND OTP FORM -->

        <form action="${pageContext.request.contextPath}/resend-registration-otp"
              method="post">

            <input type="hidden"
                   name="email"
                   value="${email}">

            <button type="submit"
                    class="resend-btn">
                🔄 Resend OTP
            </button>

        </form>


        <!-- INFO -->

        <div class="info-box">
            🔒 Your OTP is valid for 5 minutes.<br>
            Please check your Inbox and Spam folder.
        </div>


        <!-- BACK -->

        <a href="${pageContext.request.contextPath}/login"
           class="back-link">
            ← Back to Login
        </a>

        <div class="footer">
            © 2026 SmartBank Management System
        </div>

    </div>

</div>


<script>

    const otpInput = document.getElementById("otp");

    otpInput.addEventListener("input", function () {

        this.value = this.value
            .replace(/[^0-9]/g, '')
            .slice(0, 6);

    });

</script>

</body>
</html>

