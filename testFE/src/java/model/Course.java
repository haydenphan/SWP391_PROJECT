package model;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import utils.NumberUtils;

public class Course {

    private int CourseID;
    private String CourseName;
    private String Description;
    private int CreatedBy; //Lecturer ID
    private LocalDateTime CreatedDate;
    private boolean IsPublished;
    private int SubcategoryID;
    private String SubcategoryName;
    private int TotalEnrolled;
    private LocalDateTime LastUpdate;
    private String Requirements;
    private double price;
    private int languageID;
    private String LanguageName;
    private int LevelID;
    private String LevelName;
    private String imageURL;
    private double averageRating;
    private List<Integer> NumberOfStarRatingList = new ArrayList<>();

    public double avgRatingDisplay(int places){
        return NumberUtils.round(averageRating, places);
    }
    public List<Integer> getNumberOfStarRatingList() {
        return NumberOfStarRatingList;
    }

    public void setNumberOfStarRatingList(List<Integer> NumberOfStarRatingList) {
        this.NumberOfStarRatingList = NumberOfStarRatingList;
    }
    
    public Integer getTotalNumberOfRating(){
        int sum = 0;
        for (int i = 0; i < this.NumberOfStarRatingList.size(); i++) {
            sum += this.NumberOfStarRatingList.get(i);
        }
        return sum;
    }
    public Integer getNumberOfNStarRating(int n){
        return NumberOfStarRatingList.get(n-1);
    }
    public double getPercentageOfNStarRating(int n){
        return (double)this.getNumberOfNStarRating(n)/(double)this.getTotalNumberOfRating()*100;
    }
    public double getAverageRating() {
        return averageRating;
    }

    public void setAverageRating(double averageRating) {
        this.averageRating = averageRating;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getLanguageID() {
        return languageID;
    }

    public void setLanguageID(int languageID) {
        this.languageID = languageID;
    }

    public int getLevelID() {
        return LevelID;
    }

    public void setLevelID(int LevelID) {
        this.LevelID = LevelID;
    }

    public void setCourseID(int courseID) {
        this.CourseID = courseID;
    }

    public void setCourseName(String CourseName) {
        this.CourseName = CourseName;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public void setCreatedBy(int CreatedBy) {
        this.CreatedBy = CreatedBy;
    }

    public void setCreatedDate(LocalDateTime CreatedDate) {
        this.CreatedDate = CreatedDate;
    }

    public void setIsPublished(boolean IsPublished) {
        this.IsPublished = IsPublished;
    }

    public void setSubcategoryID(int SubcategoryID) {
        this.SubcategoryID = SubcategoryID;
    }

    public void setTotalEnrolled(int TotalEnrolled) {
        this.TotalEnrolled = TotalEnrolled;
    }

    public void setLastUpdate(LocalDateTime LastUpdate) {
        this.LastUpdate = LastUpdate;
    }

    public void setRequirements(String Requirements) {
        this.Requirements = Requirements;
    }

    public int getCourseID() {
        return CourseID;
    }

    public String getCourseName() {
        return CourseName;
    }

    public String getDescription() {
        return Description;
    }

    public int getCreatedBy() {
        return CreatedBy;
    }

    public LocalDateTime getCreatedDate() {
        return CreatedDate;
    }

    public boolean IsPublished() {
        return IsPublished;
    }

    public int getSubcategoryID() {
        return SubcategoryID;
    }

    public int getTotalEnrolled() {
        return TotalEnrolled;
    }

    public LocalDateTime getLastUpdate() {
        return LastUpdate;
    }

    public String getRequirements() {
        return Requirements;
    }

    public String getSubcategoryName() {
        return SubcategoryName;
    }

    public void setSubcategoryName(String SubcategoryName) {
        this.SubcategoryName = SubcategoryName;
    }

    public String getLanguageName() {
        return LanguageName;
    }

    public void setLanguageName(String LanguageName) {
        this.LanguageName = LanguageName;
    }

    public String getLevelName() {
        return LevelName;
    }

    public void setLevelName(String LevelName) {
        this.LevelName = LevelName;
    }
    
    

    public Course() {
    }

    public Course(int courseID, String CourseName, String Description, int CreatedBy, LocalDateTime CreatedDate, boolean IsPublished, int SubcategoryID, int TotalEnrolled, LocalDateTime LastUpdate, String Requirements) {
        this.CourseID = courseID;
        this.CourseName = CourseName;
        this.Description = Description;
        this.CreatedBy = CreatedBy;
        this.CreatedDate = CreatedDate;
        this.IsPublished = IsPublished;
        this.SubcategoryID = SubcategoryID;
        this.TotalEnrolled = TotalEnrolled;
        this.LastUpdate = LastUpdate;
        this.Requirements = Requirements;
    }
// New method to get the list of requirements
    public List<String> getRequirementsList() {
        if (Requirements != null && !Requirements.isEmpty()) {
            return Arrays.asList(Requirements.split(",\\s*"));
        } else {
            return Arrays.asList();
        }
    }
    @Override
    public String toString() {
        return "Course{" + "CourseID=" + CourseID + ", CourseName=" + CourseName + ", Description=" + Description + ", CreatedBy=" + CreatedBy + ", CreatedDate=" + CreatedDate + ", IsPublished=" + IsPublished + ", SubcategoryID=" + SubcategoryID + ", SubcategoryName=" + SubcategoryName + ", TotalEnrolled=" + TotalEnrolled + ", LastUpdate=" + LastUpdate + ", Requirements=" + Requirements + ", price=" + price + ", languageID=" + languageID + ", LanguageName=" + LanguageName + ", LevelID=" + LevelID + ", LevelName=" + LevelName + ", imageURL=" + imageURL + ", averageRating=" + averageRating + '}';
    }
}