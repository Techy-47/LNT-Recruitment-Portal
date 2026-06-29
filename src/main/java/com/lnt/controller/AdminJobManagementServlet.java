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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AdminJobManagementServlet", urlPatterns = {"/admin/jobs"})
public class AdminJobManagementServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("adminId") == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/login");
            return;
        }

        try (Connection c = DBConnection.getConnection()) {
            List<Map<String, Object>> jobs = new ArrayList<>();
            try (PreparedStatement ps = c.prepareStatement("SELECT job_id, title, employer_id, active, created_at FROM jobs")) {
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        Map<String, Object> r = new HashMap<>();
                        r.put("job_id", rs.getLong("job_id"));
                        r.put("title", rs.getString("title"));
                        r.put("employer_id", rs.getLong("employer_id"));
                        r.put("active", rs.getInt("active"));
                        r.put("created_at", rs.getTimestamp("created_at"));
                        jobs.add(r);
                    }
                }
            }
            req.setAttribute("jobs", jobs);
            req.getRequestDispatcher("/admin/jobs.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("adminId") == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/login");
            return;
        }

        String action = req.getParameter("action");
        String id = req.getParameter("id");
        if (action == null || id == null) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        try (Connection c = DBConnection.getConnection()) {
            if ("delete".equals(action)) {
                try (PreparedStatement ps = c.prepareStatement("DELETE FROM jobs WHERE job_id = ?")) {
                    ps.setLong(1, Long.parseLong(id));
                    ps.executeUpdate();
                }
            } else if ("deactivate".equals(action) || "activate".equals(action)) {
                int val = "activate".equals(action) ? 1 : 0;
                try (PreparedStatement ps = c.prepareStatement("UPDATE jobs SET active = ? WHERE job_id = ?")) {
                    ps.setInt(1, val);
                    ps.setLong(2, Long.parseLong(id));
                    ps.executeUpdate();
                }
            }
            resp.sendRedirect(req.getContextPath() + "/admin/jobs");
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
