package model;

import java.time.LocalDateTime;

public class Quiz {
    private int quizId;
    private int lectureId;
    private String quizName;
    private  boolean isGraded;           
    private LocalDateTime createdDate;

    // Default constructor
    public Quiz() {}

    // Parameterized constructor
    public Quiz(int lectureId, String quizName, boolean isGraded, LocalDateTime createdDate) {
        this.lectureId = lectureId;
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

    public int getLectureId() {
        return lectureId;
    }

    public void setLectureId(int lectureId) {
        this.lectureId = lectureId;
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

    @Override
    public String toString() {
        return "Quiz{" +
                "quizId=" + quizId +
                ", lectureId=" + lectureId +
                ", quizName='" + quizName + '\'' +
                ", isGraded=" + isGraded +
                ", createdDate=" + createdDate +
                '}';
    }
}
