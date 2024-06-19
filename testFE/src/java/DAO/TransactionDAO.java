package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import model.Course;
import model.Transaction;
import model.TransactionItem;
import model.User;

/**
 * DAO class for handling transactions.
 */
public class TransactionDAO {

    /**
     * Inserts a transaction along with its items.
     *
     * @param transaction the transaction to insert
     * @param items the items of the transaction
     * @return true if the transaction and items were inserted successfully,
     * false otherwise
     */
    public boolean insertTransaction(Transaction transaction, List<TransactionItem> items) throws Exception {
        String transactionSql = "INSERT INTO Transactions (UserID, Amount, TransactionDate, Status) VALUES (?, ?, ?, ?)";
        String transactionItemSql = "INSERT INTO TransactionItems (TransactionID, CourseID, Price) VALUES (?, ?, ?)";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement transactionStmt = con.prepareStatement(transactionSql, PreparedStatement.RETURN_GENERATED_KEYS); PreparedStatement transactionItemStmt = con.prepareStatement(transactionItemSql)) {

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
            for (TransactionItem item : items) {
                transactionItemStmt.setInt(1, transactionID);
                transactionItemStmt.setInt(2, item.getCourse().getCourseID());
                transactionItemStmt.setDouble(3, item.getPrice());
                transactionItemStmt.addBatch();
            }
            transactionItemStmt.executeBatch();

            con.commit();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            try (Connection con = JDBC.getConnectionWithSqlJdbc()) {
                if (con != null && !con.getAutoCommit()) {
                    con.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            return false;
        }
    }

    public static void main(String[] args) {
        try {
            // Mock user
            User user = new User();
            user.setUserID(2); // Set a valid user ID

            // Mock courses
            Course course1 = new Course();
            course1.setCourseID(4); // Set a valid course ID
            course1.setCourseName("Sample Course 1");
            course1.setPrice(100.0);

            Course course2 = new Course();
            course2.setCourseID(5); // Set a valid course ID
            course2.setCourseName("Sample Course 2");
            course2.setPrice(150.0);

            // Mock transaction
            double amount = 250.0;
            Date transactionDate = new Date(); // Current date and time
            String status = "Completed"; // Ensure this matches the allowed values

            Transaction transaction = new Transaction(0, user, amount, transactionDate, status);

            // Mock transaction items
            TransactionItem item1 = new TransactionItem(course1, course1.getPrice());
            TransactionItem item2 = new TransactionItem(course2, course2.getPrice());
            List<TransactionItem> items = Arrays.asList(item1, item2);

            // Test insert transaction
            TransactionDAO transactionDAO = new TransactionDAO();
            boolean result = transactionDAO.insertTransaction(transaction, items);
            if (result) {
                System.out.println("Transaction inserted successfully");
            } else {
                System.out.println("Failed to insert transaction");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
