//package controller;
//
//import DAO.WalletDAO;
//import DAO.JDBC;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//
//@WebServlet("/updatewallet")
//public class UpdateWalletServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//    private static final Logger logger = Logger.getLogger(UpdateWalletServlet.class.getName());
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        int courseId = Integer.parseInt(request.getParameter("courseId"));
//        double amount = Double.parseDouble(request.getParameter("amount"));
//
//        try {
//            int adminId = getAdminIdForCourse(courseId);
//            int instructorId = getInstructorIdForCourse(courseId);
//
//            try (Connection connection = JDBC.getConnectionWithSqlJdbc()) {
//                WalletDAO walletDAO = new WalletDAO(connection);
//                PaymentController paymentController = new PaymentController(walletDAO);
//
//                try {
//                    paymentController.processPayment(adminId, instructorId, amount);
//                    response.getWriter().write("Wallets updated successfully.");
//                } catch (SQLException e) {
//                    e.printStackTrace();
//                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating wallets.");
//                }
//            } catch (Exception ex) {
//                logger.log(Level.SEVERE, "Error establishing connection: ", ex);
//                response.getWriter().write("Error establishing connection: " + ex.getMessage());
//            }
//        } catch (Exception e) {
//            logger.log(Level.SEVERE, "Error retrieving admin or instructor ID: ", e);
//            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving admin or instructor ID.");
//        }
//    }
//
//    private int getAdminIdForCourse(int courseId) throws SQLException, ClassNotFoundException {
//        int adminId = 0;
//        String sql = "SELECT CreatedBy FROM Courses WHERE CourseID = ?";
//        try (Connection connection = JDBC.getConnectionWithSqlJdbc();
//             PreparedStatement ps = connection.prepareStatement(sql)) {
//            ps.setInt(1, courseId);
//            try (ResultSet rs = ps.executeQuery()) {
//                if (rs.next()) {
//                    adminId = rs.getInt("CreatedBy");
//                }
//            }
//        } catch (Exception ex) {
//            Logger.getLogger(UpdateWalletServlet.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return adminId;
//    }
//
//    private int getInstructorIdForCourse(int courseId) throws SQLException, ClassNotFoundException {
//        int instructorId = 0;
//        String sql = "SELECT CreatedBy FROM Courses WHERE CourseID = ?";
//        try (Connection connection = JDBC.getConnectionWithSqlJdbc();
//             PreparedStatement ps = connection.prepareStatement(sql)) {
//            ps.setInt(1, courseId);
//            try (ResultSet rs = ps.executeQuery()) {
//                if (rs.next()) {
//                    instructorId = rs.getInt("CreatedBy");
//                }
//            }
//        } catch (Exception ex) {
//            Logger.getLogger(UpdateWalletServlet.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return instructorId;
//    }
//
//    @Override
//    public String getServletInfo() {
//        return "Servlet for updating wallets after payment";
//    }
//}
