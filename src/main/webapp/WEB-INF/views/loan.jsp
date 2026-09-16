<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Apply Loan | SmartBank</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #f5f9ff, #edf5ff);
            color: #17243a;
        }

        .page {
            min-height: 100vh;
            padding: 45px 20px;
        }

        .box {
            width: 100%;
            max-width: 600px;
            margin: auto;
            background: white;
            padding: 35px;
            border-radius: 20px;
            box-shadow: 0 12px 35px rgba(20,40,70,0.09);
            border: 1px solid #e9eef5;
        }

        .header {
            text-align: center;
            margin-bottom: 28px;
        }

        .loan-icon {
            width: 58px;
            height: 58px;
            margin: 0 auto 13px;
            border-radius: 16px;
            background: #eaf3ff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
        }

        .header h1 {
            margin: 0 0 7px;
            color: #0b3d91;
            font-size: 26px;
        }

        .header p {
            margin: 0;
            color: #7a8696;
            font-size: 13px;
        }

        .success {
            background: #e8f8ee;
            color: #16733b;
            padding: 13px;
            border-radius: 9px;
            margin-bottom: 22px;
            text-align: center;
            font-size: 13px;
            font-weight: bold;
            border: 1px solid #ccebd8;
        }

        .form-group {
            margin-bottom: 19px;
        }

        label {
            display: block;
            color: #344054;
            font-size: 13px;
            font-weight: bold;
            margin-bottom: 7px;
        }

        input,
        select,
        textarea {
            width: 100%;
            padding: 13px 14px;
            border: 1px solid #d7dee8;
            border-radius: 9px;
            font-family: inherit;
            font-size: 14px;
            background: white;
            transition: 0.2s;
        }

        textarea {
            resize: vertical;
        }

        input:focus,
        select:focus,
        textarea:focus {
            outline: none;
            border-color: #1687f7;
            box-shadow: 0 0 0 3px rgba(22,135,247,0.1);
        }

        button {
            width: 100%;
            padding: 14px;
            margin-top: 5px;
            background: linear-gradient(135deg, #0b3d91, #1687f7);
            color: white;
            border: none;
            border-radius: 9px;
            cursor: pointer;
            font-size: 14px;
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

        @media (max-width: 600px) {

            .page {
                padding: 25px 15px;
            }

            .box {
                padding: 25px 20px;
            }

        }

    </style>

</head>

<body>

<div class="page">

    <div class="box">

        <div class="header">

            <div class="loan-icon">
                🏦
            </div>

            <h1>Apply for a Loan</h1>

            <p>
                Submit your loan application securely through SmartBank.
            </p>

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


        <form
            action="${pageContext.request.contextPath}/loan/apply"
            method="post">


            <div class="form-group">

                <label>Loan Type</label>

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

                <label>Loan Amount</label>

                <input
                    type="number"
                    name="amount"
                    min="1"
                    step="0.01"
                    placeholder="Enter loan amount"
                    required>

            </div>


            <div class="form-group">

                <label>Tenure (Months)</label>

                <input
                    type="number"
                    name="tenureMonths"
                    min="1"
                    placeholder="Example: 24"
                    required>

            </div>


            <div class="form-group">

                <label>Purpose</label>

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


        <div class="back">

            <a href="${pageContext.request.contextPath}/dashboard">
                ← Back to Dashboard
            </a>

        </div>

    </div>

</div>

</body>
</html>