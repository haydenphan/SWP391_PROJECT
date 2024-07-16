
package model;

/**
 *
 * @author quanhd
 */
public class Report {
    private int reportID;
    private int userID;
    private String time;
    private String title;
    private boolean isReaded;
    private boolean isNewComment;
    private String content;
    
    public Report() {
    }

     public Report(int reportID, int userID, String time, String title, String email) {
        this.reportID = reportID;
        this.userID = userID;
        this.time = time;
        this.title = title;

    }
    
    public Report(int reportID, int userID, String time, String title, boolean isReaded, boolean isNewComment, String content) {
        this.reportID = reportID;
        this.userID = userID;
        this.time = time;
        this.title = title;
        this.isReaded = isReaded;
        this.isNewComment = isNewComment;
        this.content = content;
    }

    public Report(int userID, String time, String title, boolean isReaded) {
        this.userID = userID;
        this.time = time;
        this.title = title;
        this.isReaded = isReaded;
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

    public boolean isIsReaded() {
        return isReaded;
    }

    public void setIsReaded(boolean isReaded) {
        this.isReaded = isReaded;
    }


    public boolean isIsNewComment() {
        return isNewComment;
    }

    public void setIsNewComment(boolean isNewComment) {
        this.isNewComment = isNewComment;
    }
    
}

