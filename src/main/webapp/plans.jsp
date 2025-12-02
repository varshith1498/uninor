<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.telecom.model.Plan" %>
<%@ page import="com.example.telecom.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>UNINOR – Plans</title>
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
        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
        }
        th, td {
            padding: 12px 10px;
            border-bottom: 1px solid #eee;
            text-align: left;
            font-size: 14px;
        }
        th {
            background: #ffe0e0;
        }
        .badge {
            padding: 3px 8px;
            border-radius: 12px;
            font-size: 11px;
            color: #fff;
            background: #e40000;
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
    <div>TeleConnect – Plans</div>
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
    <h2>Available Prepaid &amp; Postpaid Plans</h2>

    <%
        List<Plan> plans = (List<Plan>) request.getAttribute("plans");
        if (plans == null || plans.isEmpty()) {
    %>
        <p>No plans available at the moment.</p>
    <%
        } else {
    %>
        <table>
            <thead>
            <tr>
                <th>Plan ID</th>
                <th>Name</th>
                <th>Type</th>
                <th>Price (₹)</th>
                <th>Data</th>
                <th>Validity / Billing</th>
                <th>Description</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (Plan plan : plans) {
            %>
            <tr>
                <td><%= plan.getId() %></td>
                <td><%= plan.getName() %></td>
                <td><span class="badge"><%= plan.getType() %></span></td>
                <td><%= plan.getPrice() %></td>
                <td><%= plan.getDataPerDay() %></td>
                <td><%= plan.getValidity() %></td>
                <td><%= plan.getDescription() %></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    <%
        }
    %>

    <a class="back-link" href="<%= request.getContextPath() %>/index.jsp">&larr; Back to Home</a>
</div>

</body>
</html>
