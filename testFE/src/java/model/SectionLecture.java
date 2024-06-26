package model;

import java.time.LocalDateTime;

public class SectionLecture {

    private int lectureID;
    private int sectionID;
    private String lectureName;
    private String lectureType;
    private String lectureURL;
    private LocalDateTime createdDate;

    // Constructor
    public SectionLecture() {
    }

    public SectionLecture(int lectureID, int sectionID, String lectureName, String lectureType, String lectureURL, LocalDateTime createdDate) {
        this.lectureID = lectureID;
        this.sectionID = sectionID;
        this.lectureName = lectureName;
        this.lectureType = lectureType;
        this.lectureURL = lectureURL;
        this.createdDate = createdDate;
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

    public String getLectureType() {
        return lectureType;
    }

    public void setLectureType(String lectureType) {
        this.lectureType = lectureType;
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

    // Override toString() method for debugging
    @Override
    public String toString() {
        return "SectionLecture{"
                + "lectureID=" + lectureID
                + ", sectionID=" + sectionID
                + ", lectureName='" + lectureName + '\''
                + ", lectureType='" + lectureType + '\''
                + ", lectureURL='" + lectureURL + '\''
                + ", createdDate=" + createdDate
                + '}';
    }
}
