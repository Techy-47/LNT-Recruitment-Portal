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

@WebServlet("/admin/manage-jobs")
public class AdminManageJobsServlet extends HttpServlet {

    private final JobDAO jobDAO = new JobDAO();

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        String keyword = request.getParameter("keyword");

        try {

            List<Job> jobs;

            if (keyword != null && !keyword.trim().isEmpty()) {
                jobs = jobDAO.searchJobsForAdmin(keyword);
            } else {
                jobs = jobDAO.findAll();
            }

            request.setAttribute("jobs", jobs);
            request.setAttribute("keyword", keyword);

            request.getRequestDispatcher("/admin/manage-jobs.jsp")
                    .forward(request, response);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}