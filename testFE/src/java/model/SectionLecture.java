package model;

import java.time.LocalDateTime;
import java.util.List;

public class SectionLecture {

    private int lectureID;
    private int sectionID;
    private String lectureName;
    private String lectureURL;
    private LocalDateTime createdDate;
    private String lectureDescription;
    private List<LectureMaterial> lectureMaterials;

    public String getLectureDescription() {
        return lectureDescription;
    }

    public void setLectureDescription(String lectureDescription) {
        this.lectureDescription = lectureDescription;
    }
    
    // Constructor
    public SectionLecture() {
    }

    public SectionLecture(int lectureID, int sectionID, String lectureName, String lectureDescription, String lectureURL, LocalDateTime createdDate, List<LectureMaterial> lectureMaterials) {
        this.lectureID = lectureID;
        this.sectionID = sectionID;
        this.lectureName = lectureName;
        this.lectureDescription = lectureDescription;
        this.lectureURL = lectureURL;
        this.createdDate = createdDate;
        this.lectureMaterials = lectureMaterials;
    }

    // Getters and Setters
    public int getLectureID() {
        return lectureID;
    }

    public void setLectureID(int lectureID) {
        this.lectureID = lectureID;
    }

    public int getSectionID() {
        return sectionID;
    }

    public void setSectionID(int sectionID) {
        this.sectionID = sectionID;
    }

    public String getLectureName() {
        return lectureName;
    }

    public void setLectureName(String lectureName) {
        this.lectureName = lectureName;
    }

    public String getLectureURL() {
        return lectureURL;
    }

    public void setLectureURL(String lectureURL) {
        this.lectureURL = lectureURL;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }

    public List<LectureMaterial> getLectureMaterials() {
        return lectureMaterials;
    }

    public void setLectureMaterials(List<LectureMaterial> lectureMaterials) {
        this.lectureMaterials = lectureMaterials;
    }
    
    // Override toString() method for debugging
    @Override
    public String toString() {
        return "SectionLecture{"
                + "lectureID=" + lectureID
                + ", sectionID=" + sectionID
                + ", lectureName='" + lectureName + '\''
                + ", lectureURL='" + lectureURL + '\''
                + ", createdDate=" + createdDate + '\''
                + ", lectureDescription=" + lectureDescription + '\''
                + ", materials=" + lectureMaterials 
                + '}';
    }
}
