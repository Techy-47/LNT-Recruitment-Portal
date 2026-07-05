package com.lnt.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.lnt.dao.JobDAO;
import com.lnt.model.Job;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/employer/jobs")
public class EmployerJobsServlet extends HttpServlet {

    private final JobDAO jobDAO = new JobDAO();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null ||
            session.getAttribute("employerId") == null) {

            resp.sendRedirect(req.getContextPath() + "/employer/login.jsp");
            return;
        }

        long employerId =
                ((Number) session.getAttribute("employerId")).longValue();

        try {

            List<Job> jobs = jobDAO.findByEmployerId(employerId);

            req.setAttribute("jobs", jobs);

            req.getRequestDispatcher("/employer/jobs.jsp")
                    .forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}