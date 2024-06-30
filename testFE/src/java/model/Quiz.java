package model;

import java.time.LocalDateTime;
import java.util.List;

public class Quiz {
    private int quizId;
    private int sectionId;
    private String quizName;
    private  boolean isGraded;           
    private LocalDateTime createdDate;
private List<QuizQuestion> questions;
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
    public List<QuizQuestion> getQuestions() {
        return questions;
    }

    public void setQuestions(List<QuizQuestion> questions) {
        this.questions = questions;
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