package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.PasswordUtils;
import model.User;

public class UserDAO extends DAO<User> {
    
    public List<int[]> getMonthlyUserCount(int year) {
        String sql = "SELECT MONTH(RegistrationDate) as Month, RoleID, COUNT(*) as Total "
                + "FROM Users "
                + "WHERE YEAR(RegistrationDate) = ? "
                + "GROUP BY MONTH(RegistrationDate), RoleID";
        List<int[]> monthlyUserCounts = new ArrayList<>();
        for (int i = 0; i < 12; i++) {
            monthlyUserCounts.add(new int[]{0, 0}); // Initialize with [learners, instructors]
        }
        
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, year);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                int month = rs.getInt("Month") - 1;
                int role = rs.getInt("RoleID");
                int total = rs.getInt("Total");
                if (role == 1) {
                    monthlyUserCounts.get(month)[0] = total; // Learners
                } else if (role == 2) {
                    monthlyUserCounts.get(month)[1] = total; // Instructors
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return monthlyUserCounts;
    }
    
    @Override
    public int insert(User t) {
        int userId = 0; // To store the generated UserID
        String sql = "INSERT INTO Users (UserName, PasswordHash, FirstName, LastName, Email, RoleID, RegistrationDate, IsActive, Avatar, Bio, StoredSalt, ProviderID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            
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
            st.setInt(12, t.getProviderID());
            
            int affectedRows = st.executeUpdate();
            
            if (affectedRows > 0) {
                // Retrieve the generated key (UserID)
                try (ResultSet generatedKeys = st.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        userId = generatedKeys.getInt(1);
                    }
                }
            }
            
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return userId;
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

//    public User checkExistedGGAccount(User user) throws Exception {
//        String sql = "SELECT * FROM Users WHERE Email = ? AND PasswordHash = ?";
//
//        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
//            st.setString(1, user.getEmail());
//            st.setString(2, "GG");
//
//            try (ResultSet rs = st.executeQuery()) {
//                if (rs.next()) {
//                    user = new User();
//                    user.setUserID(rs.getInt("UserID"));
//                    user.setUserName(rs.getString("UserName"));
//                    user.setPasswordHash(rs.getString("PasswordHash"));
//                    user.setFirstName(rs.getString("FirstName"));
//                    user.setLastName(rs.getString("LastName"));
//                    user.setEmail(rs.getString("Email"));
//                    user.setRole(rs.getInt("RoleID"));
//                    user.setRegistrationDate(rs.getTimestamp("RegistrationDate").toLocalDateTime());
//                    user.setIsActive(rs.getBoolean("IsActive"));
//                    user.setAvatar(rs.getString("Avatar"));
//                    user.setBio(rs.getString("Bio"));
//                    user.setStoredSalt(rs.getBytes("StoredSalt"));
//                    return user;
//
//                }
//            }
//        } catch (SQLException | ClassNotFoundException ex) {
//            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//        return null;
//    }
    public User checkExistedAccount(User user) throws Exception {
        String sql = "";
        if (user.getProviderID() == 1) {
            sql = "SELECT * FROM Users WHERE (Email = ? OR UserName = ?)";
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
                                user.setProviderID(rs.getInt("ProviderID"));
                                return user;
                            }
                        }
                    }
                }
            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            sql = "SELECT * FROM Users WHERE (Email = ?)";
            try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
                st.setString(1, user.getEmail());
                
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
    
    public static int getAdminId() throws SQLException, ClassNotFoundException {
        int adminId = 0;
        String sql = "SELECT UserID FROM Users WHERE RoleID = ?";
        try (Connection connection = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, 3);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    adminId = rs.getInt("UserID");
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return adminId;
    }
    
    public static int getInstructorIdForCourse(int courseId) throws SQLException, ClassNotFoundException {
        int instructorId = 0;
        String sql = "SELECT CreatedBy FROM Courses WHERE CourseID = ?";
        try (Connection connection = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, courseId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    instructorId = rs.getInt("CreatedBy");
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return instructorId;
    }
    
    public List<Integer> getAllAdminIds() {
        List<Integer> adminIds = new ArrayList<>();
        String sql = "SELECT UserID FROM Users WHERE RoleID = 3";
        
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                adminIds.add(rs.getInt("UserID"));
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return adminIds;
    }
    
    public boolean updateUserWalletID(int userId, int walletID) throws Exception {
        String sql = "UPDATE Users SET WalletID = ? WHERE UserID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, walletID);
            st.setInt(2, userId);
            return st.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    // Method to get walletID for admin users
    public int getAdminWalletID() throws SQLException, ClassNotFoundException {
        int walletID = 0;
        // Modify the SQL query to limit the result to one row using TOP 1 for SQL Server
        String sql = "SELECT TOP 1 WalletID FROM Users WHERE (RoleID = 3 AND WalletID is not null)";
        try (Connection connection = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                walletID = rs.getInt("WalletID");
            }
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return walletID;
    }
    
    public List<User> filterUsers(String role, String banned, String newUser, String topPurchaser) {
        List<User> userList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = JDBC.getConnectionWithSqlJdbc();
            
            StringBuilder query = new StringBuilder("SELECT * FROM Users WHERE 1=1");
            
            if (role != null && !role.equals("all")) {
                query.append(" AND RoleID = ?");
            }
            if (banned != null && !banned.equals("all")) {
                query.append(" AND IsActive = ?");
            }
            if (newUser != null && newUser.equals("1")) {
                query.append(" AND DATEDIFF(day, RegistrationDate, GETDATE()) <= 30");
            }
            
            if (topPurchaser != null && topPurchaser.equals("1")) {
                query = new StringBuilder("SELECT u.*, COUNT(e.UserID) as courseCount FROM Users u ");
                query.append("JOIN CourseEnrollments e ON u.UserID = e.UserID ");
                query.append("WHERE 1=1");
                
                if (role != null && !role.equals("all")) {
                    query.append(" AND u.RoleID = ?");
                }
                if (banned != null && !banned.equals("all")) {
                    query.append(" AND u.IsActive = ?");
                }
                if (newUser != null && newUser.equals("1")) {
                    query.append(" AND DATEDIFF(day, u.RegistrationDate, GETDATE()) <= 30");
                }
                
                query.append(" GROUP BY u.UserID, u.Username, u.PasswordHash, u.FirstName, u.LastName, u.Email, u.RoleID, u.RegistrationDate, u.IsActive, u.Avatar, u.Bio, u.StoredSalt, u.ProviderID ");
                query.append(" ORDER BY courseCount DESC");
            }
            
            ps = conn.prepareStatement(query.toString());
            
            int index = 1;
            if (role != null && !role.equals("all")) {
                ps.setInt(index++, Integer.parseInt(role));
            }
            if (banned != null && !banned.equals("all")) {
                ps.setBoolean(index++, banned.equals("1"));
            }
            
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setUserName(rs.getString("Username"));
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
                user.setProviderID(rs.getInt("ProviderID"));
                userList.add(user);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (ps != null) try {
                ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (conn != null) try {
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return userList;
    }
    
    public void updateUserStatus(int userID, boolean enable) throws Exception {
        String sql = "UPDATE Users SET isActive = ? WHERE userID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setBoolean(1, enable);
            pstmt.setInt(2, userID);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static int countUsersByRole(int roleId) throws Exception {
        String sql = "SELECT COUNT(*) FROM Users WHERE RoleID = ?";
        int count = 0;
        
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, roleId);
            
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    count = rs.getInt(1);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return count;
    }
    
    public static List<User> getTopInstructors() throws Exception {
        List<User> instructors = new ArrayList<>();
        String sql = "SELECT TOP 6 "
                + "u.UserID, u.UserName, u.PasswordHash, u.FirstName, u.LastName, "
                + "u.Email, u.RoleID, u.RegistrationDate, u.IsActive, u.Avatar, u.Bio, "
                + "u.StoredSalt, u.ProviderID, COUNT(e.StudentID) AS StudentCount, "
                + "AVG(f.Rating) AS AvgRating "
                + "FROM Users u "
                + "JOIN Courses c ON u.UserID = c.CreatedBy "
                + "LEFT JOIN CourseEnrollments e ON c.CourseID = e.CourseID "
                + "LEFT JOIN InstructorFeedback f ON u.UserID = f.InstructorID "
                + "WHERE u.RoleID = 2 "
                + "GROUP BY u.UserID, u.UserName, u.PasswordHash, u.FirstName, u.LastName, "
                + "u.Email, u.RoleID, u.RegistrationDate, u.IsActive, u.Avatar, u.Bio, "
                + "u.StoredSalt, u.ProviderID "
                + "ORDER BY StudentCount DESC, AvgRating DESC";
        
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            
            while (rs.next()) {
                User instructor = new User();
                instructor.setUserID(rs.getInt("UserID"));
                instructor.setUserName(rs.getString("UserName"));
                instructor.setPasswordHash(rs.getString("PasswordHash"));
                instructor.setFirstName(rs.getString("FirstName"));
                instructor.setLastName(rs.getString("LastName"));
                instructor.setEmail(rs.getString("Email"));
                instructor.setRole(rs.getInt("RoleID"));
                instructor.setRegistrationDate(rs.getTimestamp("RegistrationDate").toLocalDateTime());
                instructor.setIsActive(rs.getBoolean("IsActive"));
                instructor.setAvatar(rs.getString("Avatar"));
                instructor.setBio(rs.getString("Bio"));
                instructor.setStoredSalt(rs.getBytes("StoredSalt"));
                instructor.setProviderID(rs.getInt("ProviderID"));
                
                instructors.add(instructor);
            }
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        return instructors;
    }
    
    public List<User> getAllInstructors() throws Exception {
        List<User> instructors = new ArrayList<>();
        String sql = "SELECT * FROM Users WHERE roleID = 2";
        
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User instructor = new User();
                instructor.setUserID(rs.getInt("UserID"));
                instructor.setUserName(rs.getString("UserName"));
                instructor.setPasswordHash(rs.getString("PasswordHash"));
                instructor.setFirstName(rs.getString("FirstName"));
                instructor.setLastName(rs.getString("LastName"));
                instructor.setEmail(rs.getString("Email"));
                instructor.setRole(rs.getInt("RoleID"));
                instructor.setRegistrationDate(rs.getTimestamp("RegistrationDate").toLocalDateTime());
                instructor.setIsActive(rs.getBoolean("IsActive"));
                instructor.setAvatar(rs.getString("Avatar"));
                instructor.setBio(rs.getString("Bio"));
                instructor.setStoredSalt(rs.getBytes("StoredSalt"));
                instructor.setProviderID(rs.getInt("ProviderID"));
                
                instructors.add(instructor);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return instructors;
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
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        UserDAO user = new UserDAO();
        System.out.println(user.getAdminId());
//        user.insert(new User("4232", "gwgh", "fgrwgw", "gfaeg", "sgwG", "GFGW", "1", LocalDateTime.now(), true, null, null));
    }
}
