/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.TransactionDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import model.Course;
import model.ProductCart;
import model.Transaction;
import model.TransactionItem;
import model.User;

/**
 *
 * @author Thunguyet
 */
@WebServlet(name = "TransactionServlet", urlPatterns = {"/transactionservlet"})
public class TransactionServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TransactionServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TransactionServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        try {
            HttpSession session = request.getSession();

            // Retrieve session attributes
            User user = (User) session.getAttribute("user");
            HashMap<Integer, ProductCart> cart = (HashMap<Integer, ProductCart>) session.getAttribute("cart");
            Double total = (Double) session.getAttribute("total");
            String status = "00".equals(request.getParameter("vnp_ResponseCode")) ? "Completed" : "Failed";

            // Debugging: Print retrieved session attributes
            System.out.println("Debug: Retrieved session attributes");
            System.out.println("User: " + (user != null ? user.toString() : "null"));
            System.out.println("Cart: " + (cart != null ? cart.toString() : "null"));
            System.out.println("Total: " + total);
            System.out.println("Status: " + status);

            if (user != null && cart != null && total != null) {
                TransactionDAO transactionDAO = new TransactionDAO();
                Date transactionDate = new Date(); // Current date and time

                // Create transaction
                Transaction transaction = new Transaction(0, user, total, transactionDate, status);
                List<TransactionItem> items = new ArrayList<>();
                for (ProductCart item : cart.values()) {
                    Course course = item.getCourse();
                    items.add(new TransactionItem(course, course.getPrice()));
                }

                // Debugging: Print transaction and items before insertion
                System.out.println("Debug: Preparing to insert transaction");
                System.out.println("Transaction: " + transaction.toString());
                for (TransactionItem item : items) {
                    System.out.println("TransactionItem: " + item.toString());
                }

                // Insert transaction
                boolean result = transactionDAO.insertTransaction(transaction, items);
                if (result) {
                    System.out.println("Transaction inserted successfully");
                } else {
                    System.out.println("Failed to insert transaction");
                }
            } else {
                System.out.println("User, cart, or total is null. User: " + user + ", Cart: " + cart + ", Total: " + total);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Forward to the result page
        request.getRequestDispatcher("/pages/vnpay_return.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
