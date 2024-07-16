package DAO;

import model.QuizSubmissionDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

public class QuizSubmissionDetailDAO {
    public static void saveQuizSubmissionDetails(List<QuizSubmissionDetail> submissionDetails) {
        String query = "INSERT INTO QuizSubmissionDetails (QuizSubmissionID, QuestionID, AnswerID) VALUES (?, ?, ?)";
        try (Connection connection = JDBC.getConnectionWithSqlJdbc();
             PreparedStatement ps = connection.prepareStatement(query)) {
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
}