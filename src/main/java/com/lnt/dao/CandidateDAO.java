package com.lnt.dao;

import com.lnt.model.Candidate;
import com.lnt.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CandidateDAO {

    public boolean existsByEmail(String email) throws SQLException {
        String sql = "SELECT candidate_id FROM candidates WHERE email = ?";
        try (Connection c = DBConnection.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }

    public boolean create(Candidate candidate) throws SQLException {
        String sql = "INSERT INTO candidates (full_name, email, password_hash, phone, education, skills, resume_path, created_at) VALUES (?,?,?,?,?,?,?,NOW())";
        try (Connection c = DBConnection.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, candidate.getFullName());
            ps.setString(2, candidate.getEmail());
            ps.setString(3, candidate.getPasswordHash());
            ps.setString(4, candidate.getPhone());
            ps.setString(5, candidate.getEducation());
            ps.setString(6, candidate.getSkills());
            ps.setString(7, candidate.getResumePath());
            int rows = ps.executeUpdate();
            return rows > 0;
        }
    }

    public Candidate findByEmail(String email) throws SQLException {
        String sql = "SELECT candidate_id, full_name, email, password_hash, phone, education, skills, resume_path, created_at FROM candidates WHERE email = ?";
        try (Connection c = DBConnection.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Candidate candidate = new Candidate();
                    candidate.setCandidateId(rs.getLong("candidate_id"));
                    candidate.setFullName(rs.getString("full_name"));
                    candidate.setEmail(rs.getString("email"));
                    candidate.setPasswordHash(rs.getString("password_hash"));
                    candidate.setPhone(rs.getString("phone"));
                    candidate.setEducation(rs.getString("education"));
                    candidate.setSkills(rs.getString("skills"));
                    candidate.setResumePath(rs.getString("resume_path"));
                    return candidate;
                }
                return null;
            }
        }
    }

    public Candidate findById(long candidateId) throws SQLException {

        String sql = """
                SELECT *
                FROM candidates
                WHERE candidate_id = ?
                """;

        try (
                Connection c = DBConnection.getConnection();
                PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setLong(1, candidateId);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    Candidate candidate = new Candidate();

                    candidate.setCandidateId(
                            rs.getLong("candidate_id"));

                    candidate.setFullName(
                            rs.getString("full_name"));

                    candidate.setEmail(
                            rs.getString("email"));

                    candidate.setPhone(
                            rs.getString("phone"));

                    candidate.setEducation(
                            rs.getString("education"));

                    candidate.setSkills(
                            rs.getString("skills"));

                    return candidate;
                }

                return null;
            }
        }
    }

    public boolean update(Candidate candidate)
            throws SQLException {

        String sql = """
                UPDATE candidates
                SET full_name = ?,
                    phone = ?,
                    education = ?,
                    skills = ?
                WHERE candidate_id = ?
                """;

        try (
                Connection c = DBConnection.getConnection();
                PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setString(1, candidate.getFullName());
            ps.setString(2, candidate.getPhone());
            ps.setString(3, candidate.getEducation());
            ps.setString(4, candidate.getSkills());
            ps.setLong(5, candidate.getCandidateId());

            return ps.executeUpdate() > 0;
        }
    }

    public boolean updateResume(long candidateId, String resumePath)
            throws SQLException {

        String sql = """
                UPDATE candidates
                SET resume_path = ?
                WHERE candidate_id = ?
                """;

        try (
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, resumePath);
            ps.setLong(2, candidateId);

            return ps.executeUpdate() > 0;
        }
    }

    public int countCandidates() throws SQLException {

        String sql = """
                SELECT COUNT(*)
                FROM candidates
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

    public List<Candidate> findAll() throws SQLException {

        String sql = """
                SELECT candidate_id,
                       full_name,
                       email,
                       phone,
                       education,
                       skills
                FROM candidates
                ORDER BY candidate_id DESC
                """;

        try (
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            List<Candidate> list = new ArrayList<>();

            while (rs.next()) {

                Candidate c = new Candidate();

                c.setCandidateId(rs.getLong("candidate_id"));
                c.setFullName(rs.getString("full_name"));
                c.setEmail(rs.getString("email"));
                c.setPhone(rs.getString("phone"));
                c.setEducation(rs.getString("education"));
                c.setSkills(rs.getString("skills"));

                list.add(c);
            }

            return list;
        }
    }
}
