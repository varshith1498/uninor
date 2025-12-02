<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.telecom.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>UNINOR – Recharge Status</title>
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
            max-width: 480px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        .status-ok {
            color: #188038;
            font-weight: bold;
        }
        .status-fail {
            color: #d93025;
            font-weight: bold;
        }
        .label {
            font-weight: bold;
        }
        .back-link {
            margin-top: 15px;
            display: inline-block;
            text-decoration: none;
            color: #e40000;
            font-weight: bold;
        }
    </style>
</head>
<body>

<%
    User currentUser = (User) session.getAttribute("loggedInUser");
%>

<div class="navbar">
    <div>TeleConnect – Recharge</div>
    <div>
        <a href="<%= request.getContextPath() %>/index.jsp">Home</a>
        <a href="<%= request.getContextPath() %>/plans">Plans</a>
        <% if (currentUser != null) { %>
            <a href="<%= request.getContextPath() %>/account.jsp">
                My Account (Hi, <%= currentUser.getName() %>)
            </a>
            <a href="<%= request.getContextPath() %>/logout">Logout</a>
        <% } else { %>
            <a href="<%= request.getContextPath() %>/login.jsp">Login</a>
        <% } %>
    </div>
</div>

<div class="container">
    <div class="card">
        <%
            Boolean success = (Boolean) request.getAttribute("success");
            if (success == null) success = Boolean.FALSE;
            String statusMessage = (String) request.getAttribute("statusMessage");
            String mobile = (String) request.getAttribute("mobile");
            String amount = (String) request.getAttribute("amount");
            String email = (String) request.getAttribute("email");
            String operator = (String) request.getAttribute("operator");
        %>

        <h2>Recharge Status</h2>
        <p class="<%= success ? "status-ok" : "status-fail" %>">
            <%= statusMessage %>
        </p>

        <h3>Recharge Details</h3>
        <p><span class="label">Mobile:</span> <%= mobile != null ? mobile : "-" %></p>
        <p><span class="label">Amount:</span> ₹<%= amount != null ? amount : "-" %></p>
        <p><span class="label">Operator:</span> <%= operator != null ? operator : "-" %></p>
        <p><span class="label">Email:</span> <%= email != null && !email.isBlank() ? email : "Not provided" %></p>

        <p style="font-size: 12px; color: #666; margin-top: 10px;">
            Note: This is a demo telecom portal. No real payment or recharge is processed.
        </p>

        <a class="back-link" href="<%= request.getContextPath() %>/index.jsp">&larr; Make another recharge</a>
    </div>
</div>

</body>
</html>
