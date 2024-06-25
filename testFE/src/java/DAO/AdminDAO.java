/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author tuan6
 */
public class AdminDAO extends DBContext {

    public int getTotalUser() throws SQLException {
        PreparedStatement st = null;
        ResultSet rs = null;
        String sql = "SELECT COUNT(*) FROM dbo.[Users] WHERE RoleID != 3";
        try {
            st = getConnection().prepareStatement(sql);
            rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (st != null) {
                st.close();
            }
        }
        return 0;
    }

    public List<User> getUsers(int index) throws SQLException {
        PreparedStatement st = null;
        ResultSet rs = null;
        List<User> listUsers = new ArrayList();
        String sql = "SELECT * FROM Users"
                + " where RoleID != 3 order by RoleID asc offset ? row fetch next 10 rows only";
        try {
            st = getConnection().prepareStatement(sql);
            st.setInt(1, (index -1) * 10);
            rs = st.executeQuery();
            while (rs.next()) {
                User user = new User();
                    user.setUserID(rs.getInt("UserID"));
                    user.setUserName(rs.getString("UserName"));
                    user.setPasswordHash(rs.getString("PasswordHash"));
                    user.setFirstName(rs.getString("FirstName"));
                    user.setLastName(rs.getString("LastName"));
                    user.setEmail(rs.getString("Email"));
                    user.setRole(rs.getInt("RoleID"));
                    user.setRegistrationDate(rs.getTimestamp("RegistrationDate").toLocalDateTime());
                    user.setIsActive(rs.getBoolean("IsActive"));
                    user.setAvatar(rs.getString("Avatar"));
                    user.setBio(rs.getString("Bio"));
                    user.setStoredSalt(rs.getBytes("StoredSalt"));
                    user.setStatus(rs.getInt("Status"));
                listUsers.add(user);
            }
            return listUsers;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (st != null) {
                st.close();
            }
        }
        return null;
    }

    public int disableUser(int accId) throws SQLException {
        PreparedStatement st = null;
        ResultSet rs = null;
        String sql = "UPDATE dbo.Users SET Status = 1 WHERE UserID = ?  ";
        try {
            st = getConnection().prepareStatement(sql);
            st.setInt(1, accId);
            int affectedRow = st.executeUpdate();
            if (affectedRow > 0) {
                return 1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (st != null) {
                st.close();
            }
        }
        return 0;
    }

    public int enableUser(int accId) throws SQLException {
        PreparedStatement st = null;
        ResultSet rs = null;
        String sql = "UPDATE dbo.Users SET Status = 0 WHERE UserID = ?  ";
        try {
            st = getConnection().prepareStatement(sql);
            st.setInt(1, accId);
            int affectedRow = st.executeUpdate();
            if (affectedRow > 0) {
                return 1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (st != null) {
                st.close();
            }
        }
        return 0;
    }

    public int setRoleUser(int accountId, int RoleId) throws SQLException {
        PreparedStatement st = null;
        ResultSet rs = null;
        String sql = "UPDATE dbo.Users SET RoleID = ? WHERE UserID = ?  ";
        try {
            st = getConnection().prepareStatement(sql);
            st.setInt(1, RoleId);
            st.setInt(2, accountId);
            int affectedRow = st.executeUpdate();
            if (affectedRow > 0) {
                return 1;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (st != null) {
                st.close();
            }
        }
        return 0;
    }
    
    public static void main(String[] args) {
        AdminDAO adminDAO = new AdminDAO();
        
        // Test getTotalUser method
//        try {
//            int totalUsers = adminDAO.getTotalUser();
//            System.out.println("Total Users: " + totalUsers);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }

        // Test getUsers method with index 1
        try {
            List<User> users = adminDAO.getUsers(1);
            for (User user : users) {
                System.out.println(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
//
        // Test disableUser method with a sample user ID (e.g., 1)
//        try {
//            int result = adminDAO.disableUser(1);
//            System.out.println("Disable User Result: " + result);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        // Test enableUser method with a sample user ID (e.g., 1)
//        try {
//            int result = adminDAO.enableUser(1);
//            System.out.println("Enable User Result: " + result);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        // Test setRoleUser method with a sample user ID (e.g., 1) and role ID (e.g., 2)
//        try {
//            int result = adminDAO.setRoleUser(1, 2);
//            System.out.println("Set Role User Result: " + result);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
    }
}

