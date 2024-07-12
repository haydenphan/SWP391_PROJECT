package model;

public class Wallet {

    private int WalletID;
    private double Balance;

    public Wallet(int WalletID, double Balance) {
        this.WalletID = WalletID;
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

    public double getBalance() {
        return Balance;
    }

    public void setBalance(double Balance) {
        this.Balance = Balance;
    }

    @Override
    public String toString() {
        return "Wallet{" + "WalletID=" + WalletID + ", Balance=" + Balance + '}';
    }

}
