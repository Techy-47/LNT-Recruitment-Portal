package com.lnt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import com.lnt.dao.ApplicationDAO;
import com.lnt.dao.CandidateDAO;
import com.lnt.dao.EmployerDAO;
import com.lnt.dao.JobDAO;
import com.lnt.util.DBConnection;
import com.lnt.util.ReportCsvUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "AdminReportServlet", urlPatterns = { "/admin/reports" })
public class AdminReportServlet extends HttpServlet {
    private final CandidateDAO candidateDAO = new CandidateDAO();
    private final EmployerDAO employerDAO = new EmployerDAO();
    private final JobDAO jobDAO = new JobDAO();
    private final ApplicationDAO applicationDAO = new ApplicationDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        if (type == null || type.isBlank()) {

            try {

                req.setAttribute("candidateCount", candidateDAO.countAllCandidates());
                req.setAttribute("employerCount", employerDAO.countAllEmployers());
                req.setAttribute("jobCount", jobDAO.countAllJobs());
                req.setAttribute("applicationCount", applicationDAO.countAllApplications());
                req.setAttribute("rejectedCount", applicationDAO.countRejectedApplications());
                req.setAttribute("shortlistedCount", applicationDAO.countShortlistedApplications());
                req.setAttribute("appliedCount", applicationDAO.countAppliedApplications());
                req.setAttribute("underReviewCount", applicationDAO.countUnderReviewApplications());
                req.setAttribute("shortlistedCount", applicationDAO.countShortlistedApplications());
                req.setAttribute("interviewCount", applicationDAO.countInterviewScheduledApplications());
                req.setAttribute("selectedCount", applicationDAO.countSelectedApplications());
                req.setAttribute("rejectedCount", applicationDAO.countRejectedApplications());

            } catch (SQLException e) {

                throw new ServletException(e);

            }

            req.getRequestDispatcher("/admin/reports.jsp").forward(req, resp);

            return;
        }

        String sql = getQueryForType(type);
        if (sql == null) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unsupported report type");
            return;
        }

        resp.setContentType("text/csv");
        resp.setCharacterEncoding("UTF-8");
        resp.setHeader("Content-Disposition", "attachment; filename=\"" + type + "_report.csv\"");

        try (Connection c = DBConnection.getConnection();
                PreparedStatement ps = c.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                PrintWriter out = resp.getWriter()) {

            writeCsv(rs, out);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private String getQueryForType(String type) {
        return switch (type) {
            case "candidates" ->
                "SELECT candidate_id, full_name, email, phone, education, skills, active, created_at FROM candidates ORDER BY candidate_id";
            case "employers" ->
                "SELECT employer_id, company_name, email, industry, website, active, created_at FROM employers ORDER BY employer_id";
            case "jobs" ->
                "SELECT job_id, employer_id, title, location, salary, skills_required, experience_required, deadline, active, created_at FROM jobs ORDER BY job_id";
            case "applications" ->
                "SELECT application_id, candidate_id, job_id, status, applied_at FROM applications ORDER BY application_id";
            default -> null;
        };
    }

    private void writeCsv(ResultSet rs, PrintWriter out) throws SQLException {
        ResultSetMetaData md = rs.getMetaData();
        int cols = md.getColumnCount();

        for (int i = 1; i <= cols; i++) {
            out.print(ReportCsvUtil.escape(md.getColumnLabel(i)));
            if (i < cols)
                out.print(',');
        }
        out.println();

        while (rs.next()) {
            for (int i = 1; i <= cols; i++) {
                Object val = rs.getObject(i);
                out.print(ReportCsvUtil.escape(val == null ? "" : String.valueOf(val)));
                if (i < cols)
                    out.print(',');
            }
            out.println();
        }
    }
}
