package com.lnt.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.lnt.dao.JobDAO;
import com.lnt.model.Job;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "AdminJobManagementServlet", urlPatterns = { "/admin/jobs" })
public class AdminJobManagementServlet extends HttpServlet {
    private final JobDAO jobDAO = new JobDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("adminId") == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/login");
            return;
        }

        try {

            List<Job> jobs = jobDAO.findAll();
            req.setAttribute("jobs", jobs); 

            req.setAttribute("totalJobs", jobs.size());

            req.getRequestDispatcher("/admin/jobs.jsp")
                    .forward(req, resp);

        } catch (SQLException e) {

            throw new ServletException(e);

        }
    }

    @Override
    protected void doPost(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

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

        try {

            long jobId = Long.parseLong(id);

            switch (action) {

                case "activate":

                    if (jobDAO.updateActiveStatus(jobId, true)) {
                        session.setAttribute("success", "Job activated successfully.");
                    } else {
                        session.setAttribute("error", "Unable to activate job.");
                    }
                    break;

                case "deactivate":

                    if (jobDAO.updateActiveStatus(jobId, false)) {
                        session.setAttribute("success", "Job deactivated successfully.");
                    } else {
                        session.setAttribute("error", "Unable to deactivate job.");
                    }
                    break;

                case "delete":

                    if (jobDAO.delete(jobId)) {
                        session.setAttribute("success", "Job deleted successfully.");
                    } else {
                        session.setAttribute("error", "Unable to delete job.");
                    }
                    break;

                default:
                    resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
                    return;
            }

            resp.sendRedirect(req.getContextPath() + "/admin/jobs");

        } catch (SQLException e) {

            throw new ServletException(e);

        }
    }
}
