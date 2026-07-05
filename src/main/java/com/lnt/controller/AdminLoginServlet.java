package com.lnt.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.lnt.dao.AdminDAO;
import com.lnt.model.Admin;
import com.lnt.util.PasswordUtil;
import com.lnt.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "AdminLoginServlet", urlPatterns = {"/admin/login"})
public class AdminLoginServlet extends HttpServlet {
    private final AdminDAO adminDAO = new AdminDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/admin/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try {
            Admin a = adminDAO.findByUsername(username);
            if (a != null && PasswordUtil.checkPassword(password, a.getPasswordHash())) {
                HttpSession session = SessionUtil.renewSession(req);
                SessionUtil.setAttributes(session, java.util.Map.of(
                        "adminId", a.getAdminId(),
                        "adminUser", a.getUsername()
                ));
                resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
                return;
            }
            req.setAttribute("error", "Invalid credentials");
            req.getRequestDispatcher("/admin/login.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
