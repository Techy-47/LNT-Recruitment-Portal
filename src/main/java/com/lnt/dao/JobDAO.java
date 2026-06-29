package com.lnt.dao;

import com.lnt.model.Job;
import com.lnt.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class JobDAO {

    public boolean create(Job job) throws SQLException {
        String sql = "INSERT INTO jobs (employer_id, title, description, location, salary, skills_required, experience_required, deadline, created_at) VALUES (?,?,?,?,?,?,?,?,NOW())";
        try (Connection c = DBConnection.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setLong(1, job.getEmployerId());
            ps.setString(2, job.getTitle());
            ps.setString(3, job.getDescription());
            ps.setString(4, job.getLocation());
            ps.setString(5, job.getSalary());
            ps.setString(6, job.getSkillsRequired());
            ps.setString(7, job.getExperienceRequired());
            ps.setObject(8, job.getDeadline());
            int rows = ps.executeUpdate();
            return rows > 0;
        }
    }

    public List<Job> findByEmployerId(long employerId) throws SQLException {
        String sql = "SELECT job_id, employer_id, title, description, location, salary, skills_required, experience_required, deadline FROM jobs WHERE employer_id = ?";
        try (Connection c = DBConnection.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setLong(1, employerId);
            try (ResultSet rs = ps.executeQuery()) {
                List<Job> list = new ArrayList<>();
                while (rs.next()) {
                    Job j = new Job();
                    j.setJobId(rs.getLong("job_id"));
                    j.setEmployerId(rs.getLong("employer_id"));
                    j.setTitle(rs.getString("title"));
                    j.setDescription(rs.getString("description"));
                    j.setLocation(rs.getString("location"));
                    j.setSalary(rs.getString("salary"));
                    j.setSkillsRequired(rs.getString("skills_required"));
                    j.setExperienceRequired(rs.getString("experience_required"));
                    Timestamp deadlineTs = rs.getTimestamp("deadline");
                    if (deadlineTs != null) {
                        j.setDeadline(deadlineTs.toLocalDateTime());
                    }
                    list.add(j);
                }
                return list;
            }
        }
    }

    public List<Job> findAllJobs() throws SQLException {
        String sql = "SELECT * FROM jobs ORDER BY created_at DESC";

        try (
                Connection c = DBConnection.getConnection();
                PreparedStatement ps = c.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            List<Job> jobs = new ArrayList<>();

            while (rs.next()) {
                Job job = new Job();

                job.setJobId(rs.getLong("job_id"));
                job.setEmployerId(rs.getLong("employer_id"));
                job.setTitle(rs.getString("title"));
                job.setDescription(rs.getString("description"));
                job.setLocation(rs.getString("location"));
                job.setSalary(rs.getString("salary"));
                job.setSkillsRequired(rs.getString("skills_required"));
                job.setExperienceRequired(rs.getString("experience_required"));

                jobs.add(job);
            }

            return jobs;
        }
    }

    public List<Job> findAll() throws SQLException {

        String sql = """
                SELECT job_id, employer_id, title, description,
                       location, salary, skills_required,
                       experience_required, deadline
                FROM jobs
                ORDER BY created_at DESC
                """;

        try (
                Connection c = DBConnection.getConnection();
                PreparedStatement ps = c.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            List<Job> jobs = new ArrayList<>();

            while (rs.next()) {

                Job j = new Job();

                j.setJobId(rs.getLong("job_id"));
                j.setEmployerId(rs.getLong("employer_id"));
                j.setTitle(rs.getString("title"));
                j.setDescription(rs.getString("description"));
                j.setLocation(rs.getString("location"));
                j.setSalary(rs.getString("salary"));
                j.setSkillsRequired(rs.getString("skills_required"));
                j.setExperienceRequired(rs.getString("experience_required"));

                jobs.add(j);
            }

            return jobs;
        }
    }

    public int countJobs(long employerId) throws SQLException {

        String sql = """
                SELECT COUNT(*)
                FROM jobs
                WHERE employer_id = ?
                """;

        try (
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setLong(1, employerId);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    return rs.getInt(1);
                }

                return 0;
            }
        }
    }

    public int countAllJobs() throws SQLException {

        String sql = """
                SELECT COUNT(*)
                FROM jobs
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
