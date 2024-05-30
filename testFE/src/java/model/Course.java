package model;
import java.time.LocalDateTime;

public class Course {
    private int CourseID;
    private String CourseName;
    private String Description;
    private int CreatedBy; //Lecturer ID
    private LocalDateTime CreatedDate;
    private boolean IsPublished;
    private int SubcategoryID;
    private int TotalEnrolled;
    private LocalDateTime LastUpdate;
    private String Requirements;
    private String Level;
    private int Ratings;
    private double Price;
    private String Language;
    private int Duration;
    private String BackgroundImage;
    private String Curriculum;

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

    public boolean isIsPublished() {
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

    public void setLevel(String Level) {
        this.Level = Level;
    }

    public void setRatings(int Ratings) {
        this.Ratings = Ratings;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

    public void setLanguage(String Language) {
        this.Language = Language;
    }

    public void setDuration(int Duration) {
        this.Duration = Duration;
    }

    public void setBackgroundImage(String BackgroundImage) {
        this.BackgroundImage = BackgroundImage;
    }

    public void setCurriculum(String Curriculum) {
        this.Curriculum = Curriculum;
    }

    public String getLevel() {
        return Level;
    }

    public int getRatings() {
        return Ratings;
    }

    public double getPrice() {
        return Price;
    }

    public String getLanguage() {
        return Language;
    }

    public int getDuration() {
        return Duration;
    }

    public String getBackgroundImage() {
        return BackgroundImage;
    }

    public String getCurriculum() {
        return Curriculum;
    }

    public Course() {
    }

    public Course(String CourseName, String Description, int CreatedBy, LocalDateTime CreatedDate, boolean IsPublished, int SubcategoryID, int TotalEnrolled, LocalDateTime LastUpdate, String Requirements, String Level, int Ratings, double Price, String Language, int Duration, String BackgroundImage, String Curriculum) {
        this.CourseName = CourseName;
        this.Description = Description;
        this.CreatedBy = CreatedBy;
        this.CreatedDate = CreatedDate;
        this.IsPublished = IsPublished;
        this.SubcategoryID = SubcategoryID;
        this.TotalEnrolled = TotalEnrolled;
        this.LastUpdate = LastUpdate;
        this.Requirements = Requirements;
        this.Level = Level;
        this.Ratings = Ratings;
        this.Price = Price;
        this.Language = Language;
        this.Duration = Duration;
        this.BackgroundImage = BackgroundImage;
        this.Curriculum = Curriculum;
    }

    @Override
    public String toString() {
        return "Course{" + "CourseID=" + CourseID + ", CourseName=" + CourseName + ", Description=" + Description + ", CreatedBy=" + CreatedBy + ", CreatedDate=" + CreatedDate + ", IsPublished=" + IsPublished + ", SubcategoryID=" + SubcategoryID + ", TotalEnrolled=" + TotalEnrolled + ", LastUpdate=" + LastUpdate + ", Requirements=" + Requirements + '}';
    }
}
