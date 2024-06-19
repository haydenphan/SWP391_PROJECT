package model;

import java.util.Date;

public class Transaction {

    private int TransactionID;
    private User UserID;
    private double Amount;
    private Date TransactionDate;
    private String Status;

    public Transaction(int TransactionID, User UserID, double Amount, Date TransactionDate, String Status) {
        this.TransactionID = TransactionID;
        this.UserID = UserID;
        this.Amount = Amount;
        this.TransactionDate = TransactionDate;
        this.Status = Status;
    }

    public int getTransactionID() {
        return TransactionID;
    }

    public void setTransactionID(int TransactionID) {
        this.TransactionID = TransactionID;
    }

    public User getUserID() {
        return UserID;
    }

    public void setUserID(User UserID) {
        this.UserID = UserID;
    }

    public double getAmount() {
        return Amount;
    }

    public void setAmount(double Amount) {
        this.Amount = Amount;
    }

    public Date getTransactionDate() {
        return TransactionDate;
    }

    public void setTransactionDate(Date TransactionDate) {
        this.TransactionDate = TransactionDate;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    @Override
    public String toString() {
        return "Transaction{" + "TransactionID=" + TransactionID + ", UserID=" + UserID + ", Amount=" + Amount + ", TransactionDate=" + TransactionDate + ", Status=" + Status + '}';
    }

}
