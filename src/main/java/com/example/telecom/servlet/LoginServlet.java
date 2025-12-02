package com.example.telecom.servlet;

import com.example.telecom.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        boolean ok = "user@teleconnect.com".equalsIgnoreCase(email)
                && "password123".equals(password);

        if (ok) {
            User user = new User(
                    "Kumar",
                    email,
                    "9876543210",
                    "POST499",
                    "Digital Postpaid 499",
                    "Postpaid",
                    42,
                    899
            );

            HttpSession session = request.getSession(true);
            session.setAttribute("loggedInUser", user);

            response.sendRedirect(request.getContextPath() + "/account.jsp");
        } else {
            request.setAttribute("loginError", "Invalid email or password (demo: user@teleconnect.com / password123).");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
            dispatcher.forward(request, response);
        }
    }
}
