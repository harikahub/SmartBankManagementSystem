<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Verify Email | SmartBank</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #071a35, #0b3d91);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .wrapper {
            width: 100%;
            max-width: 460px;
        }

        .brand {
            text-align: center;
            color: white;
            margin-bottom: 22px;
        }

        .brand-icon {
            width: 58px;
            height: 58px;
            border-radius: 17px;
            background: rgba(255,255,255,0.13);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
            margin: auto auto 12px;
        }

        .brand h1 {
            margin: 0;
            font-size: 25px;
        }

        .brand p {
            margin: 7px 0 0;
            opacity: 0.75;
            font-size: 13px;
        }

        .box {
            background: white;
            padding: 35px;
            border-radius: 20px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.2);
            text-align: center;
        }

        .verify-icon {
            width: 65px;
            height: 65px;
            border-radius: 18px;
            background: #eaf3ff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
            margin: 0 auto 15px;
        }

        h2 {
            color: #17243a;
            margin: 0 0 8px;
        }

        .description {
            color: #7a8696;
            font-size: 13px;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .error {
            background: #fff0ef;
            color: #b42318;
            padding: 11px;
            border-radius: 9px;
            margin-bottom: 16px;
            font-size: 13px;
            border: 1px solid #ffd5d1;
        }

        .email {
            background: #f7f9fc;
            border: 1px solid #e7ecf2;
            padding: 12px;
            border-radius: 9px;
            color: #475467;
            margin-bottom: 19px;
            font-size: 13px;
        }

        input {
            width: 100%;
            padding: 14px;
            border: 1px solid #d7dee8;
            border-radius: 9px;
            font-size: 20px;
            letter-spacing: 7px;
            text-align: center;
            margin-bottom: 17px;
        }

        input:focus {
            outline: none;
            border-color: #1687f7;
            box-shadow: 0 0 0 3px rgba(22,135,247,0.1);
        }

        button {
            width: 100%;
            padding: 13px;
            background: linear-gradient(135deg, #0b3d91, #1687f7);
            color: white;
            border: none;
            border-radius: 9px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            box-shadow: 0 8px 18px rgba(11,61,145,0.2);
        }

        .note {
            color: #8a94a4;
            font-size: 11px;
            margin-top: 16px;
        }

    </style>

</head>

<body>

<div class="wrapper">

    <div class="brand">

        <div class="brand-icon">
            🏦
        </div>

        <h1>SmartBank</h1>

        <p>Secure Account Verification</p>

    </div>


    <div class="box">

        <div class="verify-icon">
            📧
        </div>

        <h2>Verify Your Email</h2>

        <p class="description">
            Enter the 6-digit OTP sent to your email
            to activate your SmartBank account.
        </p>


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


        <div class="email">

            <strong>Email:</strong>
            ${email}

        </div>


        <form
            action="${pageContext.request.contextPath}/verify-otp"
            method="post">


            <input
                type="hidden"
                name="email"
                value="${email}">


            <input
                type="text"
                name="otp"
                placeholder="000000"
                maxlength="6"
                pattern="[0-9]{6}"
                inputmode="numeric"
                autocomplete="one-time-code"
                required>


            <button type="submit">
                Verify OTP →
            </button>

        </form>


        <div class="note">
            ⏱️ Your OTP is valid for 5 minutes.
        </div>

    </div>

</div>

</body>
</html>