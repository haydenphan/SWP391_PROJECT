package DAO;

import model.BankAccount;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BankAccountDAO {

    private final Connection connection;

    public BankAccountDAO(Connection connection) {
        this.connection = connection;
    }

    public BankAccount getBankAccountByUserId(int userId) throws SQLException {
        String query = "SELECT * FROM Bank_Account WHERE UserID = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new BankAccount(
                            rs.getInt("AccountID"),
                            rs.getInt("UserID"),
                            rs.getString("Account_Number"),
                            rs.getString("Bank_Name"),
                            rs.getDouble("Amount")
                    );
                }
            }
        }
        return null;
    }

    public void addOrUpdateBankAccount(BankAccount bankAccount) throws SQLException {
        BankAccount existingAccount = getBankAccountByUserId(bankAccount.getUserID());
        if (existingAccount == null) {
            String insertQuery = "INSERT INTO Bank_Account (UserID, Account_Number, Bank_Name, Amount) VALUES (?, ?, ?, ?)";
            try (PreparedStatement stmt = connection.prepareStatement(insertQuery)) {
                stmt.setInt(1, bankAccount.getUserID());
                stmt.setString(2, bankAccount.getAccountNumber());
                stmt.setString(3, bankAccount.getBankName());
                stmt.setDouble(4, bankAccount.getAmount());
                stmt.executeUpdate();
            }
        } else {
            // Check if the existing account number matches the provided one
            if (!existingAccount.getAccountNumber().equals(bankAccount.getAccountNumber())) {
                throw new SQLException("Account number mismatch");
            }
            String updateQuery = "UPDATE Bank_Account SET Bank_Name = ?, Amount = Amount + ? WHERE UserID = ?";
            try (PreparedStatement stmt = connection.prepareStatement(updateQuery)) {
                stmt.setString(1, bankAccount.getBankName());
                stmt.setDouble(2, bankAccount.getAmount());
                stmt.setInt(3, bankAccount.getUserID());
                stmt.executeUpdate();
            }
        }
    }
}