package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.CartDetails;
import model.Course;
import model.User;

public class CartDAO {

    private Connection connection;

    public CartDAO(Connection connection) {
        this.connection = connection;
    }

    // Get cart by user ID
    public Cart getCartByUserID(int userID) throws SQLException {
        String query = "SELECT * FROM Cart WHERE UserID = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userID);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                Cart cart = new Cart();
                cart.setCartID(resultSet.getInt("CartID"));
                cart.setUser(new User(userID)); // Assuming User constructor accepts userID
                cart.setTotalAmount(resultSet.getDouble("Total_Amount"));
                return cart;
            }
        }
        return null;
    }

    // Get cart details by cart ID
    public List<CartDetails> getCartDetailsByCartID(int cartID) throws SQLException {
        List<CartDetails> cartDetailsList = new ArrayList<>();
        String query = "SELECT cd.CartID, cd.CourseID, cd.Price, c.CourseName, c.ImageURL FROM dbo.CartDetails cd JOIN dbo.Courses c ON cd.CourseID = c.CourseID WHERE cd.CartID = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, cartID);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                CartDetails details = new CartDetails();
                details.setCart(new Cart(rs.getInt("CartID")));
                details.setCourse(new Course(rs.getInt("CourseID")));
                details.setPrice(rs.getDouble("Price"));

                Course course = new Course();
                course.setCourseID(rs.getInt("CourseID"));
                course.setCourseName(rs.getString("CourseName"));
                course.setImageURL(rs.getString("ImageURL"));

                details.setCourse(course);
                cartDetailsList.add(details);
            }
        }
        return cartDetailsList;
    }

    // Insert new cart and cart details
    public void insertCart(Cart cart, List<CartDetails> cartDetailsList) throws SQLException {
        String insertCartQuery = "INSERT INTO Cart (UserID, Total_Amount) VALUES (?, ?)";
        String insertCartDetailsQuery = "INSERT INTO CartDetails (CartID, CourseID, Price) VALUES (?, ?, ?)";
        try (PreparedStatement cartStatement = connection.prepareStatement(insertCartQuery, PreparedStatement.RETURN_GENERATED_KEYS); PreparedStatement cartDetailsStatement = connection.prepareStatement(insertCartDetailsQuery)) {

            connection.setAutoCommit(false);

            // Insert cart
            cartStatement.setInt(1, cart.getUser().getUserID());
            cartStatement.setDouble(2, cart.getTotalAmount());
            cartStatement.executeUpdate();
            ResultSet generatedKeys = cartStatement.getGeneratedKeys();
            if (generatedKeys.next()) {
                int cartID = generatedKeys.getInt(1);
                cart.setCartID(cartID);

                // Insert cart details
                for (CartDetails details : cartDetailsList) {
                    cartDetailsStatement.setInt(1, cartID);
                    cartDetailsStatement.setInt(2, details.getCourse().getCourseID());
                    cartDetailsStatement.setDouble(3, details.getPrice());
                    cartDetailsStatement.addBatch();
                }
                cartDetailsStatement.executeBatch();
            }

            connection.commit();
        } catch (SQLException e) {
            connection.rollback();
            throw e;
        } finally {
            connection.setAutoCommit(true);
        }
    }

    public void updateCart(Cart cart) throws SQLException {
        String updateCartQuery = "UPDATE Cart SET Total_Amount = ? WHERE CartID = ?";
        try (PreparedStatement cartStatement = connection.prepareStatement(updateCartQuery)) {
            cartStatement.setDouble(1, cart.getTotalAmount());
            cartStatement.setInt(2, cart.getCartID());
            cartStatement.executeUpdate();
        }
    }

    public void addCourseToCart(int cartID, int courseID, double price) throws SQLException {
        String sql = "INSERT INTO CartDetails (cartID, courseID, price) VALUES (?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, cartID);
            statement.setInt(2, courseID);
            statement.setDouble(3, price);
            statement.executeUpdate();
        }
    }

    // Update cart and cart details
    public void updateCartDetails(Cart cart, List<CartDetails> cartDetailsList) throws SQLException {
        String updateCartQuery = "UPDATE Cart SET Total_Amount = ? WHERE CartID = ?";
        String deleteCartDetailsQuery = "DELETE FROM CartDetails WHERE CartID = ?";
        String insertCartDetailsQuery = "INSERT INTO CartDetails (CartID, CourseID, Price) VALUES (?, ?, ?)";
        try (PreparedStatement updateCartStatement = connection.prepareStatement(updateCartQuery); PreparedStatement deleteCartDetailsStatement = connection.prepareStatement(deleteCartDetailsQuery); PreparedStatement insertCartDetailsStatement = connection.prepareStatement(insertCartDetailsQuery)) {

            connection.setAutoCommit(false);

            // Update cart
            updateCartStatement.setDouble(1, cart.getTotalAmount());
            updateCartStatement.setInt(2, cart.getCartID());
            updateCartStatement.executeUpdate();

            // Delete existing cart details
            deleteCartDetailsStatement.setInt(1, cart.getCartID());
            deleteCartDetailsStatement.executeUpdate();

            // Insert new cart details
            for (CartDetails details : cartDetailsList) {
                insertCartDetailsStatement.setInt(1, cart.getCartID());
                insertCartDetailsStatement.setInt(2, details.getCourse().getCourseID());
                insertCartDetailsStatement.setDouble(3, details.getPrice());
                insertCartDetailsStatement.addBatch();
            }
            insertCartDetailsStatement.executeBatch();

            connection.commit();
        } catch (SQLException e) {
            connection.rollback();
            throw e;
        } finally {
            connection.setAutoCommit(true);
        }
    }

    // Delete cart and its details
    public void deleteCart(int cartID) throws SQLException {
        String deleteCartQuery = "DELETE FROM Cart WHERE CartID = ?";
        String deleteCartDetailsQuery = "DELETE FROM CartDetails WHERE CartID = ?";
        try (PreparedStatement deleteCartStatement = connection.prepareStatement(deleteCartQuery); PreparedStatement deleteCartDetailsStatement = connection.prepareStatement(deleteCartDetailsQuery)) {

            connection.setAutoCommit(false);

            // Delete cart details
            deleteCartDetailsStatement.setInt(1, cartID);
            int detailsDeleted = deleteCartDetailsStatement.executeUpdate();

            // Delete cart
            deleteCartStatement.setInt(1, cartID);
            int cartDeleted = deleteCartStatement.executeUpdate();

            connection.commit();

            if (detailsDeleted > 0 && cartDeleted > 0) {
                System.out.println("Cart and cart details deleted successfully.");
            } else {
                System.out.println("No cart or cart details found for deletion.");
            }
        } catch (SQLException e) {
            connection.rollback();
            throw e;
        } finally {
            connection.setAutoCommit(true);
        }
    }
    // Delete cart and its details

    // Delete cart and its details
//public boolean deleteCart1(int cartID) throws SQLException {
//    String deleteCartQuery = "DELETE FROM Cart WHERE CartID = ?";
//    String deleteCartDetailsQuery = "DELETE FROM CartDetails WHERE CartID = ?";
//    try (PreparedStatement deleteCartDetailsStatement = connection.prepareStatement(deleteCartDetailsQuery); PreparedStatement deleteCartStatement = connection.prepareStatement(deleteCartQuery)) {
//
//        connection.setAutoCommit(false);
//
//        // Delete cart details
//        deleteCartDetailsStatement.setInt(1, cartID);
//        int rowsDeletedDetails = deleteCartDetailsStatement.executeUpdate();
//
//        // Delete cart
//        deleteCartStatement.setInt(1, cartID);
//        int rowsDeletedCart = deleteCartStatement.executeUpdate();
//
//        connection.commit();
//
//        // Return true if both deletions were successful
//        return rowsDeletedDetails > 0 && rowsDeletedCart > 0;
//    } catch (SQLException e) {
//        connection.rollback();
//        throw e;
//    } finally {
//        connection.setAutoCommit(true);
//    }
//}
    public double calculateTotal(List<CartDetails> cartDetails) {
        double total = 0;
        for (CartDetails item : cartDetails) {
            total += item.getPrice();
        }
        return total;
    }
}
