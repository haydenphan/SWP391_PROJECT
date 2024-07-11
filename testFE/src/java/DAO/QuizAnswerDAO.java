package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.QuizAnswer;

public class QuizAnswerDAO {

    // Create a new quiz answer
    public static void addQuizAnswer(QuizAnswer answer) {
        String sql = "INSERT INTO QuizAnswers (QuestionID, AnswerText, IsCorrect) VALUES (?, ?,?)";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, answer.getQuestionID());
            stmt.setString(2, answer.getAnswerText());
            stmt.setBoolean(3, answer.isCorrect());
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("New answer added successfully.");
                ResultSet generatedKeys = stmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int answerID = generatedKeys.getInt(1);
                    System.out.println("Generated Answer ID: " + answerID);
                }
            } else {
                System.out.println("Failed to add new answer.");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(QuizAnswerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static List<QuizAnswer> getAnswersByQuestionId(int questionId) {
        String sql = "SELECT * FROM QuizAnswers WHERE QuestionID = ?";
        List<QuizAnswer> answers = new ArrayList<>();
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, questionId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                QuizAnswer answer = new QuizAnswer();
                answer.setAnswerID(rs.getInt("AnswerID"));
                answer.setQuestionID(rs.getInt("QuestionID"));
                answer.setAnswerText(rs.getString("AnswerText"));
                answer.setCorrect(rs.getBoolean("IsCorrect"));
                answers.add(answer);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(QuizAnswerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return answers;
    }

    public static boolean deleteAllAnswerByQuestionId(int questionId) throws Exception {
        String sql = "DELETE FROM QuizAnswers WHERE QuestionID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, questionId);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            Logger.getLogger(QuizAnswerDAO.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
            return false;
        }
    }
}
