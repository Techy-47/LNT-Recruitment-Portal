package com.lnt.controller;

import com.lnt.dao.JobDAO;
import com.lnt.model.Job;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/admin/job-details")
public class AdminJobDetailsServlet extends HttpServlet {

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

            request.getRequestDispatcher("/admin/job-details.jsp")
                    .forward(request, response);

        } catch (SQLException e) {

            throw new ServletException(e);

        }
    }
}