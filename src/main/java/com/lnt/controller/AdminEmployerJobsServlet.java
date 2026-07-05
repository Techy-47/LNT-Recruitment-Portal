package com.lnt.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.lnt.dao.EmployerDAO;
import com.lnt.dao.JobDAO;
import com.lnt.model.Employer;
import com.lnt.model.Job;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/employer/jobs")
public class AdminEmployerJobsServlet extends HttpServlet {

    private final EmployerDAO employerDAO = new EmployerDAO();
    private final JobDAO jobDAO = new JobDAO();

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null ||
                session.getAttribute("adminId") == null) {

            resp.sendRedirect(
                    req.getContextPath() + "/admin/login");
            return;
        }

        String id = req.getParameter("id");

        if (id == null || id.isBlank()) {

            resp.sendRedirect(
                    req.getContextPath() + "/admin/employers");
            return;
        }

        try {

            long employerId = Long.parseLong(id);

            Employer employer = employerDAO.findById(employerId);

            if (employer == null) {

                resp.sendRedirect(
                        req.getContextPath() + "/admin/employers");

                return;
            }

            List<Job> jobs = jobDAO.findByEmployerId(employerId);

            req.setAttribute("employer", employer);
            req.setAttribute("jobs", jobs);

            req.getRequestDispatcher(
                    "/admin/employer-jobs.jsp")
                    .forward(req, resp);

        } catch (SQLException e) {

            throw new ServletException(e);

        } catch (NumberFormatException e) {

            resp.sendRedirect(
                    req.getContextPath() + "/admin/employers");

        }

    }

}