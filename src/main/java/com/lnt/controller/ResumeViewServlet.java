package com.lnt.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet("/view-resume")
public class ResumeViewServlet extends HttpServlet {

    private static final String UPLOAD_DIR =
            "C:\\RecruitmentPortalUploads\\resumes";

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String fileName = request.getParameter("file");

        if (fileName == null || fileName.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST,
                    "Resume file not specified.");
            return;
        }

        // Prevent directory traversal attacks
        fileName = new File(fileName).getName();

        File resumeFile = new File(UPLOAD_DIR, fileName);

        if (!resumeFile.exists() || !resumeFile.isFile()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND,
                    "Resume not found.");
            return;
        }

        response.setContentType("application/pdf");
        response.setContentLengthLong(resumeFile.length());
        response.setHeader(
                "Content-Disposition",
                "inline; filename=\"" + fileName + "\""
        );

        try (FileInputStream fis = new FileInputStream(resumeFile);
             OutputStream os = response.getOutputStream()) {

            byte[] buffer = new byte[8192];
            int bytesRead;

            while ((bytesRead = fis.read(buffer)) != -1) {
                os.write(buffer, 0, bytesRead);
            }

            os.flush();
        }
    }
}