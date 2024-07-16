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

    public WalletDAO() {
    }

    public WalletDAO(Connection connection) {
        this.connection = connection;
    }

    public int insert(Wallet wallet) throws Exception {
        String sql = "INSERT INTO Wallet (Balance) VALUES (?)";
        try (PreparedStatement st = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            st.setDouble(1, wallet.getBalance());
            int affectedRows = st.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = st.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1);
                    }
                }
            } else {
                throw new SQLException("Inserting wallet failed, no rows affected.");
            }
        } catch (SQLException e) {
            Logger.getLogger(WalletDAO.class.getName()).log(Level.SEVERE, "Error inserting wallet", e);
            throw e;
        }
        return 0; // or throw an exception if walletID is not generated
    }

    public Wallet getWalletByUserId(int userId) throws Exception {
        Wallet wallet = null;
        String sql = "SELECT w.WalletID, w.Balance, u.UserID "
                + "FROM Wallet w "
                + "JOIN Users u ON w.WalletID = u.WalletID "
                + "WHERE u.UserID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    wallet = new Wallet();
                    wallet.setWalletID(rs.getInt("WalletID"));
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

    public void updateWalletBalance(int walletId, double amount) throws Exception {
        String sql = "UPDATE Wallet SET Balance = Balance + ? WHERE WalletID = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setDouble(1, amount);
            st.setInt(2, walletId);
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
                    User user = new User();
                    user.setUserID(rs.getInt("UserID"));
                    user.setUserName(rs.getString("Username"));
                    user.setPasswordHash(rs.getString("PasswordHash"));
                    user.setFirstName(rs.getString("FirstName"));
                    user.setLastName(rs.getString("LastName"));
                    user.setEmail(rs.getString("Email"));
                    user.setRole(rs.getInt("RoleID"));
                    user.setRegistrationDate(rs.getDate("RegistrationDate").toLocalDate().atStartOfDay());
                    user.setIsActive(rs.getBoolean("IsActive"));
                    user.setAvatar(rs.getString("Avatar"));
                    user.setBio(rs.getString("Bio"));
                    user.setStoredSalt(rs.getBytes("StoredSalt"));
                    return user;
                }
            }
        }
        return null;
    }

    public static void main(String[] args) throws Exception {
        WalletDAO dao = new WalletDAO(JDBC.getConnectionWithSqlJdbc());
        System.out.println(dao.getWalletByUserId(2));
    }
}
