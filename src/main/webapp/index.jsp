<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.telecom.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>UNINOR – Digital Telecom Services</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f5f5f5;
        }

        .navbar {
            background: #e40000;
            color: #ffffff;
            padding: 15px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar .logo {
            font-size: 24px;
            font-weight: bold;
        }

        .navbar .menu a {
            color: #ffffff;
            margin-left: 20px;
            text-decoration: none;
            font-size: 14px;
        }

        .navbar .menu a:hover {
            text-decoration: underline;
        }

        .hero {
            background: linear-gradient(135deg, #e40000 0%, #ff5a5a 50%, #ffffff 100%);
            color: #ffffff;
            padding: 60px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .hero-text {
            max-width: 45%;
        }

        .hero-text h1 {
            margin: 0 0 15px;
            font-size: 36px;
        }

        .hero-text p {
            font-size: 16px;
            line-height: 1.5;
        }

        .hero-text .cta-buttons {
            margin-top: 25px;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            border-radius: 20px;
            border: none;
            cursor: pointer;
            font-size: 14px;
            margin-right: 10px;
        }

        .btn-primary {
            background: #ffffff;
            color: #e40000;
            font-weight: bold;
        }

        .btn-secondary {
            background: transparent;
            color: #ffffff;
            border: 1px solid #ffffff;
        }

        .hero-image {
            max-width: 45%;
            background: #ffffff;
            color: #e40000;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .hero-image h3 {
            margin-top: 0;
        }

        .section {
            padding: 30px 40px;
        }

        .section h2 {
            margin-bottom: 20px;
        }

        .plans {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .plan-card {
            background: #ffffff;
            border-radius: 10px;
            padding: 20px;
            flex: 1 1 250px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        .plan-card h3 {
            margin-top: 0;
            color: #e40000;
        }

        .plan-price {
            font-size: 20px;
            font-weight: bold;
            margin: 10px 0;
        }

        .plan-details {
            font-size: 14px;
            color: #555;
        }

        .footer {
            background: #222;
            color: #ccc;
            padding: 20px 40px;
            font-size: 12px;
        }

        .footer a {
            color: #ccc;
            text-decoration: none;
            margin-right: 15px;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        .recharge-box {
            margin-top: 15px;
        }

        .recharge-box input,
        .recharge-box select {
            padding: 8px;
            width: 100%;
            border-radius: 4px;
            border: 1px solid #ccc;
            margin-bottom: 8px;
        }

        .recharge-box button {
            padding: 8px 14px;
            border-radius: 4px;
            border: none;
            background: #e40000;
            color: #fff;
            cursor: pointer;
            width: 100%;
        }

        .recharge-box button:hover {
            opacity: 0.9;
        }

        .link {
            color: #e40000;
            text-decoration: none;
            font-weight: bold;
        }

        .link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<%
    User currentUser = (User) session.getAttribute("loggedInUser");
%>

<div class="navbar">
    <div class="logo">TeleConnect</div>
    <div class="menu">
        <a href="<%= request.getContextPath() %>/plans">Prepaid Plans</a>
        <a href="<%= request.getContextPath() %>/plans">Postpaid</a>
        <a href="#">Broadband</a>
        <a href="#">DTH</a>
        <a href="#">Support</a>

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

<div class="hero">
    <div class="hero-text">
        <h1>Stay connected to what matters.</h1>
        <p>
            Experience high-speed 4G/5G data, crystal-clear voice calls, and
            unlimited entertainment with TeleConnect digital services.
        </p>

        <div class="cta-buttons">
            <a href="#quick-recharge">
                <button class="btn btn-primary">Recharge Now</button>
            </a>
            <a href="<%= request.getContextPath() %>/plans">
                <button class="btn btn-secondary">View Best Plans</button>
            </a>
        </div>
    </div>

    <div class="hero-image" id="quick-recharge">
        <h3>Quick Recharge</h3>
        <p>Recharge your number in just a few clicks.</p>

        <form class="recharge-box" action="<%= request.getContextPath() %>/recharge" method="post">
            <input type="text" name="mobile" placeholder="Enter 10-digit mobile number" required>
            <input type="number" name="amount" placeholder="Enter amount (₹)" required>
            <input type="email" name="email" placeholder="Email for receipt (optional)">
            <select name="operator">
                <option value="TeleConnect">TeleConnect</option>
            </select>
            <button type="submit">Proceed to Pay</button>
        </form>

        <p style="margin-top: 10px; font-size: 12px; color: #666;">
            * This is a demo portal – no real payment is processed.
        </p>
    </div>
</div>

<div class="section">
    <h2>Recommended Highlights</h2>
    <div class="plans">
        <div class="plan-card">
            <h3>Unlimited Prepaid</h3>
            <div class="plan-price">Starting ₹199</div>
            <div class="plan-details">
                Daily data, unlimited calls, SMS, and app bundles for streaming and music.
            </div>
        </div>

        <div class="plan-card">
            <h3>5G Ready Network</h3>
            <div class="plan-details">
                Upgrade to 5G-ready SIM and enjoy superfast speeds on compatible devices.
            </div>
        </div>

        <div class="plan-card">
            <h3>Digital Postpaid</h3>
            <div class="plan-details">
                Add family members, shared data, free OTT subscriptions, and detailed e-bills.
            </div>
        </div>
    </div>
</div>

<div class="footer">
    <div>
        <a href="#">About Us</a>
        <a href="#">Careers</a>
        <a href="#">Terms &amp; Conditions</a>
        <a href="#">Privacy Policy</a>
        <a href="#">Contact</a>
    </div>
    <p style="margin-top: 10px;">
        © <%= java.time.Year.now() %> Uninor Communications Ltd. All rights reserved.
    </p>
</div>

</body>
</html>
