package model;

import java.util.Date;

public class QuizSubmission {
    private int studentID;
    private int quizID;
    private Date submissionDate;
    private int time_taken; // Thời gian đã dùng trong giây

    public int getStudentID() {
        return studentID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public int getQuizID() {
        return quizID;
    }

    public void setQuizID(int quizID) {
        this.quizID = quizID;
    }

    public Date getSubmissionDate() {
        return submissionDate;
    }

    public void setSubmissionDate(Date submissionDate) {
        this.submissionDate = submissionDate;
    }

    public int getTime_taken() {
        return time_taken;
    }

    public void setTime_taken(int time_taken) {
        this.time_taken = time_taken;
    }

    @Override
    public String toString() {
        return "QuizSubmission{" + "studentID=" + studentID + ", quizID=" + quizID + ", submissionDate=" + submissionDate + ", time_taken=" + time_taken + '}';
    }

    
}
