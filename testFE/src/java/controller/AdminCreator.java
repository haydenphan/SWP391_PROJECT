package controller;

import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import DAO.UserDAO;
import model.User;
import utils.PasswordUtils;

public class AdminCreator {

    public static void main(String[] args) {
        String adminUsername = "admin";
        String adminPassword = "123";
        String adminEmail = "admin@gmail.com";
        String firstName = "Rose";
        String lastName = "James";
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
            userDAO.insert(adminUser);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }
}