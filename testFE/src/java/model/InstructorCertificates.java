package model;

import java.time.LocalDateTime;

public class InstructorCertificates {

    private int certificateID;
    private int userID;
    private String certificateUrl;
    private LocalDateTime UploadDate;

    public InstructorCertificates() {
    }

    public InstructorCertificates(int certificateID, int userID, String certificateUrl, LocalDateTime UploadDate) {
        this.certificateID = certificateID;
        this.userID = userID;
        this.certificateUrl = certificateUrl;
        this.UploadDate = UploadDate;
    }

    public int getCertificateID() {
        return certificateID;
    }

    public void setCertificateID(int certificateID) {
        this.certificateID = certificateID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getCertificateUrl() {
        return certificateUrl;
    }

    public void setCertificateUrl(String certificateUrl) {
        this.certificateUrl = certificateUrl;
    }

    public LocalDateTime getUploadDate() {
        return UploadDate;
    }

    public void setUploadDate(LocalDateTime UploadDate) {
        this.UploadDate = UploadDate;
    }

    @Override
    public String toString() {
        return "InstructorCertificates{" + "certificateID=" + certificateID + ", userID=" + userID + ", certificateUrl=" + certificateUrl + ", UploadDate=" + UploadDate + '}';
    }
}
