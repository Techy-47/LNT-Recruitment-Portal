package com.lnt.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(urlPatterns = {"/employer/*"})
public class EmployerAuthFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        String uri = req.getRequestURI();

        boolean publicRoute = uri.endsWith("/employer/login")
                || uri.endsWith("/employer/register")
                || uri.endsWith("/employer/login.jsp")
                || uri.endsWith("/employer/register.jsp");

        if (publicRoute) {
            chain.doFilter(request, response);
            return;
        }

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("employerId") == null) {
            resp.sendRedirect(req.getContextPath() + "/employer/login");
            return;
        }

        chain.doFilter(request, response);
    }
}
