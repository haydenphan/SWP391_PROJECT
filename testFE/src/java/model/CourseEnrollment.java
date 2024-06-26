package model;

import java.time.LocalDateTime;

public class CourseEnrollment {
    private int id; // ID column, auto-increment
    private String userID;
    private String courseID;
    private LocalDateTime enrollmentDate;

    public CourseEnrollment(int id, String userID, String courseID, LocalDateTime enrollmentDate) {
        this.id = id;
        this.userID = userID;
        this.courseID = courseID;
        this.enrollmentDate = enrollmentDate;
    }

    public CourseEnrollment(String userID, String courseID, LocalDateTime enrollmentDate) {
        this.userID = userID;
        this.courseID = courseID;
        this.enrollmentDate = enrollmentDate;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getCourseID() {
        return courseID;
    }

    public void setCourseID(String courseID) {
        this.courseID = courseID;
    }

    public LocalDateTime getEnrollmentDate() {
        return enrollmentDate;
    }

    public void setEnrollmentDate(LocalDateTime enrollmentDate) {
        this.enrollmentDate = enrollmentDate;
    }
}