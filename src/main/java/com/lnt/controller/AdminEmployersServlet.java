package com.lnt.controller;

import com.lnt.dao.EmployerDAO;
import com.lnt.model.Employer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin/employers")
public class AdminEmployersServlet extends HttpServlet {

    private final EmployerDAO dao = new EmployerDAO();

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null ||
                session.getAttribute("adminId") == null) {

            resp.sendRedirect(
                    req.getContextPath() + "/admin/login");

            return;
        }

        try {

            List<Employer> employers = dao.findAll();

            req.setAttribute(
                    "employers",
                    employers);

            req.getRequestDispatcher(
                    "/admin/employers.jsp")
                    .forward(req, resp);

        } catch (SQLException e) {

            throw new ServletException(e);

        }

    }

}