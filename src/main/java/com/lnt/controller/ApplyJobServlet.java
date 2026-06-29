package com.lnt.controller;

import com.lnt.dao.ApplicationDAO;
import com.lnt.model.Application;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/apply-job")
public class ApplyJobServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);
		if (session == null) {
			resp.sendRedirect(req.getContextPath() + "/jobs?msg=not_logged_in");
			return;
		}

		// extract candidateId from session, tolerant to Number or String
		Object candObj = session.getAttribute("candidateId");
		Long candidateId = null;
		if (candObj instanceof Number) {
			candidateId = ((Number) candObj).longValue();
		} else if (candObj instanceof String) {
			try {
				candidateId = Long.parseLong((String) candObj);
			} catch (NumberFormatException ignored) {
			}
		}

		if (candidateId == null) {
			resp.sendRedirect(req.getContextPath() + "/jobs?msg=not_logged_in");
			return;
		}

		String jobIdParam = req.getParameter("jobId");
		long jobId;
		try {
			jobId = Long.parseLong(jobIdParam);
		} catch (NumberFormatException e) {
			resp.sendRedirect(req.getContextPath() + "/jobs?msg=invalid_job");
			return;
		}

		ApplicationDAO dao = new ApplicationDAO();
		try {
			if (dao.alreadyApplied(candidateId, jobId)) {
				resp.sendRedirect(req.getContextPath() + "/jobs?msg=already_applied");
				return;
			}

			Application application = new Application();
			application.setCandidateId(candidateId);
			application.setJobId(jobId);
			application.setStatus("Applied");

			boolean inserted = dao.apply(application);
			if (inserted) {
				resp.sendRedirect(req.getContextPath() + "/jobs?msg=success");
			} else {
				resp.sendRedirect(req.getContextPath() + "/jobs?msg=error");
			}

		} catch (SQLException ex) {
			getServletContext().log("Error applying for job", ex);
			resp.sendRedirect(req.getContextPath() + "/jobs?msg=error");
		}
	}
}
