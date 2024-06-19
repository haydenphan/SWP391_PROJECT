/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Thunguyet
 */
public class TransactionDetails {
    private int TransactionDetailsID;
    private Transaction TransactionID;
    private Course CourseID;
    private double Price;

    public TransactionDetails(int TransactionDetailsID, Transaction TransactionID, Course CourseID, double Price) {
        this.TransactionDetailsID = TransactionDetailsID;
        this.TransactionID = TransactionID;
        this.CourseID = CourseID;
        this.Price = Price;
    }

    public TransactionDetails(Course CourseID, double Price) {
        this.CourseID = CourseID;
        this.Price = Price;
    }
    

    public int getTransactionDetailsID() {
        return TransactionDetailsID;
    }

    public void setTransactionDetailsID(int TransactionDetailsID) {
        this.TransactionDetailsID = TransactionDetailsID;
    }

    public Transaction getTransactionID() {
        return TransactionID;
    }

    public void setTransactionID(Transaction TransactionID) {
        this.TransactionID = TransactionID;
    }

    public Course getCourseID() {
        return CourseID;
    }

    public void setCourseID(Course Course) {
        this.CourseID = Course;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

    @Override
    public String toString() {
        return "TransactionDetails{" + "TransactionDetailsID=" + TransactionDetailsID + ", TransactionID=" + TransactionID + ", Course=" + CourseID + ", Price=" + Price + '}';
    }

    
    
}
