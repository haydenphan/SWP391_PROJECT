package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class QuizSubmissionDetailsDAO {
    private Connection connection;

    public QuizSubmissionDetailsDAO(Connection connection) {
        this.connection = connection;
    }

    public void saveAnswer(int submissionID, int questionId, int answerId) {
        String sql = "INSERT INTO QuizSubmissionDetails (SubmissionID, QuestionID, AnswerID) VALUES (?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, submissionID);
            preparedStatement.setInt(2, questionId);
            preparedStatement.setInt(3, answerId);
            preparedStatement.executeUpdate();
            System.out.println("Saved quiz answer details successfully!");
        } catch (SQLException e) {
            System.out.println("Error saving quiz answer details: " + e.getMessage());
        }
    }
}
