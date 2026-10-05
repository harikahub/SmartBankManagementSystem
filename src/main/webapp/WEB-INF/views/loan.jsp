<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Apply Loan | SmartBank</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background:
                radial-gradient(circle at 85% 15%, rgba(69,190,255,.18), transparent 25%),
                linear-gradient(135deg, #f4faff, #eaf6ff);
            color: #092653;
            min-height: 100vh;
        }

        .page {
            min-height: 100vh;
            padding: 45px 20px;
            position: relative;
            overflow: hidden;
        }

        /* Background 3D circles */

        .orb {
            position: absolute;
            border-radius: 50%;
            pointer-events: none;
        }

        .orb.one {
            width: 240px;
            height: 240px;
            background: rgba(54,183,244,.10);
            top: -90px;
            right: -60px;
            box-shadow: inset 10px 10px 25px rgba(255,255,255,.8);
        }

        .orb.two {
            width: 150px;
            height: 150px;
            background: rgba(15,130,225,.07);
            bottom: -55px;
            left: -45px;
            box-shadow: inset 8px 8px 20px rgba(255,255,255,.8);
        }

        /* Main Card */

        .box {
            width: 100%;
            max-width: 650px;
            margin: auto;

            position: relative;
            z-index: 2;

            background: rgba(255,255,255,.88);
            backdrop-filter: blur(18px);

            padding: 38px;

            border-radius: 24px;

            border: 1px solid rgba(255,255,255,.9);

            box-shadow:
                15px 20px 45px rgba(25,91,140,.12),
                inset 2px 2px 8px rgba(255,255,255,.95);
        }

        /* Header */

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .loan-icon {
            width: 68px;
            height: 68px;

            margin: 0 auto 16px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 20px;

            background:
                linear-gradient(145deg, #e8f7ff, #cfeeff);

            color: #087fe2;

            font-size: 31px;

            box-shadow:
                7px 8px 18px rgba(28,112,169,.12),
                inset 3px 3px 8px white;
        }

        .header h1 {
            color: #092f68;
            font-size: 29px;
            margin-bottom: 8px;
        }

        .header p {
            color: #71869f;
            font-size: 13px;
            line-height: 1.6;
        }

        /* Small progress indicator */

        .steps {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 9px;

            margin-bottom: 28px;
        }

        .step {
            width: 28px;
            height: 28px;

            border-radius: 50%;

            display: flex;
            align-items: center;
            justify-content: center;

            background: #087fe2;
            color: white;

            font-size: 11px;
            font-weight: 700;

            box-shadow:
                4px 5px 10px rgba(7,112,194,.16),
                inset 2px 2px 4px rgba(255,255,255,.3);
        }

        .step-line {
            width: 35px;
            height: 2px;
            background: #b9ddf5;
        }

        /* Success */

        .success {
            background: linear-gradient(135deg, #e9fbf1, #ddf7e9);
            color: #16733b;

            padding: 14px;

            border-radius: 11px;

            margin-bottom: 24px;

            text-align: center;

            font-size: 13px;
            font-weight: 600;

            border: 1px solid #ccebd8;

            box-shadow:
                4px 5px 12px rgba(35,130,76,.06),
                inset 2px 2px 5px white;
        }

        /* Form */

        .form-group {
            margin-bottom: 21px;
        }

        label {
            display: block;

            color: #274362;

            font-size: 13px;
            font-weight: 600;

            margin-bottom: 8px;
        }

        input,
        select,
        textarea {
            width: 100%;

            padding: 14px 15px;

            border: 1px solid #d4e3ef;

            border-radius: 11px;

            font-family: inherit;
            font-size: 14px;

            color: #203c5c;

            background: rgba(255,255,255,.9);

            box-shadow:
                inset 2px 2px 5px rgba(27,92,135,.035),
                2px 3px 8px rgba(27,92,135,.035);

            transition: .25s;
        }

        textarea {
            resize: vertical;
            min-height: 105px;
        }

        input:focus,
        select:focus,
        textarea:focus {
            outline: none;

            border-color: #1288e8;

            background: white;

            box-shadow:
                0 0 0 3px rgba(18,136,232,.10),
                4px 6px 15px rgba(25,113,173,.07);
        }

        input::placeholder,
        textarea::placeholder {
            color: #9aabba;
        }

        /* Submit Button */

        button {
            width: 100%;

            padding: 15px;

            margin-top: 4px;

            border: none;
            border-radius: 12px;

            background:
                linear-gradient(135deg, #064da8, #078cf0);

            color: white;

            cursor: pointer;

            font-size: 14px;
            font-weight: 700;

            letter-spacing: .2px;

            box-shadow:
                0 12px 24px rgba(7,105,188,.22),
                inset 2px 2px 5px rgba(255,255,255,.2);

            transition: .25s;
        }

        button:hover {
            transform: translateY(-3px);

            box-shadow:
                0 16px 28px rgba(7,105,188,.28),
                inset 2px 2px 5px rgba(255,255,255,.25);
        }

        button:active {
            transform: translateY(0);
        }

        /* Security note */

        .secure-note {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 7px;

            margin-top: 17px;

            color: #7c91a6;

            font-size: 10px;
        }

        .secure-icon {
            color: #087fe2;
            font-size: 13px;
        }

        /* Back */

        .back {
            text-align: center;
            margin-top: 23px;
        }

        .back a {
            color: #0758b4;

            text-decoration: none;

            font-size: 13px;
            font-weight: 600;
        }

        .back a:hover {
            color: #078cf0;
        }

        /* Bottom branding */

        .brand {
            text-align: center;

            margin-top: 24px;

            color: #8a9bad;

            font-size: 10px;
        }

        .brand strong {
            color: #087fe2;
        }

        /* Mobile */

        @media (max-width: 600px) {

            .page {
                padding: 25px 14px;
            }

            .box {
                padding: 28px 20px;
                border-radius: 20px;
            }

            .header h1 {
                font-size: 25px;
            }

            .loan-icon {
                width: 60px;
                height: 60px;
            }

        }

    </style>

</head>


<body>

<div class="page">

    <div class="orb one"></div>
    <div class="orb two"></div>


    <div class="box">

        <!-- Header -->

        <div class="header">

            <div class="loan-icon">
                🏦
            </div>

            <h1>
                Apply for a Loan
            </h1>

            <p>
                Submit your loan application securely through SmartBank.
            </p>

        </div>


        <!-- Steps -->

        <div class="steps">

            <div class="step">1</div>

            <div class="step-line"></div>

            <div class="step">2</div>

            <div class="step-line"></div>

            <div class="step">3</div>

        </div>


        <%

            String message =
                (String) request.getAttribute("message");

            if (message != null) {

        %>

            <div class="success">

                ✓ <%= message %>

            </div>

        <%

            }

        %>


        <!-- Loan Form -->

        <form
            action="${pageContext.request.contextPath}/loan/apply"
            method="post">


            <div class="form-group">

                <label>
                    Loan Type
                </label>

                <select name="loanType" required>

                    <option value="">
                        Select Loan Type
                    </option>

                    <option value="Home Loan">
                        Home Loan
                    </option>

                    <option value="Personal Loan">
                        Personal Loan
                    </option>

                    <option value="Education Loan">
                        Education Loan
                    </option>

                    <option value="Vehicle Loan">
                        Vehicle Loan
                    </option>

                </select>

            </div>


            <div class="form-group">

                <label>
                    Loan Amount
                </label>

                <input
                    type="number"
                    name="amount"
                    min="1"
                    step="0.01"
                    placeholder="Enter loan amount"
                    required>

            </div>


            <div class="form-group">

                <label>
                    Tenure (Months)
                </label>

                <input
                    type="number"
                    name="tenureMonths"
                    min="1"
                    placeholder="Example: 24"
                    required>

            </div>


            <div class="form-group">

                <label>
                    Purpose
                </label>

                <textarea
                    name="purpose"
                    rows="4"
                    placeholder="Explain the purpose of the loan"
                    required></textarea>

            </div>


            <button type="submit">

                Submit Loan Application →

            </button>


        </form>


        <div class="secure-note">

            <span class="secure-icon">🔒</span>

            Your application details are securely processed.

        </div>


        <div class="back">

            <a href="${pageContext.request.contextPath}/dashboard">

                ← Back to Dashboard

            </a>

        </div>


        <div class="brand">

            Powered by <strong>SmartBank</strong> · Digital Banking

        </div>


    </div>

</div>

</body>

</html>