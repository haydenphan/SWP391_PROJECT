package controller;

import java.sql.SQLException;
import DAO.WalletDAO;
import DAO.BankAccountDAO;
import model.BankAccount;
import model.Wallet;

public class WalletController {

    private WalletDAO walletDAO;
    private BankAccountDAO bankAccountDAO;

    public WalletController(WalletDAO walletDAO, BankAccountDAO bankAccountDAO) {
        this.walletDAO = walletDAO;
        this.bankAccountDAO = bankAccountDAO;
    }

    public void withdraw(int userId, double amount) throws SQLException, Exception {
        Wallet wallet = walletDAO.getWalletByUserId(userId);
        if (wallet.getBalance() >= amount) {
            walletDAO.updateWalletBalance(userId, -amount);
            BankAccount bankAccount = bankAccountDAO.getBankAccountByUserId(userId);
            if (bankAccount != null) {
                transferMoneyToBankAccount(bankAccount, amount);
            } else {
                throw new SQLException("Bank account not found");
            }
        } else {
            throw new SQLException("Insufficient balance");
        }
    }

    private void transferMoneyToBankAccount(BankAccount bankAccount, double amount) {
        // Logic để tích hợp với cổng thanh toán hoặc API ngân hàng để chuyển tiền
        // Đây là chỗ placeholder cho logic chuyển tiền thực tế
        System.out.println("Transferring " + amount + " to " + bankAccount.getAccountNumber() + " at " + bankAccount.getBankName());
    }
}