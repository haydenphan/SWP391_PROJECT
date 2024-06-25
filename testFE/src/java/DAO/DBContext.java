package DAO;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {

    public Connection getConnection() throws SQLException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=OnlineLearningV2;user=sa;password=123;encrypt=true;trustServerCertificate=true";
            return DriverManager.getConnection(url);
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    protected void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) throws SQLException {
        DBContext db = new DBContext();
        Connection connection = db.getConnection();
        if (connection != null) {
            System.out.println("Connection successful!");
            db.closeConnection(connection);
        } else {
            System.out.println("Connection failed!");
        }
    }
}
