package DAO;

import model.QuizSubmissionDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

public class QuizSubmissionDetailDAO {

    public static void saveQuizSubmissionDetails(List<QuizSubmissionDetail> submissionDetails) {
        String query = "INSERT INTO QuizSubmissionDetails (QuizSubmissionID, QuestionID, AnswerID) VALUES (?, ?, ?)";
        try (Connection connection = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = connection.prepareStatement(query)) {
            for (QuizSubmissionDetail detail : submissionDetails) {
                ps.setInt(1, detail.getQuizSubmissionId());
                ps.setInt(2, detail.getQuestionId());
                ps.setInt(3, detail.getAnswerId());
                ps.addBatch();
            }
            ps.executeBatch();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static boolean deleteQuizSubmissionDetailsBySubmissionId(int submissionId) throws Exception {
        String query = "DELETE FROM QuizSubmissionDetails WHERE QuizSubmissionID = ?";
        boolean isDeleted = false;

        try (Connection connection = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, submissionId);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                isDeleted = true;
            }
        } catch (Exception e) {
            throw new Exception("Error deleting quiz submission details", e);
        }

        return isDeleted;
    }

    public static boolean deleteQuizSubmissionDetailsByQuestionId(int questionId) throws Exception {
        String query = "DELETE FROM QuizSubmissionDetails WHERE QuestionID = ?";
        boolean isDeleted = false;

        try (Connection connection = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, questionId);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                isDeleted = true;
            }
        } catch (Exception e) {
            throw new Exception("Error deleting quiz submission details by question ID", e);
        }

        return isDeleted;
    }
}
