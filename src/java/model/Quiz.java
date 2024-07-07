package model;

import java.time.LocalDateTime;
import java.util.Date;

public class Quiz {
    private int quizId;
    private int sectionId;
    private String quizName;
    private  boolean isGraded;           
    private LocalDateTime createdDate;
    private int sectionID;
    private String sectionName;
    private int submissionID;
    private Date submissionDate;
    
    
    // Default constructor
    public Quiz() {}

    // Parameterized constructor
    public Quiz(int sectionId, String quizName, boolean isGraded, LocalDateTime createdDate) {
        this.sectionId = sectionId;
        this.quizName = quizName;
        this.isGraded = isGraded;
        this.createdDate = createdDate;
    }

    // Getters and Setters
    public int getQuizId() {
        return quizId;
    }

    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }

    public int getSectionId() {
        return sectionId;
    }

    public void setSectionId(int sectionId) {
        this.sectionId = sectionId;
    }

    public String getQuizName() {
        return quizName;
    }

    public void setQuizName(String quizName) {
        this.quizName = quizName;
    }

    public boolean isGraded() {
        return isGraded;
    }

    public void setGraded(boolean graded) {
        isGraded = graded;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }

    public int getSectionID() {
        return sectionID;
    }

    public void setSectionID(int sectionID) {
        this.sectionID = sectionID;
    }

    public String getSectionName() {
        return sectionName;
    }

    public void setSectionName(String sectionName) {
        this.sectionName = sectionName;
    }

    public int getSubmissionID() {
        return submissionID;
    }

    public void setSubmissionID(int submissionID) {
        this.submissionID = submissionID;
    }

    public Date getSubmissionDate() {
        return submissionDate;
    }

    public void setSubmissionDate(Date submissionDate) {
        this.submissionDate = submissionDate;
    }

    @Override
    public String toString() {
        return "Quiz{" +
                "quizId=" + quizId +
                ", sectionId=" + sectionId +
                ", quizName='" + quizName + '\'' +
                ", isGraded=" + isGraded +
                ", createdDate=" + createdDate +
                '}';
    }
}
