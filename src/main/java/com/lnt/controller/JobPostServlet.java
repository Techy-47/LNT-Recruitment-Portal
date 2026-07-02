package com.lnt.controller;

import com.lnt.dao.JobDAO;
import com.lnt.model.Job;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeParseException;

@WebServlet(name = "JobPostServlet", urlPatterns = {"/employer/post-job"})
public class JobPostServlet extends HttpServlet {
    private final JobDAO jobDAO = new JobDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/employer/post-job.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String description = req.getParameter("description");
        String location = req.getParameter("location");
        String salary = req.getParameter("salary");
        String skills = req.getParameter("skills");
        String experience = req.getParameter("experience");
        String deadlineParam = req.getParameter("deadline");

        Long employerId = (Long) req.getSession().getAttribute("employerId");
        if (employerId == null) {
            resp.sendRedirect(req.getContextPath() + "/employer/login");
            return;
        }

        Job j = new Job();
        j.setEmployerId(employerId);
        j.setTitle(title);
        j.setDescription(description);
        j.setLocation(location);
        j.setSalary(salary);
        j.setSkillsRequired(skills);
        j.setExperienceRequired(experience);

        if (deadlineParam != null && !deadlineParam.isBlank()) {
            try {
                j.setDeadline(LocalDateTime.parse(deadlineParam));
            } catch (DateTimeParseException e) {
                req.setAttribute("error", "Invalid deadline format. Please use the date/time picker.");
                req.getRequestDispatcher("/employer/post-job.jsp").forward(req, resp);
                return;
            }
        }

        try {
            boolean ok = jobDAO.create(j);
            if (ok) resp.sendRedirect(req.getContextPath() + "/employer-dashboard");
            else {
                req.setAttribute("error", "Failed to post job");
                req.getRequestDispatcher("/employer/post-job.jsp").forward(req, resp);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
