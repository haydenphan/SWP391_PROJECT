package model;

import java.time.LocalDateTime;

public class InstructorCertificates {

    private int certificateID;
    private int approvalID;
    private String certificateUrl;
    private LocalDateTime UploadDate;

    public int getApprovalID() {
        return approvalID;
    }

    public void setApprovalID(int approvalID) {
        this.approvalID = approvalID;
    }
    
    public InstructorCertificates() {
    }

    public InstructorCertificates(int certificateID, int approvalID, String certificateUrl, LocalDateTime UploadDate) {
        this.certificateID = certificateID;
        this.approvalID = approvalID;
        this.certificateUrl = certificateUrl;
        this.UploadDate = UploadDate;
    }

    public int getCertificateID() {
        return certificateID;
    }

    public void setCertificateID(int certificateID) {
        this.certificateID = certificateID;
    }

    public String getCertificateUrl() {
        return certificateUrl;
    }

    public void setCertificateUrl(String certificateUrl) {
        this.certificateUrl = certificateUrl;
    }

    public LocalDateTime getUploadDate() {
        return UploadDate;
    }

    public void setUploadDate(LocalDateTime UploadDate) {
        this.UploadDate = UploadDate;
    }

    @Override
    public String toString() {
        return "InstructorCertificates{" + "certificateID=" + certificateID + ", approvalID=" + approvalID + ", certificateUrl=" + certificateUrl + ", UploadDate=" + UploadDate + '}';
    }
}
