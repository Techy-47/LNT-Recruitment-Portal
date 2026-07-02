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

    public List<Job> searchJobs(String title,
            String location,
            String skills,
            String salary) throws SQLException {

        String sql = """
                SELECT *
                FROM jobs
                WHERE active = 1
                  AND title LIKE ?
                  AND location LIKE ?
                  AND skills_required LIKE ?
                  AND salary LIKE ?
                ORDER BY created_at DESC
                """;

        try (
                Connection c = DBConnection.getConnection();
                PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setString(1, "%" + (title == null ? "" : title.trim()) + "%");
            ps.setString(2, "%" + (location == null ? "" : location.trim()) + "%");
            ps.setString(3, "%" + (skills == null ? "" : skills.trim()) + "%");
            ps.setString(4, "%" + (salary == null ? "" : salary.trim()) + "%");

            try (ResultSet rs = ps.executeQuery()) {

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

                    Timestamp deadline = rs.getTimestamp("deadline");
                    if (deadline != null) {
                        j.setDeadline(deadline.toLocalDateTime());
                    }

                    jobs.add(j);
                }

                return jobs;
            }
        }
    }

    public List<String> getAllSkills() throws SQLException {

        String sql = "SELECT DISTINCT skills_required FROM jobs WHERE skills_required IS NOT NULL";

        List<String> skills = new ArrayList<>();

        try (
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                String value = rs.getString("skills_required");

                if (value == null)
                    continue;

                String[] arr = value.split(",");

                for (String s : arr) {

                    s = s.trim();

                    if (!s.isEmpty() && !skills.contains(s)) {
                        skills.add(s);
                    }
                }
            }
        }

        skills.sort(String::compareToIgnoreCase);

        return skills;
    }

    public List<String> getAllLocations() throws SQLException {

        String sql = "SELECT DISTINCT location FROM jobs WHERE location IS NOT NULL ORDER BY location";

        List<String> locations = new ArrayList<>();

        try (
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                locations.add(rs.getString("location"));
            }
        }

        return locations;
    }

    public Job findById(long jobId) throws SQLException {

        String sql = """
                SELECT *
                FROM jobs
                WHERE job_id = ?
                """;

        try (
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setLong(1, jobId);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    Job job = new Job();

                    job.setJobId(rs.getLong("job_id"));
                    job.setEmployerId(rs.getLong("employer_id"));
                    job.setTitle(rs.getString("title"));
                    job.setDescription(rs.getString("description"));
                    job.setLocation(rs.getString("location"));
                    job.setSalary(rs.getString("salary"));
                    job.setSkillsRequired(rs.getString("skills_required"));
                    job.setExperienceRequired(rs.getString("experience_required"));

                    Timestamp deadline = rs.getTimestamp("deadline");
                    if (deadline != null) {
                        job.setDeadline(deadline.toLocalDateTime());
                    }

                    return job;
                }

                return null;
            }
        }
    }

    public boolean update(Job job) throws SQLException {

        String sql = """
                UPDATE jobs
                SET title = ?,
                    description = ?,
                    location = ?,
                    salary = ?,
                    skills_required = ?,
                    experience_required = ?,
                    deadline = ?
                WHERE job_id = ?
                """;

        try (
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, job.getTitle());
            ps.setString(2, job.getDescription());
            ps.setString(3, job.getLocation());
            ps.setString(4, job.getSalary());
            ps.setString(5, job.getSkillsRequired());
            ps.setString(6, job.getExperienceRequired());
            ps.setObject(7, job.getDeadline());
            ps.setLong(8, job.getJobId());

            return ps.executeUpdate() > 0;
        }
    }

    public boolean delete(long jobId) throws SQLException {

        String sql = """
                DELETE FROM jobs
                WHERE job_id = ?
                """;

        try (
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setLong(1, jobId);

            return ps.executeUpdate() > 0;
        }
    }

    public boolean delete(long jobId, long employerId)
            throws SQLException {

        String sql = """
                DELETE FROM jobs
                WHERE job_id = ?
                AND employer_id = ?
                """;

        try (
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setLong(1, jobId);
            ps.setLong(2, employerId);

            return ps.executeUpdate() > 0;
        }
    }
}
