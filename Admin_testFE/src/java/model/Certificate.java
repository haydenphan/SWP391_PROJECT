package model;

public class Certificate {
    private int certificateID;
    private int learnerID;
    private String learnerName;
    private String instructorName;
    private String courseName;
    private String certificateUrl;

    // Constructor for new Certificate without ID
    public Certificate(int learnerID, String learnerName, String instructorName, String courseName, String certificateUrl) {
        this.learnerID = learnerID;
        this.learnerName = learnerName;
        this.instructorName = instructorName;
        this.courseName = courseName;
        this.certificateUrl = certificateUrl;
    }

    // Constructor with all fields including ID
    public Certificate(int certificateID, int learnerID, String learnerName, String instructorName, String courseName, String certificateUrl) {
        this.certificateID = certificateID;
        this.learnerID = learnerID;
        this.learnerName = learnerName;
        this.instructorName = instructorName;
        this.courseName = courseName;
        this.certificateUrl = certificateUrl;
    }

    // Getters and Setters
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

    public String getLearnerName() {
        return learnerName;
    }

    public void setLearnerName(String learnerName) {
        this.learnerName = learnerName;
    }

    public String getInstructorName() {
        return instructorName;
    }

    public void setInstructorName(String instructorName) {
        this.instructorName = instructorName;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCertificateUrl() {
        return certificateUrl;
    }

    public void setCertificateUrl(String certificateUrl) {
        this.certificateUrl = certificateUrl;
    }
}
