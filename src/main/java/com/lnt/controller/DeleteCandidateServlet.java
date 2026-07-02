package com.lnt.controller;

import com.lnt.dao.CandidateDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/admin/delete-candidate")
public class DeleteCandidateServlet extends HttpServlet {

    private final CandidateDAO candidateDAO = new CandidateDAO();

    @Override
    protected void doPost(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null ||
                session.getAttribute("adminId") == null) {

            resp.sendRedirect(req.getContextPath() + "/admin/login");
            return;
        }

        String id = req.getParameter("candidateId");

        if (id == null || id.isBlank()) {

            resp.sendRedirect(req.getContextPath() + "/admin/candidates");
            return;
        }

        try {

            long candidateId = Long.parseLong(id);

            boolean deleted = candidateDAO.deleteCandidateCompletely(candidateId);

            if (deleted) {

                session.setAttribute(
                        "success",
                        "Candidate deleted successfully.");

            } else {

                session.setAttribute(
                        "error",
                        "Candidate not found.");

            }

            resp.sendRedirect(
                    req.getContextPath() + "/admin/candidates");

        } catch (NumberFormatException | SQLException e) {

            throw new ServletException(e);

        }

    }
}