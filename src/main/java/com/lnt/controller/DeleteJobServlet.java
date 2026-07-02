package com.lnt.controller;

import com.lnt.dao.JobDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/employer/delete-job")
public class DeleteJobServlet extends HttpServlet {

    private final JobDAO jobDAO = new JobDAO();

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null ||
                session.getAttribute("employerId") == null) {

            resp.sendRedirect(req.getContextPath() + "/employer/login");
            return;
        }

        long employerId =
                ((Number) session.getAttribute("employerId")).longValue();

        long jobId =
                Long.parseLong(req.getParameter("jobId"));

        try {

            jobDAO.delete(jobId, employerId);

            resp.sendRedirect(req.getContextPath() + "/employer/jobs");

        } catch (SQLException e) {

            throw new ServletException(e);

        }
    }
}