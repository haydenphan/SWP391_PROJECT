package controller;

import DAO.CartDAO;
import DAO.CourseDAO;
import DAO.CourseEnrollmentDAO;
import DAO.JDBC;
import DAO.NotificationDAO;
import DAO.TransactionDAO;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cart;
import model.CartDetails;
import model.Course;
import model.CourseEnrollment;
import model.Notification;
import model.Transaction;
import model.TransactionDetails;
import model.User;

@WebServlet("/paymentHandler")
public class PaymentHandlerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String isPaymentSuccessfulStr = request.getParameter("isPaymentSuccessful");
        boolean isPaymentSuccessful = Boolean.parseBoolean(isPaymentSuccessfulStr);
        System.out.println(isPaymentSuccessful);

        // Retrieve user and cart from session
        User user = (User) request.getSession().getAttribute("user");
        Cart cart = (Cart) request.getSession().getAttribute("cart");

        // Check transaction status
        if (isPaymentSuccessful) {
            // Transaction successful, save enrollment to database
            try {
                CourseEnrollmentDAO enrollmentDAO = new CourseEnrollmentDAO();
                TransactionDAO transactionDAO = new TransactionDAO();

                // Create a new transaction
                double totalAmount = cart.getTotalAmount();
                Transaction transaction = new Transaction();
                transaction.setUserID(user);
                transaction.setAmount(totalAmount);
                transaction.setTransactionDate(new java.util.Date());
                transaction.setStatus("Completed"); // Use allowed value

                // Insert transaction into the database and get the generated transaction ID
                int transactionID = transactionDAO.insertTransaction(transaction);
                if (transactionID <= 0) {
                    throw new Exception("Transaction insertion failed");
                }

                // Create transaction details from the cart items
                List<TransactionDetails> transactionDetailsList = new ArrayList<>();
                for (CartDetails item : cart.getCartDetails()) {
                    Course course = item.getCourse();
                    TransactionDetails transactionDetails = new TransactionDetails(course, item.getPrice());
                    transactionDetails.setTransactionID(transaction);
                    transactionDetailsList.add(transactionDetails);

                    // Create enrollment
                    CourseEnrollment enrollment = new CourseEnrollment(
                            user.getUserID(),
                            course.getCourseID(),
                            LocalDateTime.now()
                    );
                    System.out.println(enrollment.toString());
                    CourseDAO.updateTotalEnrolled(course.getCourseID());
                    enrollmentDAO.insertEnrollment(enrollment);
                }

                // Insert transaction details into the database
                boolean isTransactionDetailsInserted = transactionDAO.insertTransactionDetails(transactionID, transactionDetailsList);
                if (!isTransactionDetailsInserted) {
                    throw new Exception("Transaction details insertion failed");
                }

                // Clear the cart after successful enrollment
                request.getSession().removeAttribute("cart");
                CartDAO dao = new CartDAO(JDBC.getConnectionWithSqlJdbc());
                dao.deleteCart(cart.getCartID());

                // Notify the learner
                NotificationDAO notiDAO = new NotificationDAO();
                Notification notification = new Notification();
                notification.setUserId(user.getUserID());
                notification.setMessage("Successful Payment! Start Learning!");
                notification.setType("PaymentSuccessful");
                notification.setTimeStamp(LocalDateTime.now());
                notification.setTarget("PaymentSuccessful");
                notification.setTargetId(user.getUserID());
                notification.setIsRead(false);
                notiDAO.insertNotification(notification);

                response.sendRedirect(request.getContextPath() + "/pages/user-profile.jsp#courses?status=success");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("paymentResult.jsp?status=error");
            }
        } else {
            // Transaction failed
            try {
                // Create a failed transaction record
                Transaction transaction = new Transaction();
                transaction.setUserID((User) request.getSession().getAttribute("user"));
                transaction.setAmount(((Cart) request.getSession().getAttribute("cart")).getTotalAmount());
                transaction.setTransactionDate(new java.util.Date());
                transaction.setStatus("Failed"); // Use allowed value

                TransactionDAO transactionDAO = new TransactionDAO();
                transactionDAO.insertTransaction(transaction);
            } catch (Exception e) {
                e.printStackTrace();
            }
            response.sendRedirect("paymentResult.jsp?status=failed");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
