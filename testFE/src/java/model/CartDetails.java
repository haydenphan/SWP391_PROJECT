/*
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Thunguyet
 */
public class CartDetails {

    private int cartDetailsID;
    private Cart cart;
    private Course course;
    private double price;

    public CartDetails(int cartDetailsID, Cart cart, Course course, double price) {
        this.cartDetailsID = cartDetailsID;
        this.cart = cart;
        this.course = course;
        this.price = price;
    }

    public CartDetails(Cart cart, Course course, double price) {
        this.cart = cart;
        this.course = course;
        this.price = price;
    }
    

    public CartDetails(Cart cart) {
        this.cart = cart;
    }

    public CartDetails() {
    }

    public int getCartDetailsID() {
        return cartDetailsID;
    }

    public void setCartDetailsID(int cartDetailsID) {
        this.cartDetailsID = cartDetailsID;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "CartDetails{" + "cartDetailsID=" + cartDetailsID + ", course=" + (course != null ? course.getCourseID() : "null") + 
               ", price=" + price + '}';
    }

}
