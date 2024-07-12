package controller;

import DAO.WalletDAO;
import DAO.JDBC;
import DAO.UserDAO;
import config.VNPayConfig;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.CartDetails;
import model.Course;

@WebServlet("/payment-result")
public class PaymentResultServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(PaymentResultServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map<String, String> fields = new HashMap<>();
        for (Enumeration<String> params = request.getParameterNames(); params.hasMoreElements();) {
            String fieldName = params.nextElement();
            String fieldValue = request.getParameter(fieldName);
            if (fieldValue != null && fieldValue.length() > 0) {
                fields.put(fieldName, fieldValue);
            }
        }
        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
        if (fields.containsKey("vnp_SecureHashType")) {
            fields.remove("vnp_SecureHashType");
        }
        if (fields.containsKey("vnp_SecureHash")) {
            fields.remove("vnp_SecureHash");
        }

        List<String> fieldNames = new ArrayList<>(fields.keySet());
        Collections.sort(fieldNames);

        StringBuilder hashData = new StringBuilder();
        for (String fieldName : fieldNames) {
            String fieldValue = fields.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                if (hashData.length() > 0) {
                    hashData.append('&');
                }
                hashData.append(fieldName).append('=').append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
            }
        }

        String signValue = VNPayConfig.hmacSHA512(VNPayConfig.secretKey, hashData.toString());
        // Retrieve product information from session
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        System.out.println(cart);
        StringBuilder productDescription = new StringBuilder();
        List<Course> courseList = new ArrayList<>();
        if (cart != null && !cart.isEmpty()) {
            for (CartDetails item : cart.getCartDetails()) {
                Course course = item.getCourse();
                System.out.println(course.toString());
                courseList.add(course);
                productDescription.append(course.getCourseName()).append(" - $").append(course.getPrice()).append("<br>");
            }
        } else {
            productDescription.append("No products found in session.");
        }
        boolean isPaymentSuccessful = false;
        String transactionStatus = "Failed";

        if (signValue.equals(vnp_SecureHash)) {
            if ("00".equals(request.getParameter("vnp_ResponseCode"))) {
                isPaymentSuccessful = true;
                transactionStatus = "Completed";
                // Update the wallets of admin and instructor
                double amount = Double.parseDouble(request.getParameter("vnp_Amount")) / 100; // Convert to VND

                try (Connection connection = JDBC.getConnectionWithSqlJdbc()) {
                    WalletDAO walletDAO = new WalletDAO(connection);
                    PaymentController paymentController = new PaymentController(walletDAO);

                    for (Course course : courseList) {
                        int courseID = course.getCourseID();
                        int adminId = UserDAO.getAdminId();
                        int instructorId = UserDAO.getInstructorIdForCourse(courseID);
                        paymentController.processPaymentAdmin(walletDAO.getWalletByUserId(adminId).getWalletID(), amount);
                        paymentController.processPaymentInstructor(walletDAO.getWalletByUserId(instructorId).getWalletID(), amount);
                    }
                } catch (Exception e) {
                    logger.log(Level.SEVERE, "Error updating wallets: ", e);
                    isPaymentSuccessful = false;
                    transactionStatus = "Failed";
                }
            }
        }

        request.setAttribute("productDescription", productDescription);
        request.setAttribute("isPaymentSuccessful", isPaymentSuccessful);
        request.setAttribute("transactionStatus", transactionStatus);
        request.setAttribute("vnp_TxnRef", request.getParameter("vnp_TxnRef"));
        request.setAttribute("vnp_Amount", request.getParameter("vnp_Amount"));
        request.setAttribute("vnp_ResponseCode", request.getParameter("vnp_ResponseCode"));
        request.setAttribute("vnp_TransactionNo", request.getParameter("vnp_TransactionNo"));
        request.setAttribute("vnp_BankCode", request.getParameter("vnp_BankCode"));
        request.setAttribute("vnp_PayDate", request.getParameter("vnp_PayDate"));

        request.getRequestDispatcher("/pages/vnpay_return.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet for processing payment results and updating wallets";
    }
}
