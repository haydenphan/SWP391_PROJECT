package controller;

import DAO.JDBC;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import DAO.UserDAO;
import DAO.WalletDAO;
import model.User;
import model.Wallet;
import utils.PasswordUtils;

public class LearnerCreator {

    public static void main(String[] args) throws Exception {
        // Learner 1 details
        String learner1Username = "learner1";
        String learner1Password = "learner123";
        String learner1Email = "learner1@gmail.com";
        String learner1FirstName = "John";
        String learner1LastName = "Doe";
        String learner1Avatar = "https://res.cloudinary.com/dieoz2rgk/image/upload/v1721541515/efcp7fvabbkm1pskswvk.jpg";

        // Learner 2 details
        String learner2Username = "learner2";
        String learner2Password = "learner123";
        String learner2Email = "learner2@gmail.com";
        String learner2FirstName = "Jane";
        String learner2LastName = "Smith";
        String learner2Avatar = "https://res.cloudinary.com/dieoz2rgk/image/upload/v1721541516/idwaudkg9teofaagmvgs.jpg";

        createLearner(learner1Username, learner1Password, learner1Email, learner1FirstName, learner1LastName, learner1Avatar);
        createLearner(learner2Username, learner2Password, learner2Email, learner2FirstName, learner2LastName, learner2Avatar);
    }

    private static void createLearner(String username, String password, String email, String firstName, String lastName, String avatar) throws Exception {
        int roleID = 1; // Assuming 2 is the role ID for learner

        try {
            byte[] salt = PasswordUtils.generateSalt();
            String hashedPassword = PasswordUtils.hashPassword(password, salt);

            User learnerUser = new User();
            learnerUser.setUserName(username);
            learnerUser.setPasswordHash(hashedPassword);
            learnerUser.setFirstName(firstName);
            learnerUser.setLastName(lastName);
            learnerUser.setEmail(email);
            learnerUser.setRole(roleID);
            learnerUser.setRegistrationDate(LocalDateTime.now());
            learnerUser.setIsActive(true);
            learnerUser.setAvatar(avatar);
            learnerUser.setBio("No bio yet");
            learnerUser.setStoredSalt(salt);
            learnerUser.setProviderID(1);

            UserDAO userDAO = new UserDAO();

            int userID = userDAO.insert(learnerUser);
            System.out.println("Learner created with User ID: " + userID);

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }
}
