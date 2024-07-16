//package controller;
//
//import DAO.WalletDAO;
//import DAO.JDBC;
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//@WebServlet("/updatewallet")
//public class UpdateWalletServlet extends HttpServlet {
//
//    private static final long serialVersionUID = 1L;
//    private static final Logger logger = Logger.getLogger(UpdateWalletServlet.class.getName());
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String[] courseIds = request.getParameterValues("courseId");
//        String[] amounts = request.getParameterValues("amount");
//
//        if (courseIds == null || amounts == null || courseIds.length != amounts.length) {
//            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid parameters.");
//            return;
//        }
//
//        try (Connection connection = JDBC.getConnectionWithSqlJdbc()) {
//            WalletDAO walletDAO = new WalletDAO(connection);
//            PaymentController paymentController = new PaymentController(walletDAO);
//
//            for (int i = 0; i < courseIds.length; i++) {
//                int courseId = Integer.parseInt(courseIds[i]);
//                double amount = Double.parseDouble(amounts[i]);
//
//                int adminId = getAdminIdForCourse(courseId);
//                int instructorId = getInstructorIdForCourse(courseId);
//
//                paymentController.processPayment(adminId, instructorId, amount);
//            }
//            response.getWriter().write("Wallets updated successfully.");
//        } catch (Exception e) {
//            logger.log(Level.SEVERE, "Error updating wallets: ", e);
//            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating wallets.");
//        }
//    }
//    
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        doPost(request, response);
//    }
//
//    private int getAdminIdForCourse(int courseId) throws SQLException, ClassNotFoundException {
//        int adminId = 0;
//        String sql = "SELECT CreatedBy FROM Courses WHERE CourseID = ?";
//        try (Connection connection = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = connection.prepareStatement(sql)) {
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
//        try (Connection connection = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = connection.prepareStatement(sql)) {
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