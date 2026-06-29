package com.lnt.dao;

import com.lnt.model.Employer;
import com.lnt.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EmployerDAO {

    public boolean existsByEmail(String email) throws SQLException {
        String sql = "SELECT employer_id FROM employers WHERE email = ?";
        try (Connection c = DBConnection.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }

    public boolean create(Employer employer) throws SQLException {
        String sql = "INSERT INTO employers (company_name, email, password_hash, industry, website, created_at) VALUES (?,?,?,?,?,NOW())";
        try (Connection c = DBConnection.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, employer.getCompanyName());
            ps.setString(2, employer.getEmail());
            ps.setString(3, employer.getPasswordHash());
            ps.setString(4, employer.getIndustry());
            ps.setString(5, employer.getWebsite());
            int rows = ps.executeUpdate();
            return rows > 0;
        }
    }

    public Employer findByEmail(String email) throws SQLException {
        String sql = "SELECT employer_id, company_name, email, password_hash, industry, website FROM employers WHERE email = ?";
        try (Connection c = DBConnection.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Employer e = new Employer();
                    e.setEmployerId(rs.getLong("employer_id"));
                    e.setCompanyName(rs.getString("company_name"));
                    e.setEmail(rs.getString("email"));
                    e.setPasswordHash(rs.getString("password_hash"));
                    e.setIndustry(rs.getString("industry"));
                    e.setWebsite(rs.getString("website"));
                    return e;
                }
                return null;
            }
        }
    }

    public int countEmployers() throws SQLException {

        String sql = """
                SELECT COUNT(*)
                FROM employers
                """;

        try (
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1);
            }

            return 0;
        }
    }
}
