package controller;

import DAO.TransactionDAO;
import DAO.CartDAO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Course;
import model.Cart;
import model.CartDetails;
import model.Transaction;
import model.TransactionDetails;
import model.User;
import DAO.JDBC;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "TransactionServlet", urlPatterns = {"/transactionservlet"})
public class TransactionServlet extends HttpServlet {

    private Connection connection;

    @Override
    public void init() {
        try {
            connection = JDBC.getConnectionWithSqlJdbc();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void destroy() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            try {
                TransactionDAO transactionDAO = new TransactionDAO();
                List<Transaction> transactions = transactionDAO.getTransactionsByUserID(user.getUserID());
                request.setAttribute("transactions", transactions);
                request.getRequestDispatcher("pages/user-profile.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving transactions");
            }
        } else {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in");
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

        // Retrieve session attributes
        User user = (User) session.getAttribute("user");
        Cart cart = (Cart) session.getAttribute("cart"); // Cast to model.Cart
        Double total = (Double) session.getAttribute("total");

        // Retrieve form parameters
        String vnp_TxnRef = request.getParameter("vnp_TxnRef");
        String vnp_Amount = request.getParameter("vnp_Amount");
        String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
        String vnp_TransactionNo = request.getParameter("vnp_TransactionNo");
        String vnp_BankCode = request.getParameter("vnp_BankCode");
        String vnp_PayDate = request.getParameter("vnp_PayDate");
        String status = request.getParameter("status");

        // Debugging: Print retrieved session attributes and form parameters
        System.out.println("Debug: Retrieved session attributes and form parameters");
        System.out.println("User: " + (user != null ? user.toString() : "null"));
        System.out.println("Cart: " + (cart != null ? cart.toString() : "null"));
        System.out.println("Total: " + total);
        System.out.println("vnp_TxnRef: " + vnp_TxnRef);
        System.out.println("vnp_Amount: " + vnp_Amount);
        System.out.println("vnp_ResponseCode: " + vnp_ResponseCode);
        System.out.println("vnp_TransactionNo: " + vnp_TransactionNo);
        System.out.println("vnp_BankCode: " + vnp_BankCode);
        System.out.println("vnp_PayDate: " + vnp_PayDate);
        System.out.println("Status: " + status);

        if (user != null && cart != null && total != null) {
            try {
                TransactionDAO transactionDAO = new TransactionDAO();
                CartDAO cartDAO = new CartDAO(connection);
                Date transactionDate = new Date(); // Current date and time

                // Create transaction
                Transaction transaction = new Transaction(0, user, total, transactionDate, status);
                List<TransactionDetails> items = new ArrayList<>();
                for (CartDetails item : cart.getCartDetails()) { // Use cart.getCartDetails() to get the details
                    Course course = item.getCourse();
                    items.add(new TransactionDetails(course, item.getPrice()));
                }

                // Debugging: Print transaction and items before insertion
                System.out.println("Debug: Preparing to insert transaction");
                System.out.println("Transaction: " + transaction.toString());
                for (TransactionDetails item : items) {
                    System.out.println("TransactionItem: " + item.toString());
                }

                // Insert transaction
                int transactionID = transactionDAO.insertTransaction(transaction);
                if (transactionID > 0) {
                    System.out.println("Transaction inserted successfully with ID: " + transactionID);

                    // Insert transaction details
                    boolean detailsInserted = transactionDAO.insertTransactionDetails(transactionID, items);
                    if (detailsInserted) {
                        System.out.println("Transaction details inserted successfully");

                        // Delete the cart from the database if the transaction is completed
                        if ("Completed".equalsIgnoreCase(status)) {
                            cartDAO.deleteCart(cart.getCartID());
                            System.out.println("Cart deleted from database");
                        }

                        // Clear the session cart after successful transaction
                        session.removeAttribute("cart");
                        session.removeAttribute("total");
                    } else {
                        System.out.println("Failed to insert transaction details");
                    }
                } else {
                    System.out.println("Failed to insert transaction");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("User, cart, or total is null. User: " + user + ", Cart: " + cart + ", Total: " + total);
        }

        // Redirect to a confirmation page
        response.sendRedirect(request.getContextPath() + "/pages/confirmation.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}