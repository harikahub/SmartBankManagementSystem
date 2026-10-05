<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

```
<title>Manage Customers | SmartBank</title>

<style>

    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        font-family: Arial, sans-serif;
        color: #17243a;
        min-height: 100vh;

        background:
            radial-gradient(circle at 10% 10%, rgba(22, 135, 247, 0.18), transparent 28%),
            radial-gradient(circle at 90% 20%, rgba(0, 200, 190, 0.16), transparent 28%),
            linear-gradient(135deg, #eef7ff, #f7fbff 45%, #edfafa);
    }

    /* ================= HEADER ================= */

    .header {
        position: sticky;
        top: 0;
        z-index: 100;

        padding: 17px 5%;

        display: flex;
        justify-content: space-between;
        align-items: center;

        color: white;

        background:
            linear-gradient(135deg, #061b38, #0b4ea2 55%, #087f91);

        box-shadow:
            0 12px 35px rgba(7, 44, 91, 0.25);
    }

    .brand {
        display: flex;
        align-items: center;
        gap: 13px;
    }

    .brand-icon {
        width: 45px;
        height: 45px;

        display: flex;
        align-items: center;
        justify-content: center;

        border-radius: 14px;

        font-size: 22px;

        background: rgba(255, 255, 255, 0.14);
        border: 1px solid rgba(255, 255, 255, 0.22);

        box-shadow:
            inset 0 1px 0 rgba(255,255,255,0.25),
            0 8px 20px rgba(0,0,0,0.18);
    }

    .brand h2 {
        margin: 0;
        font-size: 21px;
        letter-spacing: 0.2px;
    }

    .brand p {
        margin: 3px 0 0;
        font-size: 12px;
        opacity: 0.72;
    }

    .logout {
        padding: 10px 18px;

        color: white;
        text-decoration: none;
        font-size: 13px;
        font-weight: bold;

        border-radius: 11px;

        background: rgba(255,255,255,0.12);
        border: 1px solid rgba(255,255,255,0.25);

        transition: 0.25s ease;
    }

    .logout:hover {
        color: #07519f;
        background: white;
        transform: translateY(-2px);

        box-shadow: 0 8px 20px rgba(0,0,0,0.18);
    }

    /* ================= MAIN ================= */

    .container {
        width: 94%;
        max-width: 1500px;
        margin: 42px auto;
    }

    .page-heading {
        margin-bottom: 25px;
    }

    .page-heading .eyebrow {
        display: inline-flex;
        align-items: center;
        gap: 7px;

        padding: 7px 13px;
        margin-bottom: 12px;

        border-radius: 20px;

        color: #075fa7;
        background: rgba(255,255,255,0.65);
        border: 1px solid rgba(33, 142, 220, 0.18);

        font-size: 12px;
        font-weight: bold;
        letter-spacing: 0.4px;

        box-shadow: 0 6px 18px rgba(18, 92, 145, 0.08);
    }

    .page-heading h1 {
        margin: 0 0 8px;

        color: #082b57;

        font-size: 30px;
        letter-spacing: -0.5px;
    }

    .page-heading p {
        margin: 0;

        color: #68788d;
        font-size: 14px;
    }

    /* ================= GLASS SECTION ================= */

    .section {
        position: relative;
        overflow: hidden;

        padding: 28px;

        border-radius: 24px;

        background: rgba(255,255,255,0.72);

        border: 1px solid rgba(255,255,255,0.85);

        box-shadow:
            0 20px 55px rgba(18, 68, 108, 0.12),
            inset 0 1px 0 rgba(255,255,255,0.8);

        backdrop-filter: blur(16px);
    }

    .section::before {
        content: "";
        position: absolute;

        width: 180px;
        height: 180px;

        right: -70px;
        top: -90px;

        border-radius: 50%;

        background: rgba(0, 191, 190, 0.10);

        pointer-events: none;
    }

    /* ================= TABLE HEADER ================= */

    .table-header {
        position: relative;
        z-index: 2;

        display: flex;
        justify-content: space-between;
        align-items: center;

        margin-bottom: 22px;
    }

    .table-title {
        display: flex;
        align-items: center;
        gap: 12px;
    }

    .table-title-icon {
        width: 43px;
        height: 43px;

        display: flex;
        align-items: center;
        justify-content: center;

        border-radius: 13px;

        font-size: 20px;

        background: linear-gradient(135deg, #0b5dcc, #06a6a6);

        box-shadow:
            0 9px 20px rgba(8, 104, 175, 0.22);
    }

    .table-header h2 {
        margin: 0;

        color: #152c49;
        font-size: 20px;
    }

    .table-header small {
        display: block;

        margin-top: 4px;

        color: #7a899b;
        font-size: 12px;
    }

    .customer-count {
        padding: 9px 15px;

        border-radius: 22px;

        color: #075da7;

        background: linear-gradient(
            135deg,
            rgba(226,243,255,0.95),
            rgba(224,250,250,0.95)
        );

        border: 1px solid rgba(22,135,247,0.15);

        font-size: 12px;
        font-weight: bold;

        box-shadow: 0 6px 16px rgba(20,100,150,0.08);
    }

    /* ================= TABLE ================= */

    .table-container {
        position: relative;
        z-index: 2;

        overflow-x: auto;

        border-radius: 17px;

        border: 1px solid rgba(205, 220, 235, 0.75);

        background: rgba(255,255,255,0.65);

        box-shadow:
            0 12px 30px rgba(25, 70, 105, 0.07);
    }

    table {
        width: 100%;
        min-width: 1280px;

        border-collapse: separate;
        border-spacing: 0;
    }

    th {
        padding: 15px 14px;

        text-align: left;
        white-space: nowrap;

        color: white;

        background:
            linear-gradient(135deg, #073c82, #087aa1);

        font-size: 12px;
        letter-spacing: 0.3px;

        border-bottom: 1px solid rgba(255,255,255,0.15);
    }

    th:first-child {
        border-top-left-radius: 16px;
    }

    th:last-child {
        border-top-right-radius: 16px;
    }

    td {
        padding: 15px 14px;

        color: #43546a;

        font-size: 13px;

        vertical-align: middle;

        background: rgba(255,255,255,0.62);

        border-bottom: 1px solid #e8eef4;
    }

    tbody tr {
        transition: 0.22s ease;
    }

    tbody tr:hover td {
        background: rgba(235,247,255,0.92);
    }

    tbody tr:hover {
        transform: scale(1.002);
    }

    tbody tr:last-child td {
        border-bottom: none;
    }

    .id-badge {
        display: inline-flex;
        align-items: center;
        justify-content: center;

        min-width: 32px;
        height: 28px;

        padding: 0 8px;

        border-radius: 9px;

        color: #075da7;

        background: #e9f5ff;

        font-size: 12px;
        font-weight: bold;
    }

    .customer-name {
        color: #152d4c;
        font-weight: bold;
    }

    .email {
        color: #51657b;
    }

    .mobile {
        white-space: nowrap;
    }

    .account {
        display: inline-block;

        padding: 6px 9px;

        border-radius: 8px;

        color: #075da7;

        background: #edf7ff;

        font-family: monospace;
        font-weight: bold;
        font-size: 12px;
    }

    .upi {
        color: #087d83;
        white-space: nowrap;
    }

    .balance {
        color: #143a61;
        font-weight: bold;
        white-space: nowrap;
    }

    /* ================= STATUS ================= */

    .verified,
    .not-verified {
        display: inline-flex;
        align-items: center;
        gap: 5px;

        padding: 7px 11px;

        border-radius: 20px;

        font-size: 11px;
        font-weight: bold;
        white-space: nowrap;
    }

    .verified {
        color: #087449;

        background: #e7f9f0;

        border: 1px solid #c7efdc;
    }

    .not-verified {
        color: #b42318;

        background: #fff0ef;

        border: 1px solid #ffd3cf;
    }

    .not-created {
        color: #8996a6;
        font-size: 12px;
        font-style: italic;
    }

    /* ================= EMPTY STATE ================= */

    .no-customers {
        position: relative;
        z-index: 2;

        text-align: center;

        padding: 65px 20px;

        border-radius: 18px;

        background:
            linear-gradient(
                135deg,
                rgba(240,248,255,0.85),
                rgba(238,252,252,0.85)
            );

        border: 1px dashed #bfd8e8;
    }

    .no-customers-icon {
        width: 70px;
        height: 70px;

        display: flex;
        align-items: center;
        justify-content: center;

        margin: 0 auto 15px;

        border-radius: 22px;

        font-size: 31px;

        background: linear-gradient(135deg, #dff1ff, #dffafa);

        box-shadow: 0 12px 25px rgba(25,100,150,0.10);
    }

    .no-customers h3 {
        margin: 0 0 8px;

        color: #263c55;
    }

    .no-customers p {
        margin: 0;

        color: #758497;
        font-size: 13px;
    }

    /* ================= BACK ================= */

    .back {
        position: relative;
        z-index: 2;

        margin-top: 24px;
    }

    .back a {
        display: inline-flex;
        align-items: center;
        gap: 8px;

        padding: 11px 16px;

        color: #075da7;

        background: rgba(235,247,255,0.8);

        border: 1px solid rgba(22,135,247,0.14);

        border-radius: 11px;

        text-decoration: none;

        font-size: 13px;
        font-weight: bold;

        transition: 0.25s ease;
    }

    .back a:hover {
        color: white;

        background: linear-gradient(135deg, #0b5dcc, #08a2a2);

        transform: translateX(-3px);

        box-shadow: 0 8px 20px rgba(9,105,170,0.20);
    }

    /* ================= RESPONSIVE ================= */

    @media (max-width: 700px) {

        .header {
            padding: 14px 20px;
        }

        .brand h2 {
            font-size: 17px;
        }

        .brand p {
            display: none;
        }

        .brand-icon {
            width: 40px;
            height: 40px;
        }

        .logout {
            padding: 8px 12px;
            font-size: 12px;
        }

        .container {
            width: 94%;
            margin: 28px auto;
        }

        .page-heading h1 {
            font-size: 24px;
        }

        .section {
            padding: 18px;
            border-radius: 19px;
        }

        .table-header {
            align-items: flex-start;
            gap: 12px;
        }

        .table-header h2 {
            font-size: 17px;
        }

        .customer-count {
            padding: 8px 11px;
            font-size: 11px;
        }
    }

</style>
```

</head>

<body>

<!-- ================= HEADER ================= -->

<div class="header">

```
<div class="brand">

    <div class="brand-icon">🏦</div>

    <div>
        <h2>SmartBank</h2>
        <p>Administration Portal</p>
    </div>

</div>

<a href="${pageContext.request.contextPath}/admin/logout"
   class="logout">
    Logout
</a>
```

</div>

<!-- ================= MAIN ================= -->

<div class="container">

```
<div class="page-heading">

    <div class="eyebrow">
        👥 CUSTOMER MANAGEMENT
    </div>

    <h1>Manage Customers</h1>

    <p>
        View registered customers and their SmartBank account information.
    </p>

</div>


<div class="section">

    <div class="table-header">

        <div class="table-title">

            <div class="table-title-icon">
                👥
            </div>

            <div>

                <h2>Registered Customers</h2>

                <small>
                    Customer accounts and verification details
                </small>

            </div>

        </div>


        <%

            java.util.List customers =
                (java.util.List) request.getAttribute("customers");

            int customerCount =
                customers != null ? customers.size() : 0;

        %>

        <span class="customer-count">
            <%= customerCount %> Customers
        </span>

    </div>


    <%

        if (customers != null && !customers.isEmpty()) {

    %>

    <div class="table-container">

        <table>

            <thead>

            <tr>

                <th>ID</th>
                <th>Customer Name</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Address</th>
                <th>Aadhaar</th>
                <th>PAN</th>
                <th>Account Number</th>
                <th>UPI ID</th>
                <th>Balance</th>
                <th>Status</th>

            </tr>

            </thead>


            <tbody>

            <%

                for (Object obj : customers) {

                    com.smartbank.entity.Customer customer =
                        (com.smartbank.entity.Customer) obj;

            %>

            <tr>

                <td>
                    <span class="id-badge">
                        <%= customer.getId() %>
                    </span>
                </td>


                <td class="customer-name">
                    <%= customer.getFullName() %>
                </td>


                <td class="email">
                    <%= customer.getEmail() %>
                </td>


                <td class="mobile">
                    <%= customer.getMobile() %>
                </td>


                <td>
                    <%= customer.getAddress() %>
                </td>


                <td>
                    <%= customer.getAadharNumber() %>
                </td>


                <td>
                    <%= customer.getPanNumber() %>
                </td>


                <td>

                    <%

                        if (customer.getAccount() != null) {

                    %>

                        <span class="account">
                            <%= customer.getAccount().getAccountNumber() %>
                        </span>

                    <%

                        } else {

                    %>

                        <span class="not-created">
                            Not Created
                        </span>

                    <%

                        }

                    %>

                </td>


                <td>

                    <%

                        if (customer.getAccount() != null) {

                    %>

                        <span class="upi">
                            <%= customer.getAccount().getUpiId() %>
                        </span>

                    <%

                        } else {

                    %>

                        <span class="not-created">
                            Not Created
                        </span>

                    <%

                        }

                    %>

                </td>


                <td>

                    <%

                        if (customer.getAccount() != null) {

                    %>

                        <span class="balance">
                            ₹<%= customer.getAccount().getBalance() %>
                        </span>

                    <%

                        } else {

                    %>

                        <span class="balance">
                            ₹0.0
                        </span>

                    <%

                        }

                    %>

                </td>


                <td>

                    <%

                        if (customer.isVerified()) {

                    %>

                        <span class="verified">
                            ✓ Verified
                        </span>

                    <%

                        } else {

                    %>

                        <span class="not-verified">
                            ✕ Not Verified
                        </span>

                    <%

                        }

                    %>

                </td>

            </tr>

            <%

                }

            %>

            </tbody>

        </table>

    </div>


    <%

        } else {

    %>


    <div class="no-customers">

        <div class="no-customers-icon">
            👥
        </div>

        <h3>No Customers Found</h3>

        <p>
            There are currently no registered customers.
        </p>

    </div>


    <%

        }

    %>


    <div class="back">

        <a href="${pageContext.request.contextPath}/admin/dashboard">
            ← Back to Admin Dashboard
        </a>

    </div>

</div>
```

</div>

</body>
</html>
