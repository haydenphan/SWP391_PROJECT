package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBC {

    public static Connection getConnectionWithSqlJdbc() throws Exception {
        Connection con = null;
        String dbUser = "sa";
        String dbPassword = "Nguyet170280";
        String port = "1433";
        String IP = "192.168.1.13";
        String ServerName = "ASUS";
        String DBName = "OnlineLearningV3";
        String driverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

        String dbURL = "jdbc:sqlserver://" + ServerName + ";databaseName=" + DBName + ";encrypt=false;trustServerCertificate=false;loginTimeout=30";
        //String dbURL = "jdbc:sqlserver://DESKTOP-UEDQ7P6\\HOATNTT;databaseName=School;encrypt=false;trustServerCertificate=false;loginTimeout=30";         
        try {
            Class.forName(driverClass);
            //DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
            con = DriverManager.getConnection(dbURL, dbUser, dbPassword);
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return con;
    }

}
