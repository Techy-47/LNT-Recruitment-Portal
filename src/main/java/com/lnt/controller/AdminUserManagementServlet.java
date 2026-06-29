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

@WebServlet(name = "AdminUserManagementServlet", urlPatterns = {"/admin/users"})
public class AdminUserManagementServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("adminId") == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/login");
            return;
        }

        try (Connection c = DBConnection.getConnection()) {
            req.setAttribute("candidates", listRows(c, "SELECT candidate_id, full_name, email, active FROM candidates"));
            req.setAttribute("employers", listRows(c, "SELECT employer_id, company_name, email, active FROM employers"));
            req.getRequestDispatcher("/admin/users.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private List<Map<String, Object>> listRows(Connection c, String sql) throws SQLException {
        try (PreparedStatement ps = c.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            List<Map<String, Object>> list = new ArrayList<>();
            int cols = rs.getMetaData().getColumnCount();
            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                for (int i = 1; i <= cols; i++) {
                    row.put(rs.getMetaData().getColumnLabel(i), rs.getObject(i));
                }
                list.add(row);
            }
            return list;
        }
    }
}
