package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {

    public Connection getConnection() throws SQLException {
        try {
            Connection con = null;
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=OnlineLearningV3; user = sa; password = 123";
            con = DriverManager.getConnection(url);
            return con;
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
        System.out.println("Test :"+db.getConnection());
    }
}