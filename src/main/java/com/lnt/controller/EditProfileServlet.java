package com.lnt.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.lnt.dao.CandidateDAO;
import com.lnt.model.Candidate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/edit-profile")
public class EditProfileServlet extends HttpServlet {

    private final CandidateDAO dao = new CandidateDAO();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null ||
                session.getAttribute("candidateId") == null) {

            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        Long candidateId =
                ((Number) session.getAttribute("candidateId")).longValue();

        try {

            Candidate candidate = dao.findById(candidateId);

            req.setAttribute("candidate", candidate);

            req.getRequestDispatcher("/candidate/edit-profile.jsp")
                    .forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}