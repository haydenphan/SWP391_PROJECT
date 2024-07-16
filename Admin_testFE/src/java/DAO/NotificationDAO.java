package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Notification;

public class NotificationDAO extends DAO<Notification> {

    public void insertNotification(Notification notification) {
        String sql = "INSERT INTO Notifications (UserId, Message, Type, TimeStamp, Target, TargetId, IsRead) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, notification.getUserId());
            st.setString(2, notification.getMessage());
            st.setString(3, notification.getType());
            st.setTimestamp(4, Timestamp.valueOf(notification.getTimeStamp()));
            st.setString(5, notification.getTarget());
            st.setInt(6, notification.getTargetId());
            st.setBoolean(7, notification.isIsRead());

            st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Notification getById(int id) {
        // Your existing getById method implementation
        return null;
    }

    public List<Notification> getAll() {
        // Your existing getAll method implementation
        return null;
    }

    public boolean update(Notification t) {
        // Your existing update method implementation
        return false;
    }

    public boolean delete(Notification t) {
        // Your existing delete method implementation
        return false;
    }

    public List<Notification> getNotificationsForUserSince(LocalDateTime sinceTimestamp, int userID) {
        List<Notification> notifications = new ArrayList<>();
        String sql = "SELECT Id, UserId, Message, Type, TimeStamp, Target, TargetId, IsRead "
                + "FROM Notifications "
                + "WHERE UserId = ? AND TimeStamp >= ? "
                + "ORDER BY TimeStamp DESC";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, userID);
            st.setTimestamp(2, Timestamp.valueOf(sinceTimestamp));
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Notification notification = new Notification();

                    notification.setId(rs.getInt("Id"));
                    notification.setUserId(rs.getInt("UserId")); // Assuming UserId is INT in the database
                    notification.setMessage(rs.getString("Message"));
                    notification.setType(rs.getString("Type"));
                    notification.setTimeStamp(rs.getTimestamp("TimeStamp").toLocalDateTime());
                    notification.setTarget(rs.getString("Target"));
                    notification.setTargetId(rs.getInt("TargetId")); // Assuming TargetId is INT in the database
                    notification.setIsRead(rs.getBoolean("IsRead"));

                    notifications.add(notification);
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return notifications;
    }

    public static boolean markAsRead(int notificationId) {
        String sql = "UPDATE Notifications SET IsRead = 1 WHERE Id = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, notificationId);
            int rowsUpdated = st.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static void main(String args[]) {
        NotificationDAO dao = new NotificationDAO();
        for (Notification n : dao.getNotificationsForUserSince(LocalDateTime.of(2023, 6, 24, 12, 0), 9)) {
            System.out.println(n);
        }
    }

    @Override
    public int insert(Notification t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public boolean hasUnreadCompletionNotification(int userId, String target, int targetId) {
        String sql = "SELECT COUNT(*) FROM Notifications WHERE UserId = ? AND Target = ? AND TargetId = ? AND IsRead = 0";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, userId);
            st.setString(2, target);
            st.setInt(3, targetId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean hasCompletionNotification(int userId, String target, int targetId) {
        String sql = "SELECT COUNT(*) FROM Notifications WHERE UserId = ? AND Target = ? AND TargetId = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, userId);
            st.setString(2, target);
            st.setInt(3, targetId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static int getUnreadNotificationCount(int userId) {
        String sql = "SELECT COUNT(*) FROM Notifications WHERE UserId = ? AND IsRead = 0";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, userId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}