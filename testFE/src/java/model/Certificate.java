package model;

import java.util.Date;

public class Certificate {

    private int certificateID;
    private int learnerID;
    private int instructorID;
    private int courseID;
    private String certificateUrl;
    private Date uploadDate;

    public Date getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(Date uploadDate) {
        this.uploadDate = uploadDate;
    }

    public Certificate() {
    }

    public int getCertificateID() {
        return certificateID;
    }

    public void setCertificateID(int certificateID) {
        this.certificateID = certificateID;
    }

    public int getLearnerID() {
        return learnerID;
    }

    public void setLearnerID(int learnerID) {
        this.learnerID = learnerID;
    }

    public int getInstructorID() {
        return instructorID;
    }

    public void setInstructorID(int instructorID) {
        this.instructorID = instructorID;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public String getCertificateUrl() {
        return certificateUrl;
    }

    public void setCertificateUrl(String certificateUrl) {
        this.certificateUrl = certificateUrl;
    }

    @Override
    public String toString() {
        return "Certificate{" + "certificateID=" + certificateID + ", learnerID=" + learnerID + ", instructorID=" + instructorID + ", courseID=" + courseID + ", certificateUrl=" + certificateUrl + '}';
    }

}
