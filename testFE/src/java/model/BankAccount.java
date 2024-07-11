package model;

public class BankAccount {

    private int AccountID;
    private int userID;
    private String AccountNumber;
    private String BankName;
    private double Amount;

    public BankAccount(int AccountID, int userID, String AccountNumber, String BankName) {
        this.AccountID = AccountID;
        this.userID = userID;
        this.AccountNumber = AccountNumber;
        this.BankName = BankName;
    }

    public BankAccount(int AccountID, int userID, String AccountNumber, String BankName, double Amount) {
        this.AccountID = AccountID;
        this.userID = userID;
        this.AccountNumber = AccountNumber;
        this.BankName = BankName;
        this.Amount = Amount;
    }

    public BankAccount() {
    }

    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getAccountNumber() {
        return AccountNumber;
    }

    public void setAccountNumber(String AccountNumber) {
        this.AccountNumber = AccountNumber;
    }

    public String getBankName() {
        return BankName;
    }

    public void setBankName(String BankName) {
        this.BankName = BankName;
    }

    public double getAmount() {
        return Amount;
    }

    public void setAmount(double Amount) {
        this.Amount = Amount;
    }

    @Override
    public String toString() {
        return "BankAccount{" + "AccountID=" + AccountID + ", userID=" + userID + ", AccountNumber=" + AccountNumber + ", BankName=" + BankName + ", Amount=" + Amount + '}';
    }
}
