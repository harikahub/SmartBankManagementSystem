<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Fund Transfer | SmartBank</title>

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
            max-width: 520px;
            margin: auto;
            background: white;
            padding: 32px;
            border-radius: 20px;
            box-shadow: 0 12px 35px rgba(20,40,70,0.09);
            border: 1px solid #e9eef5;
        }

        .header {
            text-align: center;
            margin-bottom: 25px;
        }

        .transfer-icon {
            width: 58px;
            height: 58px;
            margin: auto auto 12px;
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

        .balance {
            background: linear-gradient(135deg, #071a35, #0b3d91);
            color: white;
            padding: 18px;
            border-radius: 13px;
            margin-bottom: 21px;
        }

        .balance-label {
            font-size: 11px;
            opacity: 0.72;
            margin-bottom: 6px;
        }

        .balance-amount {
            font-size: 25px;
            font-weight: bold;
        }

        .error {
            background: #fff0ef;
            color: #b42318;
            padding: 12px;
            border-radius: 9px;
            margin-bottom: 17px;
            text-align: center;
            font-size: 13px;
            border: 1px solid #ffd5d1;
        }

        .message {
            background: #e8f8ee;
            color: #16733b;
            padding: 12px;
            border-radius: 9px;
            margin-bottom: 17px;
            text-align: center;
            font-size: 13px;
            font-weight: bold;
            border: 1px solid #ccebd8;
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

        input,
        select {
            width: 100%;
            padding: 13px;
            border: 1px solid #d7dee8;
            border-radius: 9px;
            font-size: 14px;
            background: white;
        }

        input:focus,
        select:focus {
            outline: none;
            border-color: #1687f7;
            box-shadow: 0 0 0 3px rgba(22,135,247,0.1);
        }

        button {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #0b3d91, #1687f7);
            color: white;
            border: none;
            border-radius: 9px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
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

        .security-note {
            text-align: center;
            color: #8a94a4;
            font-size: 11px;
            margin-top: 18px;
        }

        @media (max-width: 600px) {

            .page {
                padding: 25px 15px;
            }

            .box {
                padding: 24px 20px;
            }

        }

    </style>

</head>

<body>

<div class="page">

    <div class="box">

        <div class="header">

            <div class="transfer-icon">
                💸
            </div>

            <h1>Fund Transfer</h1>

            <p>
                Transfer money securely using Account Number or UPI.
            </p>

        </div>


        <div class="balance">

            <div class="balance-label">
                AVAILABLE BALANCE
            </div>

            <div class="balance-amount">
                ₹${customer.account.balance}
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


        <%
            String message =
                (String) request.getAttribute("message");

            if (message != null) {
        %>

            <div class="message">
                ✓ <%= message %>
            </div>

        <%
            }
        %>


        <form id="transferForm"
              method="post">


            <div class="form-group">

                <label for="transferType">
                    Transfer Using
                </label>

                <select
                    name="transferType"
                    id="transferType"
                    required
                    onchange="changeReceiverField()">

                    <option value="account">
                        Account Number
                    </option>

                    <option value="upi">
                        UPI ID
                    </option>

                </select>

            </div>


            <div class="form-group">

                <label id="receiverLabel">
                    Receiver Account Number
                </label>

                <input
                    type="text"
                    name="receiverAccount"
                    id="receiver"
                    placeholder="Enter receiver account number"
                    required>

            </div>


            <div class="form-group">

                <label>
                    Amount
                </label>

                <input
                    type="number"
                    name="amount"
                    step="0.01"
                    min="1"
                    placeholder="Enter amount"
                    required>

            </div>


            <button type="submit">
                Transfer Money →
            </button>

        </form>


        <div class="security-note">
            🔐 Your transfer is processed securely.
        </div>


        <div class="back">

            <a href="${pageContext.request.contextPath}/dashboard">
                ← Back to Dashboard
            </a>

        </div>

    </div>

</div>


<script>

    function changeReceiverField() {

        const transferType =
            document.getElementById("transferType").value;

        const receiverLabel =
            document.getElementById("receiverLabel");

        const receiver =
            document.getElementById("receiver");

        const form =
            document.getElementById("transferForm");


        if (transferType === "upi") {

            receiverLabel.innerText =
                "Receiver UPI ID";

            receiver.placeholder =
                "Enter receiver UPI ID";

            receiver.name =
                "receiverUpiId";

            form.action =
                "${pageContext.request.contextPath}/transfer/upi";

        } else {

            receiverLabel.innerText =
                "Receiver Account Number";

            receiver.placeholder =
                "Enter receiver account number";

            receiver.name =
                "receiverAccount";

            form.action =
                "${pageContext.request.contextPath}/transfer";

        }

    }

    changeReceiverField();

</script>

</body>
</html>