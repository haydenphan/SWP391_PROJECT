package model;

public class Subcategory {
    private int SubcategoryID;
    private String SubcategoryName;
    private int CategoryID;

    public int getSubcategoryID() {
        return SubcategoryID;
    }

    public void setSubcategoryID(int SubcategoryID) {
        this.SubcategoryID = SubcategoryID;
    }

    public String getSubcategoryName() {
        return SubcategoryName;
    }

    public void setSubcategoryName(String SubcategoryName) {
        this.SubcategoryName = SubcategoryName;
    }

    public Subcategory() {
    }

    public Subcategory(String SubcategoryName) {
        this.SubcategoryName = SubcategoryName;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }
    
    @Override
    public String toString() {
        return "Subcategory{" + "SubcategoryID=" + SubcategoryID + ", SubcategoryName=" + SubcategoryName + '}';
    }    
}