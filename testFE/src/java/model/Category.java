package model;

import java.util.List;

public class Category {

    private int categoryID;
    private String name;
    private List<SubCategory> subCategories;

    // Constructor
    public Category() {
    }

    public Category(int categoryID, String name, List<SubCategory> subCategories) {
        this.categoryID = categoryID;
        this.name = name;
        this.subCategories = subCategories;
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
        return "Category{"
                + "categoryID=" + categoryID
                + ", name='" + name + '\''
                + ", subCategories=" + subCategories
                + '}';
    }

    public String getCategoryClass() {
        // Implement logic to return appropriate category class
        // For example, return "c-1" for Data Science, "c-2" for Development, etc.
        return switch (this.getName()) {
            case "Data Science" ->
                "c-1";
            case "Development" ->
                "c-2";
            case "Business" ->
                "c-3";
            case "Life Styles" ->
                "c-4";
            default ->
                "c-others";
        };
    }

}
