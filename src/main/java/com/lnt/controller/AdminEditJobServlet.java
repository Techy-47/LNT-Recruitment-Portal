package com.lnt.controller;

import com.lnt.dao.JobDAO;
import com.lnt.model.Job;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;

@WebServlet("/admin/edit-job")
public class AdminEditJobServlet extends HttpServlet {

    private final JobDAO jobDAO = new JobDAO();

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("adminId") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        String id = request.getParameter("id");

        if (id == null || id.isBlank()) {
            response.sendRedirect(request.getContextPath() + "/admin/jobs");
            return;
        }

        try {

            Job job = jobDAO.findById(Long.parseLong(id));

            if (job == null) {
                session.setAttribute("error", "Job not found.");
                response.sendRedirect(request.getContextPath() + "/admin/jobs");
                return;
            }

            request.setAttribute("job", job);

            request.getRequestDispatcher("/admin/edit-job.jsp")
                    .forward(request, response);

        } catch (SQLException e) {

            throw new ServletException(e);

        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("adminId") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        try {

            Job job = new Job();

            job.setJobId(Long.parseLong(request.getParameter("jobId")));
            job.setTitle(request.getParameter("title"));
            job.setDescription(request.getParameter("description"));
            job.setLocation(request.getParameter("location"));
            job.setSalary(request.getParameter("salary"));
            job.setSkillsRequired(request.getParameter("skillsRequired"));
            job.setExperienceRequired(request.getParameter("experienceRequired"));

            String deadline = request.getParameter("deadline");

            if (deadline != null && !deadline.isBlank()) {
                job.setDeadline(LocalDateTime.parse(deadline + "T00:00:00"));
            }

            boolean updated = jobDAO.update(job);

            if (updated) {
                session.setAttribute("success", "Job updated successfully.");
            } else {
                session.setAttribute("error", "Unable to update job.");
            }

            response.sendRedirect(request.getContextPath() + "/admin/jobs");

        } catch (SQLException e) {

            throw new ServletException(e);

        }
    }
}