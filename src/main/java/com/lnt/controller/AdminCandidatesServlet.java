package com.lnt.controller;

import com.lnt.dao.CandidateDAO;
import com.lnt.model.Candidate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/admin/candidates")
public class AdminCandidatesServlet extends HttpServlet {

    private final CandidateDAO dao = new CandidateDAO();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null ||
                session.getAttribute("adminId") == null) {

            resp.sendRedirect(
                    req.getContextPath() + "/admin/login");

            return;
        }

        try {

            List<Candidate> candidates =
                    dao.findAll();

            req.setAttribute(
                    "candidates",
                    candidates);

            req.getRequestDispatcher(
                    "/admin/candidates.jsp")
                    .forward(req, resp);

        } catch (SQLException e) {

            throw new ServletException(e);

        }
    }
}