package com.lnt.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.lnt.dao.EmployerDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/delete-employer")
public class DeleteEmployerServlet extends HttpServlet {

    private final EmployerDAO employerDAO = new EmployerDAO();

    @Override
    protected void doPost(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null ||
                session.getAttribute("adminId") == null) {

            resp.sendRedirect(req.getContextPath() + "/admin/login");
            return;
        }

        String id = req.getParameter("employerId");

        if (id == null || id.isBlank()) {

            resp.sendRedirect(req.getContextPath() + "/admin/employers");
            return;
        }

        try {

            long employerId = Long.parseLong(id);

            boolean deleted = employerDAO.deleteEmployerCompletely(employerId);

            if (deleted) {

                session.setAttribute(
                        "success",
                        "Employer deleted successfully.");

            } else {

                session.setAttribute(
                        "error",
                        "Employer not found.");

            }

            resp.sendRedirect(
                    req.getContextPath() + "/admin/employers");

        } catch (SQLException e) {

            throw new ServletException(e);

        } catch (NumberFormatException e) {

            resp.sendRedirect(
                    req.getContextPath() + "/admin/employers");

        }

    }

}
