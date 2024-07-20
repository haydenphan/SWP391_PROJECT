package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBC {

    public static Connection getConnectionWithSqlJdbc() throws Exception {
        Connection con = null;
        String dbUser = "sa";
        String dbPassword = "123";
        String port = "1433";
        String IP = "169.254.157.38";
        String ServerName = "LAPTOP-DVKPB8S9";
        String DBName = "OnlineLearningV2";
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

//package DAO;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.SQLException;
//
//public class JDBC {
//
//    public static Connection getConnectionWithSqlJdbc() throws Exception {
//        Connection con = null;
//        String dbUser = "de180905_SQLLogin_1";
//        String dbPassword = "hll66t9336";
//        String driverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
//        String dbURL = "jdbc:sqlserver://OnlineLearningV2.mssql.somee.com:1433;databaseName=OnlineLearningV2;user=" + dbUser + ";password=" + dbPassword + ";encrypt=true;trustServerCertificate=true;loginTimeout=30;";
//
//        try {
//            Class.forName(driverClass);
//            con = DriverManager.getConnection(dbURL);
//        } catch (SQLException e) {
//            System.out.println("Error: " + e);
//        }
//        return con;
//    }
//
//    public static void main(String[] args) {
//        try {
//            Connection con = JDBC.getConnectionWithSqlJdbc();
//            if (con != null) {
//                System.out.println(con.toString());
//                System.out.println("Connection established successfully!");
//                con.close();
//            } else {
//                System.out.println("Failed to establish connection.");
//            }
//        } catch (Exception e) {
//            System.out.println("Error: " + e);
//        }
//    }
//}
