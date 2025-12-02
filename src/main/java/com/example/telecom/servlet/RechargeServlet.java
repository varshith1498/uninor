package com.example.telecom.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class RechargeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String mobile = request.getParameter("mobile");
        String amount = request.getParameter("amount");
        String email = request.getParameter("email");
        String operator = request.getParameter("operator");

        boolean valid = mobile != null && mobile.matches("\\d{10}")
                && amount != null && !amount.isBlank();

        String statusMessage;
        if (valid) {
            statusMessage = "Recharge of ₹" + amount + " for " + mobile
                    + " has been successfully processed (demo).";
        } else {
            statusMessage = "Recharge failed. Please check the mobile number and amount.";
        }

        request.setAttribute("mobile", mobile);
        request.setAttribute("amount", amount);
        request.setAttribute("email", email);
        request.setAttribute("operator", operator);
        request.setAttribute("statusMessage", statusMessage);
        request.setAttribute("success", valid);

        RequestDispatcher dispatcher =
                request.getRequestDispatcher("/recharge-success.jsp");
        dispatcher.forward(request, response);
    }
}
