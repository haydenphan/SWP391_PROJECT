//package controller;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.io.PrintWriter;
//import DAO.LearnerCertificateDAO;
//import model.Certificate;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.util.List;
//
//@WebServlet(name = "LearnerCertificateServlet", urlPatterns = {"/learner-certificate"})
//public class LearnerCertificateServlet extends HttpServlet {
//
//    private LearnerCertificateDAO learnerCertificateDAO;
//
//    @Override
//    public void init() throws ServletException {
//        try {
//            // Update with your actual database connection details
//            String jdbcURL = "jdbc:mysql://localhost:3306/yourdatabase";
//            String jdbcUsername = "root";
//            String jdbcPassword = "password";
//
//            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
//            learnerCertificateDAO = new LearnerCertificateDAO(connection);
//        } catch (Exception e) {
//            throw new ServletException(e);
//        }
//    }
//
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//
//        try (PrintWriter out = response.getWriter()) {
//            int learnerID = Integer.parseInt(request.getParameter("learnerID"));
//            List<Certificate> certificates = learnerCertificateDAO.getCertificatesByLearnerId(learnerID);
//
//            request.setAttribute("certificates", certificates);
//            request.getRequestDispatcher("/WEB-INF/certificates.jsp").forward(request, response);
//        } catch (Exception e) {
//            throw new ServletException(e);
//        }
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    @Override
//    public String getServletInfo() {
//        return "Handles certificate retrieval for learners";
//    }
//}
