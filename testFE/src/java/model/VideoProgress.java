package model;

public class VideoProgress {

    private int userID;
    private int lectureID;
    private int watchedPercentage;
    private int progressID;

    public VideoProgress() {
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getLectureID() {
        return lectureID;
    }

    public void setLectureID(int lectureID) {
        this.lectureID = lectureID;
    }

    public int getWatchedPercentage() {
        return watchedPercentage;
    }

    public void setWatchedPercentage(int watchedPercentage) {
        this.watchedPercentage = watchedPercentage;
    }

    public int getProgressID() {
        return progressID;
    }

    public void setProgressID(int progressID) {
        this.progressID = progressID;
    }

    @Override
    public String toString() {
        return "VideoProgress{" + "userID=" + userID + ", lectureID=" + lectureID + ", watchedPercentage=" + watchedPercentage + ", progressID=" + progressID + '}';
    }

}
