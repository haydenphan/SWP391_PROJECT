package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Course;
import model.Transaction;
import model.TransactionDetails;

public class TransactionDAO {

    public boolean insertTransaction(Transaction transaction, List<TransactionDetails> items) throws Exception {
        String transactionSql = "INSERT INTO Transactions (UserID, Amount, TransactionDate, Status) VALUES (?, ?, ?, ?)";
        String transactionItemSql = "INSERT INTO TransactionDetails (TransactionID, CourseID, Price) VALUES (?, ?, ?)";

        Connection con = null;
        try {
            con = JDBC.getConnectionWithSqlJdbc();
            PreparedStatement transactionStmt = con.prepareStatement(transactionSql, PreparedStatement.RETURN_GENERATED_KEYS);
            PreparedStatement transactionItemStmt = con.prepareStatement(transactionItemSql);

            con.setAutoCommit(false);

            // Insert transaction
            transactionStmt.setInt(1, transaction.getUserID().getUserID());
            transactionStmt.setDouble(2, transaction.getAmount());
            transactionStmt.setTimestamp(3, new java.sql.Timestamp(transaction.getTransactionDate().getTime()));
            transactionStmt.setString(4, transaction.getStatus());
            transactionStmt.executeUpdate();

            // Get the generated transaction ID
            ResultSet rs = transactionStmt.getGeneratedKeys();
            int transactionID = 0;
            if (rs.next()) {
                transactionID = rs.getInt(1);
            }

            // Insert transaction items
            for (TransactionDetails item : items) {
                transactionItemStmt.setInt(1, transactionID);
                transactionItemStmt.setInt(2, item.getCourseID().getCourseID());
                transactionItemStmt.setDouble(3, item.getPrice());
                transactionItemStmt.addBatch();
            }
            transactionItemStmt.executeBatch();

            con.commit();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            if (con != null) {
                try {
                    con.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            return false;
        } finally {
            if (con != null) {
                try {
                    con.setAutoCommit(true);
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public List<Transaction> getTransactionsByUserID(int userID) throws Exception {
        String sql = "SELECT t.TransactionID, t.Amount, t.TransactionDate, t.Status, c.CourseID, c.CourseName, ti.Price "
                + "FROM Transactions t "
                + "JOIN TransactionDetails ti ON t.TransactionID = ti.TransactionID "
                + "JOIN Courses c ON ti.CourseID = c.CourseID "
                + "WHERE t.UserID = ?";
        Map<Integer, Transaction> transactionMap = new HashMap<>();

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, userID);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int transactionID = rs.getInt("TransactionID");
                double amount = rs.getDouble("Amount");
                Date transactionDate = rs.getTimestamp("TransactionDate");
                String status = rs.getString("Status");
                int courseID = rs.getInt("CourseID");
                String courseName = rs.getString("CourseName");
                double price = rs.getDouble("Price");

                // Create the Course object
                Course course = new Course();
                course.setCourseID(courseID);
                course.setCourseName(courseName);

                // Create the TransactionDetails object
                TransactionDetails transactionDetails = new TransactionDetails(course, price);

                // Check if the Transaction already exists in the map
                Transaction transaction = transactionMap.get(transactionID);
                if (transaction == null) {
                    // Create a new Transaction object
                    transaction = new Transaction(transactionID, amount, transactionDate, status);
                    transactionMap.put(transactionID, transaction);
                }

                // Add TransactionDetails to Transaction
                transaction.addTransactionDetail(transactionDetails);
            }
        }

        // Convert the map values to a list
        return new ArrayList<>(transactionMap.values());
    }

    public static void main(String[] args) {
        try {
            TransactionDAO transactionDAO = new TransactionDAO();
            int testUserID = 2; // Change this to an existing user ID in your database

            List<Transaction> transactions = transactionDAO.getTransactionsByUserID(testUserID);

            // Print out the transactions
            for (Transaction transaction : transactions) {
                System.out.println("Transaction ID: " + transaction.getTransactionID());
                System.out.println("Amount: " + transaction.getAmount());
                System.out.println("Transaction Date: " + transaction.getTransactionDate());
                System.out.println("Status: " + transaction.getStatus());

                System.out.println("Transaction Details:");
                transaction.getTransactionDetails().forEach(detail -> {
                    System.out.println(" - Course ID: " + detail.getCourseID().getCourseID());
                    System.out.println(" - Course Name: " + detail.getCourseID().getCourseName());
                    System.out.println(" - Price: " + detail.getPrice());
                });

                System.out.println("-------------");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
