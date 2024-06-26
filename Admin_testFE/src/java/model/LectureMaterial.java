package model;

public class LectureMaterial {

    private int lectureMaterialId;
    private String lectureMaterialUrl;
    private int lectureId;

    public int getLectureId() {
        return lectureId;
    }

    public void setLectureId(int lectureId) {
        this.lectureId = lectureId;
    }

    public int getLectureMaterialId() {
        return lectureMaterialId;
    }

    public void setLectureMaterialId(int lectureMaterialId) {
        this.lectureMaterialId = lectureMaterialId;
    }

    public String getLectureMaterialUrl() {
        return lectureMaterialUrl;
    }

    public void setLectureMaterialUrl(String lectureMaterialUrl) {
        this.lectureMaterialUrl = lectureMaterialUrl;
    }

    public LectureMaterial() {
    }

    public LectureMaterial(int lectureId, String lectureMaterialUrl) {
        this.lectureId = lectureId;
        this.lectureMaterialUrl = lectureMaterialUrl;
    }

    @Override
    public String toString() {
        return "LectureMaterial{" + "lectureMaterialId=" + lectureMaterialId + ", lectureMaterialUrl=" + lectureMaterialUrl + ", lectureId=" + lectureId + '}';
    }
}
