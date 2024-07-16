package model;

public class QuizSubmissionDetail {
    private int id;
    private int quizSubmissionId;
    private int questionId;
    private int answerId;

    // Default constructor
    public QuizSubmissionDetail() {}

    // Parameterized constructor
    public QuizSubmissionDetail(int quizSubmissionId, int questionId, int answerId) {
        this.quizSubmissionId = quizSubmissionId;
        this.questionId = questionId;
        this.answerId = answerId;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuizSubmissionId() {
        return quizSubmissionId;
    }

    public void setQuizSubmissionId(int quizSubmissionId) {
        this.quizSubmissionId = quizSubmissionId;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public int getAnswerId() {
        return answerId;
    }

    public void setAnswerId(int answerId) {
        this.answerId = answerId;
    }

    @Override
    public String toString() {
        return "QuizSubmissionDetail{" +
                "id=" + id +
                ", quizSubmissionId=" + quizSubmissionId +
                ", questionId=" + questionId +
                ", answerId=" + answerId +
                '}';
    }
}
