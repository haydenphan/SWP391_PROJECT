package model;

import java.time.LocalDateTime;

public class CourseFeedback {
    private int feedbackID;
    private String courseID;
    private int userID;
    private int rating; // Rating from 1 to 5
    private String comment;
    private LocalDateTime feedbackDate;

    public CourseFeedback() {
    }

    public CourseFeedback(int feedbackID, String courseID, int userID, int rating, String comment, LocalDateTime feedbackDate) {
        this.feedbackID = feedbackID;
        this.courseID = courseID;
        this.userID = userID;
        this.rating = rating;
        this.comment = comment;
        this.feedbackDate = feedbackDate;
    }

    public int getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(int feedbackID) {
        this.feedbackID = feedbackID;
    }

    public String getCourseID() {
        return courseID;
    }

    public void setCourseID(String courseID) {
        this.courseID = courseID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public LocalDateTime getFeedbackDate() {
        return feedbackDate;
    }

    public void setFeedbackDate(LocalDateTime feedbackDate) {
        this.feedbackDate = feedbackDate;
    }

    @Override
    public String toString() {
        return "CourseFeedback{" +
                "feedbackID=" + feedbackID +
                ", courseID='" + courseID + '\'' +
                ", userID=" + userID +
                ", rating=" + rating +
                ", comment='" + comment + '\'' +
                ", feedbackDate=" + feedbackDate +
                '}';
    }
}