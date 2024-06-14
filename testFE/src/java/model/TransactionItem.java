/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Thunguyet
 */
public class TransactionItem {
    private Course Course;
    private double Price;

    public TransactionItem(Course Course, double Price) {
        this.Course = Course;
        this.Price = Price;
    }

    public Course getCourse() {
        return Course;
    }

    public void setCourse(Course Course) {
        this.Course = Course;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

    @Override
    public String toString() {
        return "TransactionItem{" + "Course=" + Course + ", Price=" + Price + '}';
    }
    
    
}
