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
import model.User;

public class TransactionDAO {

    public int insertTransaction(Transaction transaction) throws Exception {
        String transactionSql = "INSERT INTO Transactions (UserID, Amount, TransactionDate, Status) VALUES (?, ?, ?, ?)";
        Connection con = null;
        try {
            con = JDBC.getConnectionWithSqlJdbc();
            PreparedStatement transactionStmt = con.prepareStatement(transactionSql, PreparedStatement.RETURN_GENERATED_KEYS);

            // Insert transaction
            transactionStmt.setInt(1, transaction.getUserID().getUserID());
            transactionStmt.setDouble(2, transaction.getAmount());
            transactionStmt.setTimestamp(3, new java.sql.Timestamp(transaction.getTransactionDate().getTime()));
            transactionStmt.setString(4, transaction.getStatus());
            transactionStmt.executeUpdate();

            // Get the generated transaction ID
            ResultSet rs = transactionStmt.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }

            return 0; // Return 0 if no ID was generated

        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Transaction insertion failed", e);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public boolean insertTransactionDetails(int transactionID, List<TransactionDetails> items) throws Exception {
        String transactionItemSql = "INSERT INTO TransactionDetails (TransactionID, CourseID, Price) VALUES (?, ?, ?)";
        Connection con = null;
        try {
            con = JDBC.getConnectionWithSqlJdbc();
            PreparedStatement transactionItemStmt = con.prepareStatement(transactionItemSql);

            con.setAutoCommit(false);

            // Insert transaction items
            for (TransactionDetails item : items) {
                if (item.getCourseID() != null) { // Check if course is not null
                    transactionItemStmt.setInt(1, transactionID);
                    transactionItemStmt.setInt(2, item.getCourseID().getCourseID());
                    transactionItemStmt.setDouble(3, item.getPrice());
                    transactionItemStmt.addBatch();
                } else {
                    System.out.println("Course is null for item: " + item);
                }
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
            throw new Exception("Transaction details insertion failed", e);
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
        String sql = "SELECT t.TransactionID, t.Amount, t.TransactionDate, t.Status, c.CourseID, c.CourseName, ti.Price, t.UserID "
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
                    UserDAO dao = new UserDAO();
                    transaction = new Transaction(transactionID, dao.getUserByID(userID), amount, transactionDate, status);
                    transactionMap.put(transactionID, transaction);
                }

                // Add TransactionDetails to Transaction
                transaction.addTransactionDetail(transactionDetails);
            }
        }

        // Convert the map values to a list
        return new ArrayList<>(transactionMap.values());
    }

    public static void main(String[] args) throws Exception {
        TransactionDAO transactionDAO = new TransactionDAO();

        // Create a mock user
        User user = new User();
        user.setUserID(1); // Set this to a valid user ID in your database

        // Create a mock transaction
        Transaction transaction = new Transaction();
        transaction.setUserID(user);
        transaction.setAmount(100.0);
        transaction.setTransactionDate(new Date());
        transaction.setStatus("Completed");

        // Insert the transaction
        int transactionID = transactionDAO.insertTransaction(transaction);
        if (transactionID > 0) {
            System.out.println("Transaction inserted successfully with ID: " + transactionID);

            // Create a list of transaction details
            List<TransactionDetails> items = new ArrayList<>();
            Course course1 = CourseDAO.getCoursesByID(3);
            System.out.println(course1);

            if (course1 != null) {
                items.add(new TransactionDetails(course1, 50.0));
            } else {
                System.out.println("Course with ID 3 not found.");
            }

            // Insert the transaction details
            boolean result = transactionDAO.insertTransactionDetails(transactionID, items);
            if (result) {
                System.out.println("Transaction details inserted successfully");
            } else {
                System.out.println("Transaction details insertion failed");
            }
        } else {
            System.out.println("Transaction insertion failed");
        }
    }
}
