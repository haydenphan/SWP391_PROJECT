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

    @Override
    public String toString() {
        return "Course{" + "CourseID=" + CourseID + ", CourseName=" + CourseName + ", Description=" + Description + ", CreatedBy=" + CreatedBy + ", CreatedDate=" + CreatedDate + ", IsPublished=" + IsPublished + ", SubcategoryID=" + SubcategoryID + ", TotalEnrolled=" + TotalEnrolled + ", LastUpdate=" + LastUpdate + ", Requirements=" + Requirements + '}';
    }
}
