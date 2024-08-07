package model;

public class Report {

    private int reportID;
    private int userID;
    private String time;
    private String title;
    private boolean isReaded;
    private String content;

    public Report() {
    }

    public Report(int reportID, int userID, String time, String title, String content) {
        this.reportID = reportID;
        this.userID = userID;
        this.time = time;
        this.title = title;
        this.content = content;
    }

    public Report(int reportID, int userID, String time, String title, boolean isReaded, String content) {
        this.reportID = reportID;
        this.userID = userID;
        this.time = time;
        this.title = title;
        this.isReaded = isReaded;
        this.content = content;
    }

    public Report(int userID, String time, String title, boolean isReaded, String content) {
        this.userID = userID;
        this.time = time;
        this.title = title;
        this.isReaded = isReaded;
        this.content = content;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getReportID() {
        return reportID;
    }

    public void setReportID(int reportID) {
        this.reportID = reportID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public boolean isReaded() {
        return isReaded;
    }

    public void setReaded(boolean isReaded) {
        this.isReaded = isReaded;
    }

    @Override
    public String toString() {
        return "Report{" + "reportID=" + reportID + ", userID=" + userID + ", time=" + time + ", title=" + title + ", isReaded=" + isReaded + ", content=" + content + '}';
    }
}
