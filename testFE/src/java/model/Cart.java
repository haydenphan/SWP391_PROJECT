
package model;

import java.util.List;

public class Cart {

    private int CartID;
    private User user;
    private double totalAmount;
    private List<CartDetails> cartDetails;

    public Cart() {
    }

    public Cart(int CartID) {
        this.CartID = CartID;
    }

    public Cart(int CartID, User user, double totalAmount, List<CartDetails> cartDetails) {
        this.CartID = CartID;
        this.user = user;
        this.totalAmount = totalAmount;
        this.cartDetails = cartDetails;
    }

    public int getCartID() {
        return CartID;
    }

    public void setCartID(int CartID) {
        this.CartID = CartID;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public List<CartDetails> getCartDetails() {
        return cartDetails;
    }

    public void setCartDetails(List<CartDetails> cartDetails) {
        this.cartDetails = cartDetails;
    }

    public boolean isEmpty() {
        return cartDetails == null || cartDetails.isEmpty();
    }

    @Override
    public String toString() {
        return "Cart{" + "CartID=" + CartID + ", user=" + (user != null ? user.getUserID() : "null")
                + ", totalAmount=" + totalAmount + ", cartDetails size=" + (cartDetails != null ? cartDetails.size() : "null") + '}';
    }
}
