package com.lnt.controller;

import com.lnt.dao.ApplicationDAO;
import com.lnt.model.Application;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/my-applications")
public class CandidateApplicationsServlet extends HttpServlet {

    private final ApplicationDAO dao = new ApplicationDAO();

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        Long candidateId = (Long) session.getAttribute("candidateId");

        try {

            List<Application> apps = dao.findByCandidateId(candidateId);

            int applied = 0;
            int shortlisted = 0;
            int accepted = 0;
            int rejected = 0;

            for (Application app : apps) {

                String status = app.getStatus();

                if ("Applied".equalsIgnoreCase(status)) {
                    applied++;
                } else if ("Shortlisted".equalsIgnoreCase(status)) {
                    shortlisted++;
                } else if ("Accepted".equalsIgnoreCase(status)) {
                    accepted++;
                } else if ("Rejected".equalsIgnoreCase(status)) {
                    rejected++;
                }
            }

            req.setAttribute("applications", apps);

            req.setAttribute("appliedCount", applied);
            req.setAttribute("shortlistedCount", shortlisted);
            req.setAttribute("acceptedCount", accepted);
            req.setAttribute("rejectedCount", rejected);

            req.getRequestDispatcher("/candidate/my-applications.jsp")
                    .forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}