package com.lnt.controller;

import com.lnt.dao.CandidateDAO;
import com.lnt.model.Candidate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "RegisterServlet", urlPatterns = { "/register" })
public class RegisterServlet extends HttpServlet {

    private final CandidateDAO candidateDAO = new CandidateDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/auth/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");
        String education = req.getParameter("education");
        String skills = req.getParameter("skills");

        if (password == null || password.length() < 8) {
            req.setAttribute("error", "Password must be at least 8 characters");
            req.getRequestDispatcher("/auth/register.jsp").forward(req, resp);
            return;
        }

        try {
            if (candidateDAO.existsByEmail(email)) {
                req.setAttribute("error", "Email already registered");
                req.getRequestDispatcher("/auth/register.jsp").forward(req, resp);
                return;
            }

            Candidate c = new Candidate();
            c.setFullName(fullName);
            c.setEmail(email);
            c.setPasswordHash(com.lnt.util.PasswordUtil.hashPassword(password));
            c.setPhone(phone);
            c.setEducation(education);
            c.setSkills(skills);

            System.out.println("Trying to register: " + email);

            boolean ok = candidateDAO.create(c);

            System.out.println("Registration Result = " + ok);
            if (ok) {
                resp.sendRedirect(req.getContextPath() + "/auth/login.jsp");
            } else {
                req.setAttribute("error", "Registration failed");
                req.getRequestDispatcher("/auth/register.jsp").forward(req, resp);
            }
        } catch (SQLException e) {
            e.printStackTrace();

            resp.setContentType("text/plain");
            resp.getWriter().println("SQL ERROR:");
            resp.getWriter().println(e.getMessage());

            return;
        }
    }
}
