<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Fund Transfer | SmartBank</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {

            margin: 0;

            font-family: Arial, sans-serif;

            min-height: 100vh;

            background:
                radial-gradient(
                    circle at 10% 10%,
                    rgba(22,135,247,0.10),
                    transparent 28%
                ),
                radial-gradient(
                    circle at 90% 85%,
                    rgba(16,169,160,0.10),
                    transparent 30%
                ),
                linear-gradient(
                    135deg,
                    #f4f8ff,
                    #eefaf9
                );

            color: #17243a;
        }


        .page {

            min-height: 100vh;

            padding: 45px 20px;

            display: flex;

            justify-content: center;

            align-items: center;
        }


        .box {

            width: 100%;

            max-width: 530px;

            background:
                rgba(255,255,255,0.94);

            backdrop-filter: blur(15px);

            padding: 34px;

            border-radius: 24px;

            border:
                1px solid rgba(255,255,255,0.8);

            box-shadow:
                0 25px 60px
                rgba(20,50,90,0.13);

            position: relative;

            overflow: hidden;
        }


        .box::before {

            content: "";

            position: absolute;

            width: 180px;
            height: 180px;

            border-radius: 50%;

            background:
                rgba(22,135,247,0.07);

            top: -90px;

            right: -70px;
        }


        .box::after {

            content: "";

            position: absolute;

            width: 120px;
            height: 120px;

            border-radius: 50%;

            background:
                rgba(16,169,160,0.06);

            bottom: -65px;

            left: -50px;
        }


        .header {

            text-align: center;

            margin-bottom: 24px;

            position: relative;

            z-index: 1;
        }


        .transfer-icon {

            width: 66px;

            height: 66px;

            margin:
                0 auto 13px;

            border-radius: 19px;

            background:
                linear-gradient(
                    145deg,
                    #e9f5ff,
                    #e3faf7
                );

            display: flex;

            align-items: center;

            justify-content: center;

            font-size: 31px;

            box-shadow:
                0 10px 24px
                rgba(22,135,247,0.10);

            border:
                1px solid #dcecf5;
        }


        .header h1 {

            margin: 0 0 7px;

            color: #0b3d91;

            font-size: 27px;
        }


        .header p {

            margin: 0;

            color: #7a8696;

            font-size: 13px;

            line-height: 1.5;
        }


        /* =========================
           BALANCE CARD
        ========================= */

        .balance {

            background:
                linear-gradient(
                    135deg,
                    #06182f,
                    #0b3d91 60%,
                    #087f8c
                );

            color: white;

            padding: 20px;

            border-radius: 16px;

            margin-bottom: 21px;

            position: relative;

            overflow: hidden;

            box-shadow:
                0 12px 25px
                rgba(11,61,145,0.18);
        }


        .balance::after {

            content: "";

            position: absolute;

            width: 110px;
            height: 110px;

            border-radius: 50%;

            background:
                rgba(255,255,255,0.07);

            right: -35px;

            top: -50px;
        }


        .balance-label {

            font-size: 10px;

            letter-spacing: 1px;

            opacity: 0.68;

            margin-bottom: 6px;
        }


        .balance-amount {

            font-size: 27px;

            font-weight: bold;

            position: relative;

            z-index: 1;
        }


        /* =========================
           MESSAGES
        ========================= */

        .error {

            background: #fff0ef;

            color: #b42318;

            padding: 13px;

            border-radius: 11px;

            margin-bottom: 17px;

            text-align: center;

            font-size: 13px;

            border:
                1px solid #ffd5d1;
        }


        .message {

            background: #e8f8ee;

            color: #16733b;

            padding: 13px;

            border-radius: 11px;

            margin-bottom: 17px;

            text-align: center;

            font-size: 13px;

            font-weight: bold;

            border:
                1px solid #ccebd8;
        }


        /* =========================
           FORM
        ========================= */

        .form-group {

            margin-bottom: 18px;
        }


        label {

            display: block;

            color: #344054;

            font-size: 12px;

            font-weight: bold;

            margin-bottom: 7px;
        }


        input,
        select {

            width: 100%;

            padding: 13px 14px;

            border:
                1px solid #d6e0ea;

            border-radius: 11px;

            font-size: 14px;

            background:
                rgba(255,255,255,0.95);

            color: #17243a;

            transition: 0.2s;
        }


        input:focus,
        select:focus {

            outline: none;

            border-color: #1687f7;

            box-shadow:
                0 0 0 4px
                rgba(22,135,247,0.09);
        }


        select {

            cursor: pointer;
        }


        input::placeholder {

            color: #a0aaba;
        }


        /* =========================
           BUTTON
        ========================= */

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

            cursor: pointer;

            font-size: 14px;

            font-weight: bold;

            box-shadow:
                0 9px 20px
                rgba(11,61,145,0.18);

            transition: 0.25s;
        }


        button:hover {

            transform:
                translateY(-2px);

            box-shadow:
                0 13px 25px
                rgba(11,61,145,0.24);
        }


        button:active {

            transform:
                translateY(0);
        }


        /* =========================
           SECURITY
        ========================= */

        .security-note {

            text-align: center;

            color: #7f8998;

            font-size: 11px;

            margin-top: 18px;

            padding-top: 15px;

            border-top:
                1px solid #edf1f5;
        }


        /* =========================
           BACK
        ========================= */

        .back {

            text-align: center;

            margin-top: 17px;
        }


        .back a {

            color: #0b3d91;

            text-decoration: none;

            font-size: 12px;

            font-weight: bold;

            transition: 0.2s;
        }


        .back a:hover {

            color: #10a9a0;
        }


        /* =========================
           RESPONSIVE
        ========================= */

        @media (max-width: 600px) {

            .page {

                padding: 25px 15px;
            }


            .box {

                padding: 27px 20px;

                border-radius: 20px;
            }


            .header h1 {

                font-size: 24px;
            }


            .balance-amount {

                font-size: 24px;
            }
        }

    </style>

</head>


<body>


<div class="page">


    <div class="box">


        <!-- HEADER -->

        <div class="header">

            <div class="transfer-icon">
                💸
            </div>

            <h1>
                Fund Transfer
            </h1>

            <p>
                Transfer money securely using
                Account Number or UPI.
            </p>

        </div>



        <!-- BALANCE -->

        <div class="balance">

            <div class="balance-label">
                AVAILABLE BALANCE
            </div>

            <div class="balance-amount">
                ₹${customer.account.balance}
            </div>

        </div>



        <!-- ERROR -->

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



        <!-- SUCCESS MESSAGE -->

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



        <!-- TRANSFER FORM -->

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



        <!-- SECURITY -->

        <div class="security-note">

            🔐 Your transfer is processed securely.

        </div>



        <!-- BACK -->

        <div class="back">

            <a
                href="${pageContext.request.contextPath}/dashboard">

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