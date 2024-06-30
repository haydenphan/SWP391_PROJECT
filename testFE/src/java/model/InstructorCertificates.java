package model;

import java.time.LocalDateTime;

public class InstructorCertificates {

    private int certificateID;
    private int userID;
    private int courseID;
    private String certificateUrl;
    private LocalDateTime UploadDate;

    public InstructorCertificates() {
    }

    public InstructorCertificates(int certificateID, int userID, int courseID, String certificateUrl, LocalDateTime UploadDate) {
        this.certificateID = certificateID;
        this.userID = userID;
        this.courseID = courseID;
        this.certificateUrl = certificateUrl;
        this.UploadDate = UploadDate;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
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
        return "InstructorCertificates{" + "certificateID=" + certificateID + ", userID=" + userID + ", courseID=" + courseID + ", certificateUrl=" + certificateUrl + ", UploadDate=" + UploadDate + '}';
    }
}