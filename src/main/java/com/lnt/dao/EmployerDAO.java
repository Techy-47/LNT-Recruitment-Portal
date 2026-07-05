package com.lnt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lnt.model.Employer;
import com.lnt.util.DBConnection;

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

    public List<Employer> findAll() throws SQLException {

        String sql = """
                SELECT
                    employer_id,
                    company_name,
                    email,
                    industry,
                    website
                FROM employers
                ORDER BY employer_id DESC
                """;

        try (
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            List<Employer> list = new ArrayList<>();

            while (rs.next()) {

                Employer e = new Employer();

                e.setEmployerId(
                        rs.getLong("employer_id"));

                e.setCompanyName(
                        rs.getString("company_name"));

                e.setEmail(
                        rs.getString("email"));

                e.setIndustry(
                        rs.getString("industry"));

                e.setWebsite(
                        rs.getString("website"));

                list.add(e);
            }

            return list;
        }
    }

    public Employer findById(long employerId)
            throws SQLException {

        String sql = """
                SELECT
                    employer_id,
                    company_name,
                    email,
                    industry,
                    website
                FROM employers
                WHERE employer_id = ?
                """;

        try (
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setLong(1, employerId);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    Employer employer = new Employer();

                    employer.setEmployerId(
                            rs.getLong("employer_id"));

                    employer.setCompanyName(
                            rs.getString("company_name"));

                    employer.setEmail(
                            rs.getString("email"));

                    employer.setIndustry(
                            rs.getString("industry"));

                    employer.setWebsite(
                            rs.getString("website"));

                    return employer;
                }

                return null;
            }
        }
    }

    public boolean deleteEmployerCompletely(long employerId)
            throws SQLException {

        String deleteApplications = """
                DELETE a
                FROM applications a
                INNER JOIN jobs j
                        ON a.job_id = j.job_id
                WHERE j.employer_id = ?
                """;

        String deleteJobs = """
                DELETE FROM jobs
                WHERE employer_id = ?
                """;

        String deleteEmployer = """
                DELETE FROM employers
                WHERE employer_id = ?
                """;

        Connection con = null;

        try {

            con = DBConnection.getConnection();

            con.setAutoCommit(false);

            try (
                    PreparedStatement psApplications = con.prepareStatement(deleteApplications);

                    PreparedStatement psJobs = con.prepareStatement(deleteJobs);

                    PreparedStatement psEmployer = con.prepareStatement(deleteEmployer)) {

                psApplications.setLong(1, employerId);
                psApplications.executeUpdate();

                psJobs.setLong(1, employerId);
                psJobs.executeUpdate();

                psEmployer.setLong(1, employerId);

                int rows = psEmployer.executeUpdate();

                con.commit();

                return rows > 0;
            }

        } catch (SQLException e) {

            if (con != null) {
                con.rollback();
            }

            throw e;

        } finally {

            if (con != null) {

                con.setAutoCommit(true);

                con.close();

            }

        }
    }

    public int countAllEmployers() throws SQLException {

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
