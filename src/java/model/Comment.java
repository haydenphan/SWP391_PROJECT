
package model;

/**
 *
 * @author quanhd
 */

public class Comment {
    public int id;
    public int reportId;
    public boolean isReply;
    public String content;
    public String time;

    public Comment() {
    }

    public Comment(int id, int reportId, boolean isReply, String content, String time) {
        this.id = id;
        this.reportId = reportId;
        this.isReply = isReply;
        this.content = content;
        this.time = time;
    }
    
    public Comment(boolean isReply, String content, String time) {
        this.isReply = isReply;
        this.content = content;
        this.time = time;
    }
    
    public Comment(int reportId, boolean isReply, String content, String time) {
        this.reportId = reportId;
        this.isReply = isReply;
        this.content = content;
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getReportId() {
        return reportId;
    }

    public void setReportId(int reportId) {
        this.reportId = reportId;
    }

    public boolean IsReply() {
        return isReply;
    }

    public void setIsReply(boolean isReply) {
        this.isReply = isReply;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
    
}
