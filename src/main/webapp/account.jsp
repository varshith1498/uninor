<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.telecom.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>UNINOR – My Account</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
            margin: 0;
        }
        .navbar {
            background: #e40000;
            color: #fff;
            padding: 15px 40px;
            display: flex;
            justify-content: space-between;
        }
        .navbar a {
            color: #fff;
            text-decoration: none;
            margin-left: 20px;
        }
        .container {
            padding: 30px 40px;
        }
        .card {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            max-width: 700px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        .label {
            font-weight: bold;
        }
        .section-title {
            margin-top: 20px;
            border-bottom: 1px solid #eee;
            padding-bottom: 5px;
            font-size: 16px;
        }
        .row {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }
        .row div {
            width: 48%;
        }
    </style>
</head>
<body>

<%
    User user = (User) session.getAttribute("loggedInUser");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>

<div class="navbar">
    <div>UNINOR – My Account</div>
    <div>
        <a href="<%= request.getContextPath() %>/index.jsp">Home</a>
        <a href="<%= request.getContextPath() %>/plans">Plans</a>
        <a href="<%= request.getContextPath() %>/logout">Logout</a>
    </div>
</div>

<div class="container">
    <div class="card">
        <h2>Welcome, <%= user.getName() %></h2>

        <div class="section-title">Profile</div>
        <p><span class="label">Mobile:</span> <%= user.getMobile() %></p>
        <p><span class="label">Email:</span> <%= user.getEmail() %></p>

        <div class="section-title">Current Plan</div>
        <p><span class="label">Plan ID:</span> <%= user.getCurrentPlanId() %></p>
        <p><span class="label">Plan Name:</span> <%= user.getCurrentPlanName() %></p>
        <p><span class="label">Billing Type:</span> <%= user.getBillingType() %></p>

        <div class="row">
            <div>
                <p><span class="label">Remaining Data:</span>
                    <%= user.getRemainingDataGb() %> GB</p>
            </div>
            <div>
                <p><span class="label">Current Bill:</span>
                    Rs <%= user.getCurrentBillAmount() %></p>
            </div>
        </div>

        <div class="section-title">Usage Snapshot (Demo)</div>
        <p>Last 7 days data usage: ~8.4 GB</p>
        <p>Last recharge: Rs 399 - Entertainment Max (dummy data)</p>

        <p style="font-size: 12px; color: #666; margin-top: 10px;">
            This is a demo My Account page. All values shown are static examples.
        </p>
    </div>
</div>

</body>
</html>
