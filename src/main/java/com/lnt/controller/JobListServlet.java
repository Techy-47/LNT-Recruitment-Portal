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

@WebServlet("/jobs")
public class JobListServlet extends HttpServlet {

    private final JobDAO jobDAO = new JobDAO();

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        String title = req.getParameter("title");
        String location = req.getParameter("location");
        String skills = req.getParameter("skills");
        String salary = req.getParameter("salary");

        try {

            List<Job> jobs;

            if ((title != null && !title.isBlank())
                    || (location != null && !location.isBlank())
                    || (skills != null && !skills.isBlank())
                    || (salary != null && !salary.isBlank())) {

                jobs = jobDAO.searchJobs(
                        title,
                        location,
                        skills,
                        salary);

            } else {

                jobs = jobDAO.findAllJobs();

            }

            req.setAttribute("jobs", jobs);

            req.setAttribute("skillsList", jobDAO.getAllSkills());

            req.setAttribute("locationList", jobDAO.getAllLocations());

            req.getRequestDispatcher("/candidate/jobs.jsp").forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}