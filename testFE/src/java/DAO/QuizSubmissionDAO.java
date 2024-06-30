package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import model.QuizSubmission;

public class QuizSubmissionDAO {
    private Connection connection;

    public QuizSubmissionDAO(Connection connection) {
        this.connection = connection;
    }

    public int saveQuizSubmission(QuizSubmission submission) throws SQLException {
        String sql = "INSERT INTO QuizSubmissions (StudentID, QuizID, SubmissionDate, time_taken) VALUES (?, ?, ?, ?)";
        
        try (PreparedStatement statement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            statement.setInt(1, submission.getStudentID());
            statement.setInt(2, submission.getQuizID());
            statement.setTimestamp(3, new java.sql.Timestamp(submission.getSubmissionDate().getTime()));
            statement.setInt(4, submission.getTime_taken());

            int affectedRows = statement.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Saving quiz submission failed, no rows affected.");
            }

            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Saving quiz submission failed, no ID obtained.");
                }
            }
        }
    }

    
}
