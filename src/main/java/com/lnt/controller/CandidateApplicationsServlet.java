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

        Long candidateId =
                (Long) session.getAttribute("candidateId");

        try {

            List<Application> apps =
                    dao.findByCandidateId(candidateId);

            req.setAttribute("applications", apps);

            req.getRequestDispatcher(
                    "/candidate/my-applications.jsp")
                    .forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}