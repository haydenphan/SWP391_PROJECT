package controller;

import java.sql.SQLException;
import DAO.WalletDAO;

public class PaymentController {

    private WalletDAO walletDAO;
    private static final double ADMIN_PERCENTAGE = 0.30;
    private static final double INSTRUCTOR_PERCENTAGE = 0.70;

    public PaymentController(WalletDAO walletDAO) {
        this.walletDAO = walletDAO;
    }

    public void processPaymentAdmin(int walletID, double amount) throws SQLException, Exception {
        double adminShare = amount * ADMIN_PERCENTAGE;
        walletDAO.updateWalletBalance(walletID, adminShare);
    }

    public void processPaymentInstructor(int walletID, double amount) throws SQLException, Exception {
        double instructorShare = amount * INSTRUCTOR_PERCENTAGE;
        walletDAO.updateWalletBalance(walletID, instructorShare);
    }
}