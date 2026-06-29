package com.lnt.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "LogoutServlet", urlPatterns = {"/logout"})
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession(false) != null) {
            req.getSession(false).invalidate();
        }

        String redirect = req.getContextPath() + "/login";
        String referer = req.getHeader("Referer");
        if (referer != null && referer.contains("/admin/")) {
            redirect = req.getContextPath() + "/admin/login";
        } else if (referer != null && referer.contains("/employer/")) {
            redirect = req.getContextPath() + "/employer/login";
        }

        resp.sendRedirect(redirect);
    }
}
