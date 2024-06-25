package model;

public class QuizQuestion {
   
    private int questionID;
    private int quizID;
    private String questionText;
    private String questionType;

    // Constructors
    public QuizQuestion() {
    }

    public QuizQuestion(int questionID, int quizID, String questionText, String questionType) {
        this.questionID = questionID;
        this.quizID = quizID;
        this.questionText = questionText;
        this.questionType = questionType;
    }
    

    // Getters and Setters
    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public int getQuizID() {
        return quizID;
    }

    public void setQuizID(int quizID) {
        this.quizID = quizID;
    }

    public String getQuestionText() {
        return questionText;
    }

    public void setQuestionText(String questionText) {
        this.questionText = questionText;
    }

    public String getQuestionType() {
        return questionType;
    }

    public void setQuestionType(String questionType) {
        this.questionType = questionType;
    }

    // toString method for debugging or logging purposes
    @Override
    public String toString() {
        return "Question{" +
                "questionID=" + questionID +
                ", quizID=" + quizID +
                ", questionText='" + questionText + '\'' +
                ", questionType='" + questionType + '\'' +
                '}';
    }
}