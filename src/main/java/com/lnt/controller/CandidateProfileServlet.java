package com.lnt.controller;

import com.lnt.dao.CandidateDAO;
import com.lnt.model.Candidate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/candidate-profile")
public class CandidateProfileServlet extends HttpServlet {

    private final CandidateDAO dao =
            new CandidateDAO();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session =
                req.getSession(false);

        Long candidateId =
                ((Number)session.getAttribute(
                        "candidateId"))
                        .longValue();

        try {

            Candidate candidate =
                    dao.findById(candidateId);

            req.setAttribute(
                    "candidate",
                    candidate);

            req.getRequestDispatcher(
                    "/candidate/profile.jsp")
                    .forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}