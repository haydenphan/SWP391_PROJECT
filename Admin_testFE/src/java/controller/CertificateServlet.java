package controller;

import DAO.CertificateDAO;
import DAO.JDBC;
import model.Certificate;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/certificate")
public class CertificateServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try (Connection connection = JDBC.getConnectionWithSqlJdbc()) {
            CertificateDAO certificateDAO = new CertificateDAO(connection);
            List<Certificate> certificates = certificateDAO.getCertificatesByUserId(user.getUserID());
            request.setAttribute("certificates", certificates);
            request.getRequestDispatcher("pages/certificates.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while fetching certificates.");
        }
    }
}
