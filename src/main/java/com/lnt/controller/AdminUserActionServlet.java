package com.lnt.controller;

import com.lnt.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "AdminUserActionServlet", urlPatterns = {"/admin/users/action"})
public class AdminUserActionServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("adminId") == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/login");
            return;
        }

        String type = req.getParameter("type"); // candidate or employer
        String action = req.getParameter("action"); // activate, deactivate, delete
        String id = req.getParameter("id");

        if (type == null || action == null || id == null) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        if (!"candidate".equals(type) && !"employer".equals(type)) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        String table = "candidate".equals(type) ? "candidates" : "employers";
        String idColumn = "candidate".equals(type) ? "candidate_id" : "employer_id";

        try (Connection c = DBConnection.getConnection()) {
            if ("delete".equals(action)) {
                String sql = "DELETE FROM " + table + " WHERE " + idColumn + " = ?";
                try (PreparedStatement ps = c.prepareStatement(sql)) {
                    ps.setLong(1, Long.parseLong(id));
                    ps.executeUpdate();
                }
            } else if ("activate".equals(action) || "deactivate".equals(action)) {
                int val = "activate".equals(action) ? 1 : 0;
                String sql = "UPDATE " + table + " SET active = ? WHERE " + idColumn + " = ?";
                try (PreparedStatement ps = c.prepareStatement(sql)) {
                    ps.setInt(1, val);
                    ps.setLong(2, Long.parseLong(id));
                    ps.executeUpdate();
                }
            }
            resp.sendRedirect(req.getContextPath() + "/admin/users");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
