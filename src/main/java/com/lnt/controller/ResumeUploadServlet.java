package com.lnt.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.UUID;

import com.lnt.dao.CandidateDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/upload-resume")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 10 * 1024 * 1024)
public class ResumeUploadServlet extends HttpServlet {

        private final CandidateDAO dao = new CandidateDAO();

        @Override
        protected void doPost(HttpServletRequest req,
                        HttpServletResponse resp)
                        throws ServletException, IOException {

                HttpSession session = req.getSession(false);

                if (session == null ||
                                session.getAttribute("candidateId") == null) {

                        resp.sendRedirect(req.getContextPath() + "/auth/login.jsp");
                        return;
                }

                long candidateId = ((Number) session.getAttribute("candidateId")).longValue();

                Part filePart = req.getPart("resume");

                if (filePart == null) {

                        resp.sendRedirect(
                                        req.getContextPath()
                                                        + "/candidate/upload-resume.jsp?msg=error");
                        return;
                }

                String originalFile = Paths.get(filePart.getSubmittedFileName())
                                .getFileName()
                                .toString();

                if (!originalFile.toLowerCase().endsWith(".pdf")) {

                        resp.sendRedirect(
                                        req.getContextPath()
                                                        + "/candidate/upload-resume.jsp?msg=invalid");
                        return;
                }

                String uploads ="C:\\RecruitmentPortalUploads\\resumes";
                System.out.println("Upload Path = " + uploads);

                File dir = new File(uploads);

                System.out.println("Absolute Path = " + dir.getAbsolutePath());

                if (!dir.exists()) {
                        dir.mkdirs();
                }

                String filename = UUID.randomUUID()
                                + ".pdf";

                filePart.write(
                                uploads + File.separator + filename);

                String dbPath = filename;

                try {

                        dao.updateResume(candidateId, dbPath);

                        resp.sendRedirect(
                                        req.getContextPath()
                                                        + "/candidate/upload-resume.jsp?msg=success");

                } catch (SQLException e) {

                        throw new ServletException(e);
                }

        }

}