package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBContext {

    protected Connection connection;
    protected PreparedStatement statement;
    protected ResultSet resultSet;

    /**
     * Get a connection to the database.
     *
     * @return connection or null
     * @throws SQLException if a database access error occurs
     */
    public Connection getConnection() throws SQLException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=OnlineLearningV2;encrypt=true;trustServerCertificate=true";
            String user = "sa";
            String password = "123";
            return DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    /**
     * Close the provided connection.
     *
     * @param connection the connection to close
     */
    protected void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * Close the provided statement.
     *
     * @param statement the statement to close
     */
    protected void closeStatement(PreparedStatement statement) {
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * Close the provided result set.
     *
     * @param resultSet the result set to close
     */
    protected void closeResultSet(ResultSet resultSet) {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        DBContext db = new DBContext();
        Connection conn = null;
        try {
            conn = db.getConnection();
            if (conn != null) {
                System.out.println("Test: Connection established successfully!");
            } else {
                System.out.println("Test: Failed to establish connection.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            db.closeConnection(conn);
        }
    }
}
