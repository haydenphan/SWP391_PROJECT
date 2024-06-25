package model;

import java.time.LocalDateTime;

public class CourseEnrollment {
    private int id; // ID column, auto-increment
    private int userID;
    private int courseID;
    private LocalDateTime enrollmentDate;

    public CourseEnrollment(int id, int userID, int courseID, LocalDateTime enrollmentDate) {
        this.id = id;
        this.userID = userID;
        this.courseID = courseID;
        this.enrollmentDate = enrollmentDate;
    }

    public CourseEnrollment(int userID, int courseID, LocalDateTime enrollmentDate) {
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

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public LocalDateTime getEnrollmentDate() {
        return enrollmentDate;
    }

    public void setEnrollmentDate(LocalDateTime enrollmentDate) {
        this.enrollmentDate = enrollmentDate;
    }
}