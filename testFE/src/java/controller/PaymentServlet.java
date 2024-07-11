package controller;

import DAO.JDBC;
import DAO.WalletDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import model.User;
import model.Wallet;

@WebServlet(name = "PaymentServlet", urlPatterns = {"/payment"})
public class PaymentServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PaymentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PaymentServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User learner = (User) session.getAttribute("user");
        if (learner == null || learner.getRole() != 1) { // Assuming role 1 is Learner
            response.sendRedirect("login.jsp");
            return;
        }

        double paymentAmount = Double.parseDouble(request.getParameter("amount"));
        double adminAmount = paymentAmount * 0.3;
        double instructorAmount = paymentAmount * 0.7;

        try (Connection connection = JDBC.getConnectionWithSqlJdbc()) {
            WalletDAO walletDAO = new WalletDAO(connection);

            // Update admin wallet balance
            User admin = walletDAO.getUserByRole(3); // Assuming role 3 is Admin
            Wallet adminWallet = walletDAO.getWalletByUserId(admin.getUserID());
            adminWallet.setBalance(adminWallet.getBalance() + adminAmount);
            walletDAO.updateWallet(adminWallet);

            // Update instructor wallet balance
            User instructor = walletDAO.getUserByRole(2); // Assuming role 2 is Instructor
            Wallet instructorWallet = walletDAO.getWalletByUserId(instructor.getUserID());
            instructorWallet.setBalance(instructorWallet.getBalance() + instructorAmount);
            walletDAO.updateWallet(instructorWallet);

            response.sendRedirect("success.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
