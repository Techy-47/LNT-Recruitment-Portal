package com.lnt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.lnt.model.Admin;
import com.lnt.util.DBConnection;

public class AdminDAO {

    public Admin findByUsername(String username) throws SQLException {
        String sql = "SELECT admin_id, username, password_hash FROM admins WHERE username = ?";
        try (Connection c = DBConnection.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Admin a = new Admin();
                    a.setAdminId(rs.getLong("admin_id"));
                    a.setUsername(rs.getString("username"));
                    a.setPasswordHash(rs.getString("password_hash"));
                    return a;
                }
                return null;
            }
        }
    }
}
