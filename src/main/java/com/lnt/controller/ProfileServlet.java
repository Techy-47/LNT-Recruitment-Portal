package com.lnt.controller;

import com.lnt.dao.CandidateDAO;
import com.lnt.model.Candidate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

    private final CandidateDAO dao = new CandidateDAO();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        Long candidateId =
                (Long) session.getAttribute("candidateId");

        try {

            Candidate candidate =
                    dao.findById(candidateId);

            req.setAttribute("candidate", candidate);

            req.getRequestDispatcher(
                    "/candidate/profile.jsp")
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

        Long candidateId =
                (Long) session.getAttribute("candidateId");

        try {

            Candidate candidate =
                    dao.findById(candidateId);

            candidate.setFullName(
                    req.getParameter("fullName"));

            candidate.setPhone(
                    req.getParameter("phone"));

            candidate.setEducation(
                    req.getParameter("education"));

            candidate.setSkills(
                    req.getParameter("skills"));

            dao.update(candidate);

            session.setAttribute(
                    "candidateName",
                    candidate.getFullName());

            resp.sendRedirect(
                    req.getContextPath()
                    + "/profile?success=1");

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}