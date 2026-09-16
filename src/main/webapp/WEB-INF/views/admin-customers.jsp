<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Manage Customers | SmartBank</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f5f8fc;
            color: #17243a;
        }

        .header {
            background: linear-gradient(135deg, #071a35, #0b3d91);
            color: white;
            padding: 18px 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 18px rgba(0,0,0,0.12);
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .brand-icon {
            width: 42px;
            height: 42px;
            border-radius: 12px;
            background: rgba(255,255,255,0.15);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
        }

        .brand h2 {
            margin: 0;
            font-size: 21px;
        }

        .brand p {
            margin: 3px 0 0;
            font-size: 12px;
            opacity: 0.75;
        }

        .logout {
            background: rgba(255,255,255,0.12);
            border: 1px solid rgba(255,255,255,0.25);
            color: white;
            padding: 10px 18px;
            border-radius: 9px;
            text-decoration: none;
            font-weight: bold;
            transition: 0.25s;
        }

        .logout:hover {
            background: white;
            color: #0b3d91;
        }

        .container {
            width: 94%;
            max-width: 1500px;
            margin: 35px auto;
        }

        .page-heading {
            margin-bottom: 22px;
        }

        .page-heading h1 {
            margin: 0 0 7px;
            color: #0b3d91;
            font-size: 28px;
        }

        .page-heading p {
            margin: 0;
            color: #6d7888;
        }

        .section {
            background: white;
            padding: 28px;
            border-radius: 18px;
            box-shadow: 0 8px 28px rgba(20,40,70,0.07);
            border: 1px solid #edf1f6;
        }

        .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .table-header h2 {
            margin: 0;
            color: #17243a;
            font-size: 20px;
        }

        .customer-count {
            background: #eaf3ff;
            color: #0b5dcc;
            padding: 7px 13px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: bold;
        }

        .table-container {
            overflow-x: auto;
            border: 1px solid #e8edf3;
            border-radius: 12px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 1250px;
        }

        th {
            background: #0b3d91;
            color: white;
            padding: 14px 13px;
            text-align: left;
            font-size: 13px;
            white-space: nowrap;
        }

        td {
            padding: 14px 13px;
            border-bottom: 1px solid #edf0f4;
            color: #39475a;
            font-size: 13px;
            vertical-align: middle;
        }

        tbody tr:hover {
            background: #f8fbff;
        }

        tbody tr:last-child td {
            border-bottom: none;
        }

        .customer-name {
            font-weight: bold;
            color: #17243a;
        }

        .account {
            font-family: monospace;
            color: #0b3d91;
            font-weight: bold;
        }

        .upi {
            color: #59687b;
        }

        .balance {
            font-weight: bold;
            color: #17243a;
            white-space: nowrap;
        }

        .verified,
        .not-verified {
            display: inline-block;
            padding: 7px 11px;
            border-radius: 20px;
            font-size: 12px;
            white-space: nowrap;
        }

        .verified {
            color: #16733b;
            background: #e7f8ee;
            font-weight: bold;
        }

        .not-verified {
            color: #b42318;
            background: #fff0ef;
            font-weight: bold;
        }

        .not-created {
            color: #8994a3;
            font-style: italic;
        }

        .no-customers {
            text-align: center;
            padding: 55px 20px;
            background: #f8fafc;
            border-radius: 14px;
            color: #6d7888;
        }

        .no-customers-icon {
            font-size: 42px;
            margin-bottom: 10px;
        }

        .no-customers h3 {
            margin: 0 0 8px;
            color: #344054;
        }

        .back {
            margin-top: 25px;
        }

        .back a {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            color: #0b3d91;
            text-decoration: none;
            font-weight: bold;
            padding: 10px 0;
        }

        .back a:hover {
            color: #1687f7;
        }

        @media (max-width: 700px) {

            .header {
                padding: 15px 20px;
            }

            .brand h2 {
                font-size: 17px;
            }

            .brand p {
                display: none;
            }

            .logout {
                padding: 8px 12px;
                font-size: 12px;
            }

            .container {
                width: 95%;
                margin: 25px auto;
            }

            .section {
                padding: 18px;
            }

            .page-heading h1 {
                font-size: 23px;
            }

            .table-header {
                align-items: flex-start;
                gap: 10px;
            }
        }

    </style>

</head>

<body>

<div class="header">

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

</div>


<div class="container">

    <div class="page-heading">

        <h1>👥 Manage Customers</h1>

        <p>
            View registered customers and their SmartBank account information.
        </p>

    </div>


    <div class="section">

        <div class="table-header">

            <h2>Registered Customers</h2>

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

                    <td><%= customer.getId() %></td>

                    <td class="customer-name">
                        <%= customer.getFullName() %>
                    </td>

                    <td>
                        <%= customer.getEmail() %>
                    </td>

                    <td>
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

            <div class="no-customers-icon">👥</div>

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

</div>

</body>
</html>