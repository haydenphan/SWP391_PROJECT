package model;

import java.util.Date;

public class CourseCompletion {

    private int coursrCompletionID;
    private int userID;
    private int courseID;
    private Date completionDate;
    private String status;

    public CourseCompletion() {
    }

    public CourseCompletion(int coursrCompletionID, int userID, int courseID, Date completionDate, String status) {
        this.coursrCompletionID = coursrCompletionID;
        this.userID = userID;
        this.courseID = courseID;
        this.completionDate = completionDate;
        this.status = status;
    }

    public CourseCompletion(int userID, int courseID, Date completionDate, String status) {
        this.userID = userID;
        this.courseID = courseID;
        this.completionDate = completionDate;
        this.status = status;
    }

    public int getCoursrCompletionID() {
        return coursrCompletionID;
    }

    public void setCoursrCompletionID(int coursrCompletionID) {
        this.coursrCompletionID = coursrCompletionID;
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

    public Date getCompletionDate() {
        return completionDate;
    }

    public void setCompletionDate(Date completionDate) {
        this.completionDate = completionDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "CourseCompletion{" + "coursrCompletionID=" + coursrCompletionID + ", userID=" + userID + ", courseID=" + courseID + ", completionDate=" + completionDate + ", status=" + status + '}';
    }

}