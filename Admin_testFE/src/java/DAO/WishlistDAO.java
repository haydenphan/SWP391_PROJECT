//package DAO;
//
//import model.Course;
//import model.Wishlist;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//
//public class WishlistDAO {
//    private static final Logger LOGGER = Logger.getLogger(WishlistDAO.class.getName());
//
//    public static List<Wishlist> getWishlistByUserId(int userId) throws SQLException {
//        List<Wishlist> wishlist = new ArrayList<>();
//        String query = "SELECT w.WishlistID, w.UserID, w.CourseID, c.CourseName, c.Price, c.ImageURL " +
//                       "FROM Wishlist w " +
//                       "JOIN Courses c ON w.CourseID = c.CourseID " +
//                       "WHERE w.UserID = ?";
//
//        try (Connection connection = JDBC.getConnectionWithSqlJdbc();
//             PreparedStatement statement = connection.prepareStatement(query)) {
//            statement.setInt(1, userId);
//            ResultSet resultSet = statement.executeQuery();
//
//            while (resultSet.next()) {
//                int wishlistId = resultSet.getInt("WishlistID");
//                int courseId = resultSet.getInt("CourseID");
//                String courseName = resultSet.getString("CourseName");
//                double price = resultSet.getDouble("Price");
//                String imageURL = resultSet.getString("ImageURL");
//
//                Course course = new Course(courseId, courseName, price, imageURL);
//                Wishlist item = new Wishlist(wishlistId, userId, courseId, course);
//                wishlist.add(item);
//            }
//        } catch (SQLException e) {
//            LOGGER.log(Level.SEVERE, "SQL Exception while fetching wishlist", e);
//            throw e;
//        } catch (Exception ex) {
//            Logger.getLogger(WishlistDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return wishlist;
//    }
//
//    public static void addToWishlist(int userId, int courseId) throws SQLException {
//        String query = "INSERT INTO Wishlist (UserID, CourseID) VALUES (?, ?)";
//        try (Connection connection = JDBC.getConnectionWithSqlJdbc();
//             PreparedStatement statement = connection.prepareStatement(query)) {
//            statement.setInt(1, userId);
//            statement.setInt(2, courseId);
//            statement.executeUpdate();
//        } catch (SQLException e) {
//            LOGGER.log(Level.SEVERE, "SQL Exception while adding to wishlist", e);
//            throw e;
//        } catch (Exception ex) {
//            Logger.getLogger(WishlistDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//
//    public static void removeFromWishlist(int userId, int courseId) throws SQLException {
//        String query = "DELETE FROM Wishlist WHERE UserID = ? AND CourseID = ?";
//        try (Connection connection = JDBC.getConnectionWithSqlJdbc();
//             PreparedStatement statement = connection.prepareStatement(query)) {
//            statement.setInt(1, userId);
//            statement.setInt(2, courseId);
//            statement.executeUpdate();
//        } catch (SQLException e) {
//            LOGGER.log(Level.SEVERE, "SQL Exception while removing from wishlist", e);
//            throw e;
//        } catch (Exception ex) {
//            Logger.getLogger(WishlistDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//}
