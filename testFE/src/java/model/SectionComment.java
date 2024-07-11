package model;

import java.time.LocalDateTime;

public class SectionComment {
    // Attributes corresponding to the columns in SectionComments table
    private int commentID;
    private int sectionID;
    private int userID;
    private User user;
    private String commentText;
    private Integer parentCommentID; // Use Integer for nullable columns
    private Integer repliedToUserID;
    private User repliedToUser;
    private LocalDateTime commentDate; // LocalDateTime for SQL Server datetime
    private int likes;
    private boolean likeStatus = false;
    private Integer viewerID;
    private Integer totalReplies = 0;

    public Integer getTotalReplies() {
        return totalReplies;
    }

    public void setTotalReplies(Integer totalReplies) {
        this.totalReplies = totalReplies;
    }

    public boolean getLikeStatus() {
        return likeStatus;
    }

    public void setLikeStatus(boolean likeStatus) {
        this.likeStatus = likeStatus;
    }

    // Constructors
    public SectionComment() {
        // Default constructor
    }

    public SectionComment(int commentID, int sectionID, int userID, String commentText, Integer parentCommentID,
                          LocalDateTime commentDate) {
        this.commentID = commentID;
        this.sectionID = sectionID;
        this.userID = userID;
        this.commentText = commentText;
        this.parentCommentID = parentCommentID;
        this.commentDate = commentDate;
    }

    public Integer getViewerID() {
        return viewerID;
    }

    public void setViewerID(Integer viewerID) {
        this.viewerID = viewerID;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    
    public Integer getRepliedToUserID() {
        return repliedToUserID;
    }

    public void setRepliedToUserID(Integer repliedToUserID) {
        this.repliedToUserID = repliedToUserID;
    }

    
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public User getRepliedToUser() {
        return repliedToUser;
    }

    public void setRepliedToUser(User repliedToUser) {
        this.repliedToUser = repliedToUser;
    }

    // Getters and Setters (Encapsulation)
    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }

    public int getSectionID() {
        return sectionID;
    }

    public void setSectionID(int sectionID) {
        this.sectionID = sectionID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public Integer getParentCommentID() {
        return parentCommentID;
    }

    public void setParentCommentID(Integer parentCommentID) {
        this.parentCommentID = parentCommentID;
    }

    public LocalDateTime getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(LocalDateTime commentDate) {
        this.commentDate = commentDate;
    }
    // toString method (Optional, for debugging purposes)

    @Override
    public String toString() {
        return "SectionComment{" + "commentID=" + commentID + ", sectionID=" + sectionID + ", userID=" + userID + ", user=" + user + ", commentText=" + commentText + ", parentCommentID=" + parentCommentID + ", repliedToUserID=" + repliedToUserID + ", repliedToUser=" + repliedToUser + ", commentDate=" + commentDate + ", likes=" + likes + ", likeStatus=" + likeStatus + ", viewerID=" + viewerID + ", totalReplies=" + totalReplies + '}';
    }

    
    
}