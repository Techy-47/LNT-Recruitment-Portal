package com.lnt.controller;

import com.lnt.dao.EmployerDAO;
import com.lnt.model.Employer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "EmployerRegisterServlet", urlPatterns = {"/employer/register"})
public class EmployerRegisterServlet extends HttpServlet {
    private final EmployerDAO employerDAO = new EmployerDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/employer/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String companyName = req.getParameter("companyName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String industry = req.getParameter("industry");
        String website = req.getParameter("website");

        if (password == null || password.length() < 8) {
            req.setAttribute("error", "Password must be at least 8 characters");
            req.getRequestDispatcher("/employer/register.jsp").forward(req, resp);
            return;
        }

        try {
            if (employerDAO.existsByEmail(email)) {
                req.setAttribute("error", "Email already registered");
                req.getRequestDispatcher("/employer/register.jsp").forward(req, resp);
                return;
            }

            Employer e = new Employer();
            e.setCompanyName(companyName);
            e.setEmail(email);
            e.setPasswordHash(com.lnt.util.PasswordUtil.hashPassword(password));
            e.setIndustry(industry);
            e.setWebsite(website);

            boolean ok = employerDAO.create(e);
            if (ok) {
                resp.sendRedirect(req.getContextPath() + "/employer/login.jsp");
            } else {
                req.setAttribute("error", "Registration failed");
                req.getRequestDispatcher("/employer/register.jsp").forward(req, resp);
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
}
