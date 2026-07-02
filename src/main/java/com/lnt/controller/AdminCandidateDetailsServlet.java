package com.lnt.controller;

import com.lnt.dao.CandidateDAO;
import com.lnt.model.Candidate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/admin/candidate")
public class AdminCandidateDetailsServlet extends HttpServlet {

    private final CandidateDAO dao = new CandidateDAO();

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null ||
                session.getAttribute("adminId") == null) {

            resp.sendRedirect(req.getContextPath() + "/admin/login");
            return;
        }

        String id = req.getParameter("id");

        if (id == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/candidates");
            return;
        }

        try {

            Candidate candidate =
                    dao.findById(Long.parseLong(id));

            if (candidate == null) {
                resp.sendRedirect(req.getContextPath() + "/admin/candidates");
                return;
            }

            req.setAttribute("candidate", candidate);

            req.getRequestDispatcher("/admin/candidate-details.jsp")
                    .forward(req, resp);

        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}