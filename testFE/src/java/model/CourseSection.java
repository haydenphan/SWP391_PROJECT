package model;

import java.time.LocalDateTime;
import java.util.List;

public class CourseSection {
    private int sectionID;
    private int courseID;
    private String sectionName;
    private int sectionOrder;
    private LocalDateTime createdDate;
    private String sectionDescription;
    private List<SectionLecture> lectures;

    public String getSectionDescription() {
        return sectionDescription;
    }

    public void setSectionDescription(String sectionDescription) {
        this.sectionDescription = sectionDescription;
    }
    
    public List<SectionLecture> getLectures() {
        return lectures;
    }

    public void setLectures(List<SectionLecture> lectures) {
        this.lectures = lectures;
    }

    // Constructor
    public CourseSection() {}

    public CourseSection(int sectionID, int courseID, String sectionName, String sectionDescription, int sectionOrder, LocalDateTime createdDate) {
        this.sectionID = sectionID;
        this.courseID = courseID;
        this.sectionName = sectionName;
        this.sectionDescription = sectionDescription;
        this.sectionOrder = sectionOrder;
        this.createdDate = createdDate;
    }

    // Getters and Setters
    public int getSectionID() {
        return sectionID;
    }

    public void setSectionID(int sectionID) {
        this.sectionID = sectionID;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public String getSectionName() {
        return sectionName;
    }

    public void setSectionName(String sectionName) {
        this.sectionName = sectionName;
    }

    public int getSectionOrder() {
        return sectionOrder;
    }

    public void setSectionOrder(int sectionOrder) {
        this.sectionOrder = sectionOrder;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }

    // Override toString() method for debugging
    @Override
    public String toString() {
        return "CourseSection{" +
                "sectionID=" + sectionID +
                ", courseID=" + courseID +
                ", sectionName='" + sectionName + '\'' +
                ", sectionOrder=" + sectionOrder +
                ", createdDate=" + createdDate +
                ", sectionDescription=" + sectionDescription +
                '}';
    }
}
