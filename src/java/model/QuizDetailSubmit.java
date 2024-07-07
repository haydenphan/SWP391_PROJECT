/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author quanhd
 */
public class QuizDetailSubmit {
    int id, quizSubmissionID, questionID, answerID;

    public QuizDetailSubmit() {
    }

    public QuizDetailSubmit(int id, int quizSubmissionID, int questionID, int answerID) {
        this.id = id;
        this.quizSubmissionID = quizSubmissionID;
        this.questionID = questionID;
        this.answerID = answerID;
    }
    
     public QuizDetailSubmit(int questionID, int answerID) {
        this.questionID = questionID;
        this.answerID = answerID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

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
    
}
