/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author tuan6
 */
public class UserDAO extends DBContext {

    public User getUserByUserName(String Username) {
        String sql = "SELECT [UserID]\n"
                + "      ,[Username]\n"
                + "      ,[PasswordHash]\n"
                + "      ,[FirstName]\n"
                + "      ,[LastName]\n"
                + "      ,[Email]\n"
                + "      ,[RoleID]\n"
                + "      ,[RegistrationDate]\n"
                + "      ,[IsActive]\n"
                + "      ,[Avatar]\n"
                + "      ,[Bio]\n"
                + "  FROM [OnlineLearningV2].[dbo].[Users] where Username =? ";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, Username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int userID = rs.getInt("UserID");
                String userNameFromDB = rs.getString("Username");
                String password = rs.getString("PasswordHash");
                String firstName = rs.getString("FirstName");
                String lastName = rs.getString("LastName");
                String email = rs.getString("Email");
                int RoleID = rs.getInt("RoleID");
                String registrationDate = rs.getString("RegistrationDate");
                int isActive = rs.getInt("IsActive");
                String avatar = rs.getString("Avatar");
                String bio = rs.getString("Bio");
                User newUser = new User(userID, userNameFromDB, password, firstName, lastName, email, RoleID, registrationDate, isActive, avatar, bio);
                return newUser;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public User getUserByEmail(String Email) {
        String sql = "SELECT [UserID]\n"
                + "      ,[Username]\n"
                + "      ,[PasswordHash]\n"
                + "      ,[FirstName]\n"
                + "      ,[LastName]\n"
                + "      ,[Email]\n"
                + "      ,[RoleID]\n"
                + "      ,[RegistrationDate]\n"
                + "      ,[IsActive]\n"
                + "      ,[Avatar]\n"
                + "      ,[Bio]\n"
                + "  FROM [OnlineLearningV2].[dbo].[Users] where Email =? ";
        try {
            PreparedStatement st = getConnection().prepareStatement(sql);
            st.setString(1, Email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int userID = rs.getInt("UserID");
                String userNameFromDB = rs.getString("Username");
                String password = rs.getString("PasswordHash");
                String firstName = rs.getString("FirstName");
                String lastName = rs.getString("LastName");
                String email = rs.getString("Email");
                int RoleID = rs.getInt("RoleID");
                String registrationDate = rs.getString("RegistrationDate");
                int isActive = rs.getInt("IsActive");
                String avatar = rs.getString("Avatar");
                String bio = rs.getString("Bio");
                User newUser = new User(userID, userNameFromDB, password, firstName, lastName, email, RoleID, registrationDate, isActive, avatar, bio);
                return newUser;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean addUser(User account) {
        try (Connection connection = getConnection()) {
            String query = " INSERT INTO [OnlineLearningV2].[dbo].[Users]\n"
                    + "    ([Username], [PasswordHash], [FirstName], [LastName], [Email], [RoleID], [RegistrationDate], [IsActive], [Avatar], [Bio])\n"
                    + "VALUES\n"
                    + "    (?, ?, ?, ?, ?, ?, ?, 1, null, null);";

            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {

                preparedStatement.setString(1, account.getUsername());
                preparedStatement.setString(2, account.getPasswordHash());
                preparedStatement.setString(3, account.getFirstName());
                preparedStatement.setString(4, account.getLastName());
                preparedStatement.setString(5, account.getEmail());
                // set default for user register have role = 1 [Customer] va status = 0;
                preparedStatement.setInt(6, account.getRoleID());
                preparedStatement.setString(7, account.getRegistrationDate());

                int rowsAffected = preparedStatement.executeUpdate();

                return rowsAffected > 0; // Returns true if at least one row was affected
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Print the stack trace for debugging purposes
            System.out.println("Add user unsuccessfully!");
            return false;
        }
    }

    public boolean checkLogin(String username, String password) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean isAuthenticated = false;

        try {
            conn = getConnection(); // Thay đổi ở đây để sử dụng phương thức getConnection() của lớp UserDAO
            String query = "SELECT * FROM users WHERE username = ? AND password = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                // Nếu có bản ghi tồn tại trong cơ sở dữ liệu, đăng nhập thành công
                isAuthenticated = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Đảm bảo đóng tất cả các tài nguyên kết nối, câu lệnh và bộ kết quả
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
                }
            }
        }

        return isAuthenticated;
    }

    // Method to update user profile without password and avatar
    public boolean updateUserProfile(User user) {
        String sql = "UPDATE [OnlineLearningV2].[dbo].[Users] SET "
                + "[FirstName] = ?, "
                + "[LastName] = ?, "
                + "[Email] = ?, "
                + "[Bio] = ? "
                + "WHERE [UserID] = ?";

        try (Connection connection = getConnection(); PreparedStatement st = connection.prepareStatement(sql)) {

            st.setString(1, user.getFirstName());
            st.setString(2, user.getLastName());
            st.setString(3, user.getEmail());
            st.setString(4, user.getBio());
            st.setInt(5, user.getUserID());

            return st.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // Method to change user password
    public boolean changeUserPassword(int userID, String newPasswordHash) {
        String sql = "UPDATE [OnlineLearningV2].[dbo].[Users] SET "
                + "[PasswordHash] = ? "
                + "WHERE [UserID] = ?";

        try (Connection connection = getConnection(); PreparedStatement st = connection.prepareStatement(sql)) {

            st.setString(1, newPasswordHash);
            st.setInt(2, userID);

            return st.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // Method to update user avatar
    public boolean updateUserAvatar(int userID, String avatarUrl) {
        String sql = "UPDATE [OnlineLearningV2].[dbo].[Users] SET [Avatar] = ? WHERE [UserID] = ?";

        try (Connection connection = getConnection(); PreparedStatement st = connection.prepareStatement(sql)) {

            st.setString(1, avatarUrl);
            st.setInt(2, userID);

            return st.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // Helper method to map ResultSet to User object
    private User mapUser(ResultSet rs) throws SQLException {
        int userID = rs.getInt("UserID");
        String username = rs.getString("Username");
        String password = rs.getString("PasswordHash");
        String firstName = rs.getString("FirstName");
        String lastName = rs.getString("LastName");
        String email = rs.getString("Email");
        int roleID = rs.getInt("RoleID");
        String registrationDate = rs.getString("RegistrationDate");
        int isActive = rs.getInt("IsActive");
        String avatar = rs.getString("Avatar");
        String bio = rs.getString("Bio");
        return new User(userID, username, password, firstName, lastName, email, roleID, registrationDate, isActive, avatar, bio);
    }

    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();
        User account = new User();
        account.setUsername("alo");
        account.setPasswordHash("123");
        account.setFirstName("Duy");
        account.setLastName("Ngo");
        account.setEmail("@gmail");
        account.setRoleID(1);
        account.setRegistrationDate(null);
        userDAO.addUser(account);
    }

}
