package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class QuizSubmissionDAO {

    public static int saveQuizSubmission(int studentId, int quizId, LocalDateTime submissionDate, String timeSpent) {
        int submissionId = -1;
        String query = "INSERT INTO QuizSubmissions (StudentID, QuizID, SubmissionDate, TimeSpent) VALUES (?, ?, ?, ?)";
        try (Connection connection = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, studentId);
            ps.setInt(2, quizId);
            ps.setTimestamp(3, java.sql.Timestamp.valueOf(submissionDate));
            ps.setString(4, timeSpent); // Save timeSpent as VARCHAR
            ps.executeUpdate();

            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    submissionId = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return submissionId;
    }

    public static List<Integer> getSubmissionIdsByQuizId(int quizId) {
        List<Integer> submissionIds = new ArrayList<>();
        String query = "SELECT SubmissionID FROM QuizSubmissions WHERE QuizID = ?";

        try (Connection connection = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, quizId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    submissionIds.add(rs.getInt("SubmissionID"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return submissionIds;
    }

    public static boolean deleteSubmissionsByQuizId(int quizId) {
        String query = "DELETE FROM QuizSubmissions WHERE QuizID = ?";
        boolean isDeleted = false;

        try (Connection connection = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, quizId);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                isDeleted = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isDeleted;
    }

    public static boolean hasLearnerSubmittedQuiz(int studentId, int quizId) {
        String query = "SELECT COUNT(*) FROM QuizSubmissions WHERE StudentID = ? AND QuizID = ?";
        boolean hasSubmitted = false;

        try (Connection connection = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, studentId);
            ps.setInt(2, quizId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int count = rs.getInt(1);
                    hasSubmitted = (count > 0);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return hasSubmitted;
    }
}
