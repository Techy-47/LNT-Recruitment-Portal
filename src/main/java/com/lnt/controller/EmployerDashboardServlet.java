package com.lnt.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.lnt.dao.ApplicationDAO;
import com.lnt.dao.JobDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/employer-dashboard")
public class EmployerDashboardServlet extends HttpServlet {

    private final JobDAO jobDAO = new JobDAO();
    private final ApplicationDAO applicationDAO = new ApplicationDAO();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null ||
                session.getAttribute("employerId") == null) {

            resp.sendRedirect(
                    req.getContextPath() + "/employer/login.jsp");
            return;
        }

        long employerId =
                ((Number) session.getAttribute("employerId")).longValue();

        try {

            int totalJobs =
                    jobDAO.countJobs(employerId);

            int totalApplications =
                    applicationDAO.countApplications(employerId);

            req.setAttribute("totalJobs", totalJobs);
            req.setAttribute("totalApplications", totalApplications);

            req.getRequestDispatcher(
                    "/employer/dashboard.jsp")
                    .forward(req, resp);

        } catch (SQLException e) {

            throw new ServletException(e);

        }
    }
}