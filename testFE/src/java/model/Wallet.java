package model;

public class Wallet {

    private int WalletID;
    private int userID;
    private double Balance;

    public Wallet(int WalletID, int userID, double Balance) {
        this.WalletID = WalletID;
        this.userID = userID;
        this.Balance = Balance;
    }

    public Wallet() {
    }

    public int getWalletID() {
        return WalletID;
    }

    public void setWalletID(int WalletID) {
        this.WalletID = WalletID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public double getBalance() {
        return Balance;
    }

    public void setBalance(double Balance) {
        this.Balance = Balance;
    }

    @Override
    public String toString() {
        return "Wallet{" + "WalletID=" + WalletID + ", userID=" + userID + ", Balance=" + Balance + '}';
    }

}
