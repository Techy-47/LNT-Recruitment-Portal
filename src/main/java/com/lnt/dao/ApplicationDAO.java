package com.lnt.dao;

import com.lnt.model.Application;
import com.lnt.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ApplicationDAO {

    public boolean apply(Application application) throws SQLException {

        String sql = """
                INSERT INTO applications
                (candidate_id, job_id, status, applied_at)
                VALUES (?, ?, 'Applied', NOW())
                """;

        try (
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setLong(1, application.getCandidateId());
            ps.setLong(2, application.getJobId());

            return ps.executeUpdate() > 0;
        }
    }

    public boolean alreadyApplied(long candidateId, long jobId) throws SQLException {

        String sql = """
                SELECT application_id
                FROM applications
                WHERE candidate_id = ?
                AND job_id = ?
                """;

        try (
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setLong(1, candidateId);
            ps.setLong(2, jobId);

            return ps.executeQuery().next();
        }
    }

    public List<Application> findByCandidateId(long candidateId) throws SQLException {

        String sql = """
                SELECT application_id,
                       candidate_id,
                       job_id,
                       status,
                       applied_at
                FROM applications
                WHERE candidate_id = ?
                ORDER BY applied_at DESC
                """;

        try (
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setLong(1, candidateId);

            try (ResultSet rs = ps.executeQuery()) {

                List<Application> list = new ArrayList<>();

                while (rs.next()) {

                    Application a = new Application();

                    a.setApplicationId(rs.getLong("application_id"));
                    a.setCandidateId(rs.getLong("candidate_id"));
                    a.setJobId(rs.getLong("job_id"));
                    a.setStatus(rs.getString("status"));

                    list.add(a);
                }

                return list;
            }
        }
    }

    public List<Application> findByEmployerId(long employerId) throws SQLException {

        String sql = """
                SELECT
                    a.application_id,
                    a.candidate_id,
                    a.job_id,
                    a.status,
                    a.applied_at,

                    c.full_name,
                    c.resume_path,

                    j.title

                FROM applications a

                JOIN candidates c
                    ON a.candidate_id = c.candidate_id

                JOIN jobs j
                    ON a.job_id = j.job_id

                WHERE j.employer_id = ?

                ORDER BY a.applied_at DESC
                """;

        try (
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setLong(1, employerId);

            try (ResultSet rs = ps.executeQuery()) {

                List<Application> list = new ArrayList<>();

                while (rs.next()) {

                    Application app = new Application();

                    app.setApplicationId(
                            rs.getLong("application_id"));

                    app.setCandidateId(
                            rs.getLong("candidate_id"));

                    app.setJobId(
                            rs.getLong("job_id"));

                    app.setStatus(
                            rs.getString("status"));

                    app.setCandidateName(
                            rs.getString("full_name"));

                    app.setJobTitle(
                            rs.getString("title"));

                    app.setResumePath(
                            rs.getString("resume_path"));

                    list.add(app);
                }

                return list;
            }
        }
    }

    public boolean updateStatus(long applicationId,
            String status)
            throws SQLException {

        String sql = """
                UPDATE applications
                SET status = ?
                WHERE application_id = ?
                """;

        try (
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setLong(2, applicationId);

            return ps.executeUpdate() > 0;
        }
    }

    public int countApplications(long employerId) throws SQLException {

        String sql = """
                SELECT COUNT(*)
                FROM applications a
                JOIN jobs j
                     ON a.job_id = j.job_id
                WHERE j.employer_id = ?
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

    public int countAllApplications() throws SQLException {

    String sql = """
            SELECT COUNT(*)
            FROM applications
            """;

    try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
    ) {

        if (rs.next()) {
            return rs.getInt(1);
        }

        return 0;
    }
}
}