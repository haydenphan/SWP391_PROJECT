package DAO;

import model.QuizSubmissionDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.List;

public class QuizSubmissionDAO {

    public static int saveQuizSubmission(int studentId, int quizId, LocalDateTime submissionDate, String timeSpent) {
    int submissionId = -1;
    String query = "INSERT INTO QuizSubmissions (StudentID, QuizID, SubmissionDate, TimeSpent) VALUES (?, ?, ?, ?)";
    try (Connection connection = JDBC.getConnectionWithSqlJdbc();
         PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
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

    
}
