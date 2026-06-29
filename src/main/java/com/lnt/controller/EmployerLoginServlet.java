package com.lnt.controller;

import com.lnt.dao.EmployerDAO;
import com.lnt.model.Employer;
import com.lnt.util.PasswordUtil;
import com.lnt.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "EmployerLoginServlet", urlPatterns = {"/employer/login"})
public class EmployerLoginServlet extends HttpServlet {
    private final EmployerDAO employerDAO = new EmployerDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/employer/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            Employer e = employerDAO.findByEmail(email);
            if (e != null && PasswordUtil.checkPassword(password, e.getPasswordHash())) {
                HttpSession session = SessionUtil.renewSession(req);
                SessionUtil.setAttributes(session, java.util.Map.of(
                        "employerId", e.getEmployerId(),
                        "employerName", e.getCompanyName()
                ));
                resp.sendRedirect(req.getContextPath() + "/employer-dashboard");
                return;
            }
            req.setAttribute("error", "Invalid credentials");
            req.getRequestDispatcher("/employer/login.jsp").forward(req, resp);
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
}
