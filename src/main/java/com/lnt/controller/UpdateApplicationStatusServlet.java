package com.lnt.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.lnt.dao.ApplicationDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/update-application-status")
public class UpdateApplicationStatusServlet extends HttpServlet {

    private final ApplicationDAO dao = new ApplicationDAO();

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null ||
                session.getAttribute("employerId") == null) {

            resp.sendRedirect(
                    req.getContextPath() + "/employer/login.jsp");
            return;
        }

        long applicationId =
                Long.parseLong(req.getParameter("applicationId"));

        String status =
                req.getParameter("status");

        try {

            dao.updateStatus(applicationId, status);

            resp.sendRedirect(
                    req.getContextPath() + "/employer-applications");

        } catch (SQLException e) {

            throw new ServletException(e);

        }

    }

}