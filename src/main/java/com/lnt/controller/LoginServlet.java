package com.lnt.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import com.lnt.dao.ApplicationDAO;
import com.lnt.dao.CandidateDAO;
import com.lnt.dao.JobDAO;
import com.lnt.model.Candidate;
import com.lnt.util.PasswordUtil;
import com.lnt.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    private final CandidateDAO candidateDAO = new CandidateDAO();
    private final JobDAO jobDAO = new JobDAO();
    private final ApplicationDAO applicationDAO = new ApplicationDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher("/auth/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req,
                          HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {

            Candidate candidate = candidateDAO.findByEmail(email);

            if (candidate != null &&
                    PasswordUtil.checkPassword(
                            password,
                            candidate.getPasswordHash())) {

                HttpSession session = SessionUtil.renewSession(req);

                SessionUtil.setAttributes(session, Map.of(
                        "candidateId", candidate.getCandidateId(),
                        "candidateName", candidate.getFullName()
                ));

                int totalJobs = jobDAO.countAllJobs();

                int totalApplications =
                        applicationDAO.findByCandidateId(
                                candidate.getCandidateId())
                                .size();

                req.setAttribute("totalJobs", totalJobs);
                req.setAttribute("totalApplications", totalApplications);

                resp.sendRedirect(req.getContextPath() + "/candidate/dashboard");

                return;
            }

            req.setAttribute("error", "Invalid credentials");
            req.getRequestDispatcher("/auth/login.jsp")
                    .forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}