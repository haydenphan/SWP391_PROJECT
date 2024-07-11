package model;

import com.google.gson.annotations.SerializedName;
import java.time.LocalDateTime;
import java.util.Arrays;

public class User {

    @SerializedName("id")
    private int userID;

    @SerializedName("name")
    private String userName;

    private String passwordHash;

    @SerializedName("given_name")
    private String firstName;

    @SerializedName("family_name")
    private String lastName;

    @SerializedName("email")
    private String email;

    private int roleID;
    private LocalDateTime registrationDate;
    private boolean isActive;

    @SerializedName("picture")
    private String avatar;

    private String bio;

    private byte[] storedSalt;

    private int providerID;

    public int getProviderID() {
        return providerID;
    }

    public void setProviderID(int providerID) {
        this.providerID = providerID;
    }

    public byte[] getStoredSalt() {
        return storedSalt;
    }

    public void setStoredSalt(byte[] storedSalt) {
        this.storedSalt = storedSalt;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRole() {
        return roleID;
    }

    public void setRole(int roleID) {
        this.roleID = roleID;
    }

    public LocalDateTime getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(LocalDateTime registrationDate) {
        this.registrationDate = registrationDate;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public User() {

    }

    public User(String userName, String passwordHash, String firstName, String lastName, String email, int roleID, LocalDateTime registrationDate, boolean isActive, String avatar, String bio, byte[] storedSalt) {
        this.userName = userName;
        this.passwordHash = passwordHash;
        this.firstName = (firstName == null ? "" : firstName);
        this.lastName = (lastName == null ? "" : lastName);
        this.email = email;
        this.roleID = roleID;
        this.registrationDate = registrationDate;
        this.isActive = isActive;
        this.avatar = avatar;
        this.bio = bio;
        this.storedSalt = storedSalt;
    }

    @Override
    public String toString() {
        return "User{" + "userID=" + userID + ", userName=" + userName + ", passwordHash=" + passwordHash + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", roleID=" + roleID + ", registrationDate=" + registrationDate + ", isActive=" + isActive + ", avatar=" + avatar + ", bio=" + bio + ", storedSalt=" + Arrays.toString(storedSalt) + '}' + ", providerID=" + providerID;
    }

    public String getRoleName() {
        return (this.roleID == 1 ? "Learner" : "Instructor");
    }
}
