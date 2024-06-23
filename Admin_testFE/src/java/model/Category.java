package model;

import java.util.List;

public class Category {
    private int categoryID;
    private String name;
    private List<SubCategory> subCategories;

    // Constructor
    public Category(int categoryID, String name, List<SubCategory> subCategories) {
        this.categoryID = categoryID;
        this.name = name;
        this.subCategories = subCategories;
    }

    public Category() {
    }
    

    // Getters and Setters
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

    public List<SubCategory> getSubCategories() {
        return subCategories;
    }

    public void setSubCategories(List<SubCategory> subCategories) {
        this.subCategories = subCategories;
    }

    @Override
    public String toString() {
        return "Category{" +
                "categoryID=" + categoryID +
                ", name='" + name + '\'' +
                ", subCategories=" + subCategories +
                '}';
    }
}