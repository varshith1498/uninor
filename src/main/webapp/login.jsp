<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Uninor – Login</title>
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
            padding: 40px;
            display: flex;
            justify-content: center;
        }
        .card {
            background: #fff;
            padding: 25px;
            border-radius: 8px;
            width: 360px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        button {
            width: 100%;
            padding: 10px;
            border-radius: 4px;
            border: none;
            background: #e40000;
            color: #fff;
            font-weight: bold;
            cursor: pointer;
        }
        button:hover {
            opacity: 0.9;
        }
        .error {
            color: #d93025;
            font-size: 13px;
            margin-bottom: 10px;
        }
        .hint {
            font-size: 12px;
            color: #666;
            margin-top: 10px;
        }
        .back-link {
            margin-top: 12px;
            display: inline-block;
            font-size: 13px;
            color: #e40000;
            text-decoration: none;
        }
    </style>
</head>
<body>

<div class="navbar">
    <div>TeleConnect – Login</div>
    <div>
        <a href="<%= request.getContextPath() %>/index.jsp">Home</a>
        <a href="<%= request.getContextPath() %>/plans">Plans</a>
    </div>
</div>

<div class="container">
    <div class="card">
        <h2>Sign in to My Account</h2>

        <%
            String error = (String) request.getAttribute("loginError");
            if (error != null) {
        %>
        <div class="error"><%= error %></div>
        <%
            }
        %>

        <form action="<%= request.getContextPath() %>/login" method="post">
            <input type="email" name="email" placeholder="Email"
                   value="user@teleconnect.com" required>
            <input type="password" name="password" placeholder="Password"
                   value="password123" required>
            <button type="submit">Login</button>
        </form>

        <div class="hint">
            Demo credentials:<br>
            Email: <b>nvkc1498@gmail.com</b><br>
            Password: <b>Varshith@123</b>
        </div>

        <a class="back-link" href="<%= request.getContextPath() %>/index.jsp">
            &larr; Back to Home
        </a>
    </div>
</div>

</body>
</html>
