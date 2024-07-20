package model;

import java.util.Date;

public class InstructorApprovals {

    private int approvalID;
    private boolean isApproved;
    private Date requestDate;
    private Date approvalDate;
    private int userID;

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }
    
    public InstructorApprovals() {
    }

    public InstructorApprovals(int approvalID, int userID, boolean isApproved, Date requestDate, Date approvalDate) {
        this.approvalID = approvalID;
        this.userID = userID;
        this.isApproved = isApproved;
        this.requestDate = requestDate;
        this.approvalDate = approvalDate;
    }

    public int getApprovalID() {
        return approvalID;
    }

    public void setApprovalID(int approvalID) {
        this.approvalID = approvalID;
    }

    public boolean isIsApproved() {
        return isApproved;
    }

    public void setIsApproved(boolean isApproved) {
        this.isApproved = isApproved;
    }

    public Date getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(Date requestDate) {
        this.requestDate = requestDate;
    }

    public Date getApprovalDate() {
        return approvalDate;
    }

    public void setApprovalDate(Date approvalDate) {
        this.approvalDate = approvalDate;
    }

    @Override
    public String toString() {
        return "InstructorApprovals{" + "approvalID=" + approvalID + ", userID=" + userID + ", isApproved=" + isApproved + ", requestDate=" + requestDate + ", approvalDate=" + approvalDate + '}';
    }

}
