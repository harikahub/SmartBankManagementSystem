<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Admin Login | SmartBank</title>

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
            padding: 25px;
        }

        .login-wrapper {
            width: 100%;
            max-width: 430px;
        }

        .brand {
            text-align: center;
            color: white;
            margin-bottom: 22px;
        }

        .brand-icon {
            width: 58px;
            height: 58px;
            background: rgba(255,255,255,0.13);
            border: 1px solid rgba(255,255,255,0.2);
            border-radius: 17px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
            margin: 0 auto 12px;
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
            padding: 34px;
            border-radius: 20px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.2);
        }

        .box-header {
            text-align: center;
            margin-bottom: 25px;
        }

        .box-header h2 {
            margin: 0 0 7px;
            color: #17243a;
        }

        .box-header p {
            margin: 0;
            color: #7a8696;
            font-size: 13px;
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

        label {
            display: block;
            margin-bottom: 7px;
            font-weight: bold;
            color: #344054;
            font-size: 14px;
        }

        .input-group {
            margin-bottom: 18px;
        }

        input {
            width: 100%;
            padding: 13px 14px;
            border: 1px solid #d7dee8;
            border-radius: 9px;
            font-size: 14px;
            transition: 0.2s;
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
            cursor: pointer;
            font-size: 15px;
            font-weight: bold;
            transition: 0.25s;
        }

        button:hover {
            transform: translateY(-1px);
            box-shadow: 0 8px 18px rgba(11,61,145,0.2);
        }

        .back {
            text-align: center;
            margin-top: 20px;
            padding-top: 18px;
            border-top: 1px solid #edf0f4;
        }

        .back a {
            color: #0b3d91;
            text-decoration: none;
            font-size: 13px;
            font-weight: bold;
        }

        .back a:hover {
            color: #1687f7;
        }

        @media (max-width: 500px) {

            body {
                padding: 18px;
            }

            .box {
                padding: 28px 22px;
            }

        }

    </style>

</head>

<body>

<div class="login-wrapper">

    <div class="brand">

        <div class="brand-icon">
            🛡️
        </div>

        <h1>SmartBank</h1>

        <p>Secure Administration Portal</p>

    </div>


    <div class="box">

        <div class="box-header">

            <h2>👨‍💼 Admin Login</h2>

            <p>
                Sign in to manage SmartBank operations
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
            action="${pageContext.request.contextPath}/admin/login"
            method="post">

            <div class="input-group">

                <label>Username</label>

                <input
                    type="text"
                    name="username"
                    placeholder="Enter admin username"
                    required>

            </div>


            <div class="input-group">

                <label>Password</label>

                <input
                    type="password"
                    name="password"
                    placeholder="Enter admin password"
                    required>

            </div>


            <button type="submit">
                Sign In →
            </button>

        </form>


        <div class="back">

            <a href="${pageContext.request.contextPath}/login">

                ← Customer Login

            </a>

        </div>

    </div>

</div>

</body>

</html>