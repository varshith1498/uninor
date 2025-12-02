package com.example.telecom.servlet;

import com.example.telecom.model.Plan;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class PlansServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        List<Plan> plans = new ArrayList<>();

        plans.add(new Plan(
                "P199",
                "Smart Saver",
                199,
                "1 GB/day",
                "24 days",
                "Unlimited calls, 100 SMS/day, basic data pack.",
                "Prepaid"
        ));

        plans.add(new Plan(
                "P399",
                "Entertainment Max",
                399,
                "2 GB/day",
                "28 days",
                "Unlimited calls, OTT subscription, 100 SMS/day.",
                "Prepaid"
        ));

        plans.add(new Plan(
                "P799",
                "Work From Anywhere",
                799,
                "3 GB/day",
                "56 days",
                "Unlimited calls, roaming, heavy data usage.",
                "Prepaid"
        ));

        plans.add(new Plan(
                "POST499",
                "Digital Postpaid 499",
                499,
                "75 GB",
                "Monthly Billing",
                "Carry-forward data, family add-ons, OTT bundle.",
                "Postpaid"
        ));

        request.setAttribute("plans", plans);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/plans.jsp");
        dispatcher.forward(request, response);
    }
}
