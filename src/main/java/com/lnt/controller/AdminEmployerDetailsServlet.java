package com.lnt.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.lnt.dao.EmployerDAO;
import com.lnt.model.Employer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/employer")
public class AdminEmployerDetailsServlet extends HttpServlet {

    private final EmployerDAO dao = new EmployerDAO();

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null ||
                session.getAttribute("adminId") == null) {

            resp.sendRedirect(req.getContextPath() + "/admin/login");
            return;
        }

        String id = req.getParameter("id");

        if (id == null || id.isBlank()) {

            resp.sendRedirect(req.getContextPath() + "/admin/employers");
            return;
        }

        try {

            Employer employer = dao.findById(Long.parseLong(id));

            if (employer == null) {

                resp.sendRedirect(req.getContextPath() + "/admin/employers");
                return;
            }

            req.setAttribute("employer", employer);

            req.getRequestDispatcher("/admin/employer-details.jsp")
                    .forward(req, resp);

        } catch (SQLException e) {

            throw new ServletException(e);

        } catch (NumberFormatException e) {

            resp.sendRedirect(req.getContextPath() + "/admin/employers");

        }

    }

}