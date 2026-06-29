package com.lnt.controller;

import com.lnt.dao.ApplicationDAO;
import com.lnt.dao.CandidateDAO;
import com.lnt.dao.EmployerDAO;
import com.lnt.dao.JobDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AdminDashboardServlet", urlPatterns = {"/admin/dashboard"})
public class AdminDashboardServlet extends HttpServlet {

    private final CandidateDAO candidateDAO = new CandidateDAO();
    private final EmployerDAO employerDAO = new EmployerDAO();
    private final JobDAO jobDAO = new JobDAO();
    private final ApplicationDAO applicationDAO = new ApplicationDAO();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("adminId") == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/login");
            return;
        }

        try {

            req.setAttribute(
                    "totalCandidates",
                    candidateDAO.countCandidates());

            req.setAttribute(
                    "totalEmployers",
                    employerDAO.countEmployers());

            req.setAttribute(
                    "totalJobs",
                    jobDAO.countAllJobs());

            req.setAttribute(
                    "totalApplications",
                    applicationDAO.countAllApplications());

            req.getRequestDispatcher("/admin/dashboard.jsp")
                    .forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}