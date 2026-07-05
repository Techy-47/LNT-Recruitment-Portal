package com.lnt.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;

import com.lnt.dao.JobDAO;
import com.lnt.model.Job;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/employer/edit-job")
public class EditJobServlet extends HttpServlet {

    private final JobDAO jobDAO = new JobDAO();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        String id = req.getParameter("id");

        if (id == null) {
            resp.sendRedirect(req.getContextPath() + "/employer/dashboard.jsp");
            return;
        }

        try {

            Job job = jobDAO.findById(Long.parseLong(id));

            if (job == null) {
                resp.sendRedirect(req.getContextPath() + "/employer/dashboard.jsp");
                return;
            }

            req.setAttribute("job", job);

            req.getRequestDispatcher("/employer/edit-job.jsp")
                    .forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        try {

            Job job = new Job();

            job.setJobId(Long.parseLong(req.getParameter("jobId")));
            job.setTitle(req.getParameter("title"));
            job.setDescription(req.getParameter("description"));
            job.setLocation(req.getParameter("location"));
            job.setSalary(req.getParameter("salary"));
            job.setSkillsRequired(req.getParameter("skillsRequired"));
            job.setExperienceRequired(req.getParameter("experienceRequired"));

            String deadline = req.getParameter("deadline");

            if (deadline != null && !deadline.isBlank()) {
                job.setDeadline(LocalDateTime.parse(deadline + "T00:00:00"));
            }

            jobDAO.update(job);

            resp.sendRedirect(req.getContextPath() + "/employer/dashboard.jsp");

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}