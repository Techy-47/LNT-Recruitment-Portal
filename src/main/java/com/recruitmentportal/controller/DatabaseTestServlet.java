package com.recruitmentportal.controller;

import com.recruitmentportal.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

@WebServlet("/test-db")
public class DatabaseTestServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        try {

            Connection conn =
                    DBConnection.getConnection();

            if (conn != null) {

                out.println("<h1>Database Connected Successfully!</h1>");

            } else {

                out.println("<h1>Database Connection Failed!</h1>");

            }

        } catch (Exception e) {

            out.println("<h1>Error : "
                    + e.getMessage()
                    + "</h1>");

        }
    }
}