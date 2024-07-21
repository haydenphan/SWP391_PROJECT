package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LectureProgressDAO {

    public static int getLectureProgress(int userID, int lectureID) {
        int watchedPercentage = 0;
        String query = "SELECT WatchedPercentage FROM LectureProgress WHERE UserID = ? AND LectureID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, userID);
            ps.setInt(2, lectureID);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    watchedPercentage = rs.getInt("WatchedPercentage");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return watchedPercentage;
    }

    public static int countCompletedLectures(int userID, int courseID) {
        int completedLectures = 0;
        String query = "SELECT COUNT(*) AS CompletedLectures "
                + "FROM LectureProgress lp "
                + "JOIN Lectures l ON lp.LectureID = l.LectureID "
                + "JOIN CourseSections cs ON l.SectionID = cs.SectionID "
                + "WHERE lp.UserID = ? AND cs.CourseID = ? AND lp.WatchedPercentage >= 80";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, userID);
            ps.setInt(2, courseID);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    completedLectures = rs.getInt("CompletedLectures");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return completedLectures;
    }
    
    public static void main(String[] args) {
        System.out.println(LectureProgressDAO.countCompletedLectures(10, 8));
    }
}
