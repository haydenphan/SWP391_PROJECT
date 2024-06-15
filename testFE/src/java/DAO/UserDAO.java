package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.ResultSet;
import utils.PasswordUtils;
import model.User;

public class UserDAO extends DAO<User> {

    @Override
    public int insert(User t) {
        int res = 0;
        String sql = "INSERT INTO Users (UserName, PasswordHash, FirstName, LastName, Email, RoleID, RegistrationDate, IsActive, Avatar, Bio, StoredSalt) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {

            st.setString(1, t.getUserName());
            st.setString(2, t.getPasswordHash());
            st.setString(3, t.getFirstName());
            st.setString(4, t.getLastName());
            st.setString(5, t.getEmail());
            st.setInt(6, t.getRole());
            st.setDate(7, Date.valueOf(t.getRegistrationDate().toLocalDate()));
            st.setBoolean(8, t.isIsActive());
            st.setString(9, t.getAvatar());
            st.setString(10, t.getBio());
            st.setBytes(11, t.getStoredSalt());

            res = st.executeUpdate();

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return res;
    }

    public boolean checkExistedEmail(String email) throws Exception {
        boolean res = false;
        String sql = "SELECT COUNT(*) FROM Users WHERE Email = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, email);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                res = rs.getInt(1) > 0;
            }

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return res;
    }

    public User retExistedEmailAcc(String email) throws Exception {
        User user = null;
        String sql = "SELECT * FROM Users WHERE Email = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, email);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    user = new User();
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
                    return user;

                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        }

        return user;
    }

    public User checkExistedGGAccount(User user) throws Exception {
        String sql = "SELECT * FROM Users WHERE Email = ? AND PasswordHash = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, user.getEmail());
            st.setString(2, "GG");

            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    user = new User();
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
                    return user;

                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public User checkExistedAccount(User user) throws Exception {
        String sql = "SELECT * FROM Users WHERE (Email = ? OR UserName = ?)";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, user.getEmail());
            st.setString(2, user.getUserName());

            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    // User exists, now verify the password
                    String hashedPasswordFromDB = rs.getString("PasswordHash");
                    String enteredPassword = user.getPasswordHash();
                    byte[] storedSalt = rs.getBytes("StoredSalt");

                    if (storedSalt != null) {
                        if (PasswordUtils.verifyPassword(enteredPassword, storedSalt, hashedPasswordFromDB)) {
                            // Passwords match, login successful
                            user = new User();
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
                            return user;
                        }
                    } else {
                        if (enteredPassword.equals(hashedPasswordFromDB)) {
                            user = new User();
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
                            return user;
                        }
                    }

                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public boolean kiemTraTenDangNhap(String tenDangNhap) throws Exception {
        boolean ketQua = false;
        try {
            // Bước 1: tạo kết nối đến CSDL
            Connection con = JDBC.getConnectionWithSqlJdbc();

            // Bước 2: tạo ra đối tượng statement
            String sql = "SELECT * FROM Users WHERE UserName=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, tenDangNhap);

            // Bước 3: thực thi câu lệnh SQL
            System.out.println(sql);
            ResultSet rs = st.executeQuery();

            // Bước 4:
            while (rs.next()) {
                ketQua = true;
            }

            // Bước 5:
            con.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return ketQua;
    }

    public User getUserByUsername(String username) throws Exception {
        User user = null;
        String sql = "SELECT * FROM Users WHERE UserName = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, username);

            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    user = new User();
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
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return user;
    }

    public boolean updateUser(User user) throws Exception {
        boolean result = false;
        String sql = "UPDATE Users SET PasswordHash = ?, StoredSalt = ? WHERE UserID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, user.getPasswordHash());
            st.setBytes(2, user.getStoredSalt());
            st.setInt(3, user.getUserID());

            result = st.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return result;
    }

    public boolean updateUserRole(User user) throws Exception {
        boolean result = false;
        String sql = "UPDATE Users SET RoleID = ? WHERE UserID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, user.getRole());
            st.setInt(2, user.getUserID());
            result = st.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return result;
    }

    public boolean updateUserProfile(User user) {
        String sql = "UPDATE [OnlineLearningV2].[dbo].[Users] SET "
                + "[FirstName] = ?, "
                + "[LastName] = ?, "
                + "[Email] = ?, "
                + "[Bio] = ? "
                + "WHERE [UserID] = ?";

        try (Connection connection = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = connection.prepareStatement(sql)) {

            st.setString(1, user.getFirstName());
            st.setString(2, user.getLastName());
            st.setString(3, user.getEmail());
            st.setString(4, user.getBio());
            st.setInt(5, user.getUserID());

            return st.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean updateUserPassword(User user) throws Exception {
        String sql = "UPDATE Users SET PasswordHash = ?, StoredSalt = ? WHERE UserID = ?";
        try (Connection conn = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getPasswordHash());
            stmt.setBytes(2, user.getStoredSalt());
            stmt.setInt(3, user.getUserID());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateUserAvatar(int userId, String avatarUrl) throws Exception {
        String sql = "UPDATE Users SET Avatar = ? WHERE UserID = ?";

        try (Connection conn = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, avatarUrl);
            stmt.setInt(2, userId);

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public User getUserByID(int id) {
        User user = null;
        String sql = "SELECT * FROM Users WHERE UserID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, id);

            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    user = new User();
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
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return user;
    }

//    public boolean updateGoogleUser(String userId, String lastname, String firstname) throws Exception {
//        String sql = "UPDATE Users SET UserName = ?, FirstName = ?, LastName = ? WHERE UserID = ?";
//        Random rd = new Random();
//        String username = System.currentTimeMillis() + rd.nextInt(1000) + "";
//
//        try (Connection conn = JDBC.getConnectionWithSqlJdbc();
//             PreparedStatement stmt = conn.prepareStatement(sql)) {
//
//            stmt.setString(1, username);
//            stmt.setString(2, firstname);
//            stmt.setString(3, lastname);
//            stmt.setString(4, userId);
//
//            int rowsUpdated = stmt.executeUpdate();
//            return rowsUpdated > 0;
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return false;
//        }
//    }
    public static void main(String[] args) {
        UserDAO user = new UserDAO();
//        user.insert(new User("4232", "gwgh", "fgrwgw", "gfaeg", "sgwG", "GFGW", "1", LocalDateTime.now(), true, null, null));
    }
}
