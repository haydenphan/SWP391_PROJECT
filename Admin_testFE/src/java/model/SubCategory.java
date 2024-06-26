package model;

public class SubCategory {
    private int subCategoryID;
    private int categoryID;
    private String name;

    // Constructor
    public SubCategory() {
    }
    
    public SubCategory(int subCategoryID, int categoryID, String name) {
        this.subCategoryID = subCategoryID;
        this.categoryID = categoryID;
        this.name = name;
    }

    // Getters and Setters
    public int getSubCategoryID() {
        return subCategoryID;
    }

    public void setSubCategoryID(int subCategoryID) {
        this.subCategoryID = subCategoryID;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "SubCategory{" +
                "subCategoryID=" + subCategoryID +
                ", categoryID=" + categoryID +
                ", name='" + name + '\'' +
                '}';
    }
}