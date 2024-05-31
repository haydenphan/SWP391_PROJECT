package utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public class PasswordUtils {
    private static final String HASH_ALGORITHM = "SHA-256";
    private static final int SALT_LENGTH = 16; // Length of salt in bytes

    // Generate a random salt
    public static byte[] generateSalt() {
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[SALT_LENGTH];
        random.nextBytes(salt);
        return salt;
    }

    // Hash the password using SHA-256 algorithm and salt
    public static String hashPassword(String password, byte[] salt) throws NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance(HASH_ALGORITHM);
        digest.reset();
        digest.update(salt);
        byte[] hashedBytes = digest.digest(password.getBytes());
        return bytesToHex(hashedBytes);
    }

    // Convert byte array to hexadecimal string
    private static String bytesToHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }

    // Verify password by hashing the input password with the stored salt and comparing the result
    public static boolean verifyPassword(String inputPassword, byte[] storedSalt, String storedHashedPassword)
            throws NoSuchAlgorithmException {
        String hashedInputPassword = hashPassword(inputPassword, storedSalt);
        return hashedInputPassword.equals(storedHashedPassword);
    }
    
    public static void main(String[] args) {
        try {
            // Simulate registration
            String password = "mySecurePassword123";
            byte[] salt = PasswordUtils.generateSalt();
            String hashedPassword = PasswordUtils.hashPassword(password, salt);

            // Simulate login
            String inputPassword = "mySecurePassword123";
            boolean isPasswordCorrect = PasswordUtils.verifyPassword(inputPassword, salt, hashedPassword);

            // Display results
            System.out.println("Hashed Password: " + hashedPassword);
            System.out.println("Is password correct? " + isPasswordCorrect);
        } catch (NoSuchAlgorithmException ex) {
            System.err.println("Error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

}
