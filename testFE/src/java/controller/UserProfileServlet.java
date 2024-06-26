package controller;

import DAO.TransactionDAO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Transaction;
import model.User;
import utils.LocalDateTimeAdapter;

@WebServlet(name = "UserProfileServlet", urlPatterns = {"/user-profile"})
public class UserProfileServlet extends HttpServlet {

    private TransactionDAO transactionDAO = new TransactionDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            String action = request.getParameter("action");

            if ("getTransactions".equals(action)) {
                try {
                    List<Transaction> transactions = transactionDAO.getTransactionsByUserID(user.getUserID());

                    // Logging the transactions
                    for (Transaction transaction : transactions) {
                        System.out.println(transaction.toString());
                    }

                    // Register the custom LocalDateTime adapter
                    Gson gson = new GsonBuilder()
                            .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter())
                            .setPrettyPrinting()
                            .create();

                    String transactionsJson = gson.toJson(transactions);

                    // Logging the JSON output
                    System.out.println("JSON Output: " + transactionsJson);

                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(transactionsJson);
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while fetching transactions.");
                }
            } else {
                // Any logic you want to perform before forwarding to the JSP
                request.getRequestDispatcher("pages/user-profile.jsp").forward(request, response);
            }
        } else {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
