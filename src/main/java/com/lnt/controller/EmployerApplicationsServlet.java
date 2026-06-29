package com.lnt.controller;

import com.lnt.dao.ApplicationDAO;
import com.lnt.model.Application;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/employer-applications")
public class EmployerApplicationsServlet extends HttpServlet {

    private final ApplicationDAO dao = new ApplicationDAO();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if(session == null){
            resp.sendRedirect(req.getContextPath()
                    + "/employer/login.jsp");
            return;
        }

        Object employerObj =
                session.getAttribute("employerId");

        if(employerObj == null){
            resp.sendRedirect(req.getContextPath()
                    + "/employer/login.jsp");
            return;
        }

        Long employerId =
                ((Number) employerObj).longValue();

        try {

            List<Application> applications =
                    dao.findByEmployerId(employerId);

            req.setAttribute(
                    "applications",
                    applications
            );

            req.getRequestDispatcher(
                    "/employer/applications.jsp"
            ).forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}