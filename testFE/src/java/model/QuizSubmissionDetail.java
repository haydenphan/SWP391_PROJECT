package model;

public class QuizSubmissionDetail {
    private int quizSubmissionID;
    private int questionID;
    private int answerID;

    public int getQuizSubmissionID() {
        return quizSubmissionID;
    }

    public void setQuizSubmissionID(int quizSubmissionID) {
        this.quizSubmissionID = quizSubmissionID;
    }

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public int getAnswerID() {
        return answerID;
    }

    public void setAnswerID(int answerID) {
        this.answerID = answerID;
    }

    @Override
    public String toString() {
        return "QuizSubmissionDetail{" + "quizSubmissionID=" + quizSubmissionID + ", questionID=" + questionID + ", answerID=" + answerID + '}';
    }
    
}
