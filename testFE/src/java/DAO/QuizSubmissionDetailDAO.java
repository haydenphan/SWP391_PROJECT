package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import model.QuizSubmissionDetail;

public class QuizSubmissionDetailDAO {
    private Connection connection;

    public QuizSubmissionDetailDAO(Connection connection) {
        this.connection = connection;
    }

    public void saveQuizSubmissionDetails(List<QuizSubmissionDetail> details) throws SQLException {
        String sql = "INSERT INTO QuizSubmissionDetails (SubmissionID, QuestionID, AnswerID) VALUES (?, ?, ?)";
        PreparedStatement statement = null;

        try {
            statement = connection.prepareStatement(sql);

            for (QuizSubmissionDetail detail : details) {
                statement.setInt(1, detail.getQuizSubmissionID());
                statement.setInt(2, detail.getQuestionID());
                statement.setInt(3, detail.getAnswerID());
                statement.addBatch();
            }

            statement.executeBatch();
        } catch (SQLException e) {
            throw new SQLException("SQL error in saveQuizSubmissionDetails: " + e.getMessage());
        } finally {
            if (statement != null) {
                statement.close();
            }
        }
    }
}
