/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDate;

/**
 *
 * @author tuan6
 */
public class User {
    private int UserID;
    private String Username;
    private String PasswordHash;
    private String FirstName;
    private String LastName;
    private String Email;
    private int RoleID;
    private String RegistrationDate;
    private int IsActive;
    private String Avatar;
    private String Bio;

    public User(int UserID, String Username, String PasswordHash, String FirstName, String LastName, String Email, int RoleID, String RegistrationDate, int IsActive, String Avatar, String Bio) {
        this.UserID = UserID;
        this.Username = Username;
        this.PasswordHash = PasswordHash;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Email = Email;
        this.RoleID = RoleID;
        this.RegistrationDate = RegistrationDate;
        this.IsActive = IsActive;
        this.Avatar = Avatar;
        this.Bio = Bio;
    }
    
    public User(){        
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPasswordHash() {
        return PasswordHash;
    }

    public void setPasswordHash(String PasswordHash) {
        this.PasswordHash = PasswordHash;
    }

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public int getRoleID() {
        return RoleID;
    }

    public void setRoleID(int RoleID) {
        this.RoleID = RoleID;
    }

    public String getRegistrationDate() {
        return RegistrationDate;
    }

    public void setRegistrationDate(String RegistrationDate) {
        this.RegistrationDate = RegistrationDate;
    }

    public int getIsActive() {
        return IsActive;
    }

    public void setIsActive(int IsActive) {
        this.IsActive = IsActive;
    }

    public String getAvatar() {
        return Avatar;
    }

    public void setAvatar(String Avatar) {
        this.Avatar = Avatar;
    }

    public String getBio() {
        return Bio;
    }

    public void setBio(String Bio) {
        this.Bio = Bio;
    }

    @Override
    public String toString() {
        return "User{" + "UserID=" + UserID + ", Username=" + Username + ", PasswordHash=" + PasswordHash + ", FirstName=" + FirstName + ", LastName=" + LastName + ", Email=" + Email + ", RoleID=" + RoleID + ", RegistrationDate=" + RegistrationDate + ", IsActive=" + IsActive + ", Avatar=" + Avatar + ", Bio=" + Bio + '}';
    }
    
}
