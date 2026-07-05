package com.lnt.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.lnt.dao.ApplicationDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/candidate/dashboard")
public class CandidateDashboardServlet extends HttpServlet {

    private final ApplicationDAO applicationDAO = new ApplicationDAO();

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null ||
                session.getAttribute("candidateId") == null) {
            resp.sendRedirect(req.getContextPath() + "/auth/login.jsp");
            return;
        }

        long candidateId = ((Number) session.getAttribute("candidateId"))
                .longValue();

        try {

            req.setAttribute(
                    "totalApplications",
                    applicationDAO.countByCandidate(candidateId));

            req.getRequestDispatcher("/candidate/dashboard.jsp")
                    .forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}