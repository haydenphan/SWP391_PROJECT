package controller;

import DAO.TransactionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Course;
import model.ProductCart;
import model.Transaction;
import model.TransactionItem;
import model.User;

@WebServlet(name = "TransactionServlet", urlPatterns = {"/transactionservlet"})
public class TransactionServlet extends HttpServlet {

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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

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

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
