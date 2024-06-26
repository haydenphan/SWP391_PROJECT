package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

public class AdminDAO {

    public int getTotalUser() throws SQLException {
        PreparedStatement st = null;
        ResultSet rs = null;
        String sql = "SELECT COUNT(*) FROM dbo.[Users] WHERE RoleID != 3";
        try {
            st = JDBC.getConnectionWithSqlJdbc().prepareStatement(sql);
            rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return 0;
    }

    /**
     * Gets a paginated list of users excluding those with RoleID 3.
     *
     * @param index the page index
     * @return list of users
     * @throws SQLException
     */
    public List<User> getUsers(int index) throws SQLException {
        PreparedStatement st = null;
        ResultSet rs = null;
        List<User> listUsers = new ArrayList<>();
        String sql = "SELECT * FROM Users WHERE RoleID != 3 ORDER BY RoleID ASC OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
        try {
            st = JDBC.getConnectionWithSqlJdbc().prepareStatement(sql);
            st.setInt(1, (index - 1) * 10);
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
                listUsers.add(user);
            }
            return listUsers;
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return null;
    }

    /**
     * Disables a user account.
     *
     * @param accId the user ID
     * @return 1 if successful, 0 otherwise
     * @throws SQLException
     */
    public int enableUser(int accId) throws SQLException {
        PreparedStatement st = null;
        String sql = "UPDATE dbo.Users SET IsActive = 1 WHERE UserID = ?";
        try {
            st = JDBC.getConnectionWithSqlJdbc().prepareStatement(sql);
            st.setInt(1, accId);
            int affectedRow = st.executeUpdate();
            if (affectedRow > 0) {
                return 1;
            }
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (st != null) {
                st.close();
            }
        }
        return 0;
    }

    /**
     * Enables a user account.
     *
     * @param accId the user ID
     * @return 1 if successful, 0 otherwise
     * @throws SQLException
     */
    public int disableUser(int accId) throws SQLException {
        PreparedStatement st = null;
        String sql = "UPDATE dbo.Users SET IsActive = 0 WHERE UserID = ?";
        try {
            st = JDBC.getConnectionWithSqlJdbc().prepareStatement(sql);
            st.setInt(1, accId);
            int affectedRow = st.executeUpdate();
            if (affectedRow > 0) {
                return 1;
            }
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (st != null) {
                st.close();
            }
        }
        return 0;
    }

    /**
     * Sets the role of a user.
     *
     * @param accountId the user ID
     * @param roleId the role ID
     * @return 1 if successful, 0 otherwise
     * @throws SQLException
     */
    public int setRoleUser(int accountId, int roleId) throws SQLException {
        PreparedStatement st = null;
        String sql = "UPDATE dbo.Users SET RoleID = ? WHERE UserID = ?";
        try {
            st = JDBC.getConnectionWithSqlJdbc().prepareStatement(sql);
            st.setInt(1, roleId);
            st.setInt(2, accountId);
            int affectedRow = st.executeUpdate();
            if (affectedRow > 0) {
                return 1;
            }
        } catch (Exception ex) {
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

        try {
            List<User> users = adminDAO.getUsers(1);
            for (User user : users) {
                System.out.println(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
