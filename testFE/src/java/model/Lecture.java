/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author quanhd
 */
public class Lecture extends User{
    private int lectureId;
    private int sectionId;
    private String lectureName;
    private String lectureType;
    private String lectureURL;
    private Date createdDate;
    
    public Lecture() {}

    public Lecture(int lectureId, int sectionId, String lectureName, String lectureType, String lectureURL, Date createdDate) {
        this.lectureId = lectureId;
        this.sectionId = sectionId;
        this.lectureName = lectureName;
        this.lectureType = lectureType;
        this.lectureURL = lectureURL;
        this.createdDate = createdDate;
    }
    
     public int getLectureId() {
        return lectureId;
    }

    public void setLectureId(int lectureId) {
        this.lectureId = lectureId;
    }

    public int getSectionId() {
        return sectionId;
    }

    public void setSectionId(int sectionId) {
        this.sectionId = sectionId;
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

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }
}
