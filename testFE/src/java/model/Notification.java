package model;

import com.google.gson.TypeAdapter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Notification {
    private int id;
    private int userId;
    private String message;
    private String type;
    private LocalDateTime timeStamp;
    private String target;
    private int targetId;
    private boolean isRead;

    public Notification(int id, int userId, String message, String type, LocalDateTime timeStamp, String target, int targetId, boolean isRead) {
        this.id = id;
        this.userId = userId;
        this.message = message;
        this.type = type;
        this.timeStamp = timeStamp;
        this.target = target;
        this.targetId = targetId;
        this.isRead = isRead;
    }

    public Notification() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public LocalDateTime getTimeStamp() {
        return timeStamp;
    }

    public void setTimeStamp(LocalDateTime timeStamp) {
        this.timeStamp = timeStamp;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public int getTargetId() {
        return targetId;
    }

    public void setTargetId(int targetId) {
        this.targetId = targetId;
    }

    public boolean isIsRead() {
        return isRead;
    }

    public void setIsRead(boolean isRead) {
        this.isRead = isRead;
    }
    
    // toString method
    @Override
    public String toString() {
        return "Notification{" +
                "id=" + id +
                ", userId='" + userId + '\'' +
                ", message='" + message + '\'' +
                ", type='" + type + '\'' +
                ", timeStamp=" + timeStamp +
                ", target='" + target + '\'' +
                ", targetId='" + targetId + '\'' +
                ", isRead=" + isRead +
                '}';
    }
}

