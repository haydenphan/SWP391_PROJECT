/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Thunguyet
 */
public class ProductCart {
    private Course course;
    private int quantity;

    public ProductCart(Course course, int quantity) {
        this.course = course;
        this.quantity = quantity;
    }
    
    public void incrementQuantity(){
        this.quantity++;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Cart{" + "course=" + course + ", quantity=" + quantity + '}';
    }
    
}
