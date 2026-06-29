package com.lnt.controller;

import com.lnt.dao.JobDAO;
import com.lnt.model.Job;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/jobs")
public class JobListServlet extends HttpServlet {

    private final JobDAO jobDAO = new JobDAO();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        try {

            List<Job> jobs = jobDAO.findAllJobs();

            req.setAttribute("jobs", jobs);

            req.getRequestDispatcher("/candidate/jobs.jsp")
                    .forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}