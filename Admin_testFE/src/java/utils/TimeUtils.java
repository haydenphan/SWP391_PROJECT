package utils;

import java.time.Duration;
import java.time.LocalDateTime;

public class TimeUtils {

    public static long getTimeAgoInWeeks(LocalDateTime pastDateTime, LocalDateTime currentDateTime) {
        Duration duration = Duration.between(pastDateTime, currentDateTime);
        long weeks = duration.toDays() / 7;
        return weeks;
    }

    public static String getTimeAgo(LocalDateTime pastDateTime) {
        LocalDateTime currentDateTime = LocalDateTime.now();
        Duration duration = Duration.between(pastDateTime, currentDateTime);

        long years = duration.toDays() / 365;
        long months = duration.toDays() / 30;
        long weeks = duration.toDays() / 7;
        long days = duration.toDays();
        long hours = duration.toHours();
        long minutes = duration.toMinutes();

        if (years > 0) {
            return years + " year" + (years > 1 ? "s" : "") + " ago";
        } else if (months > 0) {
            return months + " month" + (months > 1 ? "s" : "") + " ago";
        } else if (weeks > 0) {
            return weeks + " week" + (weeks > 1 ? "s" : "") + " ago";
        } else if (days > 0) {
            return days + " day" + (days > 1 ? "s" : "") + " ago";
        } else if (hours > 0) {
            return hours + " hour" + (hours > 1 ? "s" : "") + " ago";
        } else if (minutes > 0) {
            return minutes + " minute" + (minutes > 1 ? "s" : "") + " ago";
        } else {
            return "just now";
        }
    }

    public static void main(String[] args) {
        LocalDateTime pastDateTime = LocalDateTime.of(2024, 5, 1, 0, 0);
        LocalDateTime currentDateTime = LocalDateTime.of(2024, 6, 3, 0, 0);
        long weeks = getTimeAgoInWeeks(pastDateTime, currentDateTime);
        System.out.println("Time ago in weeks: " + weeks);
    }
}