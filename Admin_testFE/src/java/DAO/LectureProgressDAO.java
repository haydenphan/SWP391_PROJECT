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
}