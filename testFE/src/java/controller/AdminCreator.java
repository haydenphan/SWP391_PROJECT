package controller;

import DAO.JDBC;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import DAO.UserDAO;
import DAO.WalletDAO;
import model.User;
import model.Wallet;
import utils.PasswordUtils;

public class AdminCreator {

    public static void main(String[] args) throws Exception {
        String adminUsername = "admin2";
        String adminPassword = "123";
        String adminEmail = "admin2@gmail.com";
        String firstName = "Jason";
        String lastName = "Kim";
        int roleID = 3; // Assuming 3 is the role ID for admin

        try {
            byte[] salt = PasswordUtils.generateSalt();
            String hashedPassword = PasswordUtils.hashPassword(adminPassword, salt);

            User adminUser = new User();
            adminUser.setUserName(adminUsername);
            adminUser.setPasswordHash(hashedPassword);
            adminUser.setFirstName(firstName);
            adminUser.setLastName(lastName);
            adminUser.setEmail(adminEmail);
            adminUser.setRole(roleID);
            adminUser.setRegistrationDate(LocalDateTime.now());
            adminUser.setIsActive(true);
            adminUser.setAvatar("/img/avatar-default.png");
            adminUser.setBio("No bio yet");
            adminUser.setStoredSalt(salt);
            adminUser.setProviderID(1);

            UserDAO userDAO = new UserDAO();

            int userID = userDAO.insert(adminUser);

            int walletID = userDAO.getAdminWalletID();

            if (walletID == 0) {
                Wallet uWallet = new Wallet();
                uWallet.setBalance(0);
                WalletDAO wDAO = new WalletDAO(JDBC.getConnectionWithSqlJdbc());
                walletID = wDAO.insert(uWallet);

            }
            userDAO.updateUserWalletID(userID, walletID);
            System.out.println(walletID + "Wallet Status");

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }
}
