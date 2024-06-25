/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;

public class CartItem implements Serializable {

    private int CartItem_id;
    private Course course;
    private double price;
    private int quantity;

    public CartItem(int CartItem_id, Course course, double price, int quantity) {
        this.CartItem_id = CartItem_id;
        this.course = course;
        this.price = price;
        this.quantity = quantity;
    }

    public CartItem() {
    }

    public int getCartItem_id() {
        return CartItem_id;
    }

    public void setCartItem_id(int CartItem_id) {
        this.CartItem_id = CartItem_id;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "CartItem{" + "CartItem_id=" + CartItem_id + ", course=" + course + ", quantity=" + quantity + ", price=" + price + '}';
    }

}