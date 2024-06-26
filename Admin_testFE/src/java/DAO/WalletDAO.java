package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;
import model.Wallet;

public class WalletDAO {

    private Connection connection;

    public WalletDAO(Connection connection) {
        this.connection = connection;
    }

    public int insert(Wallet wallet) throws Exception {
        String sql = "INSERT INTO Wallet (UserID, Balance) VALUES (?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, wallet.getUserID());
            st.setDouble(2, wallet.getBalance());
            return st.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(WalletDAO.class.getName()).log(Level.SEVERE, "Error inserting wallet", e);
            throw e;
        }
    }

    public Wallet getWalletByUserId(int userId) throws Exception {
        Wallet wallet = null;
        String sql = "SELECT * FROM Wallet WHERE UserID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    wallet = new Wallet();
                    wallet.setWalletID(rs.getInt("WalletID"));
                    wallet.setUserID(rs.getInt("UserID"));
                    wallet.setBalance(rs.getDouble("Balance"));
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(WalletDAO.class.getName()).log(Level.SEVERE, "Error fetching wallet", e);
            throw e;
        }
        return wallet;
    }

    public void updateWallet(Wallet wallet) throws SQLException {
        String sql = "UPDATE Wallet SET Balance = ? WHERE WalletID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setDouble(1, wallet.getBalance());
            stmt.setInt(2, wallet.getWalletID());
            stmt.executeUpdate();
        }
    }

    public void updateWalletBalance(int userId, double amount) throws Exception {
        String sql = "UPDATE Wallet SET Balance = Balance + ? WHERE UserID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setDouble(1, amount);
            st.setInt(2, userId);
            st.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(WalletDAO.class.getName()).log(Level.SEVERE, "Error updating wallet balance", e);
            throw e;
        }
    }

    public User getUserByRole(int roleId) throws SQLException {
        String sql = "SELECT * FROM Users WHERE RoleID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, roleId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new User(
                            rs.getInt("UserID"),
                            rs.getString("Username"),
                            rs.getString("PasswordHash"),
                            rs.getString("FirstName"),
                            rs.getString("LastName"),
                            rs.getString("Email"),
                            rs.getInt("RoleID"),
                            rs.getDate("RegistrationDate").toLocalDate().atStartOfDay(),
                            rs.getBoolean("IsActive"),
                            rs.getString("Avatar"),
                            rs.getString("Bio"),
                            rs.getBytes("StoredSalt")
                    );
                }
            }
        }
        return null;
    }
}
