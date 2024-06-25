package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.QuizQuestion;

public class QuizQuestionDAO extends JDBC {

    // Create a question and return the generated question ID
    public static int addQuizQuestion(QuizQuestion question) {
        String sql = "INSERT INTO QuizQuestions (QuizID, QuestionText, QuestionType) VALUES (?, ?, ?)";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            stmt.setInt(1, question.getQuizID());
            stmt.setString(2, question.getQuestionText());
            stmt.setString(3, question.getQuestionType());

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("New question added successfully.");
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1);
                    }
                }
            } else {
                System.out.println("Failed to add new question.");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(QuizQuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1; // Return -1 if question ID is not generated
    }

    // Get all questions for a specific quiz
    public static List<QuizQuestion> getQuizQuestionsByQuizId(int quizId) {
        String sql = "SELECT * FROM QuizQuestions WHERE QuizID = ?";
        List<QuizQuestion> questions = new ArrayList<>();
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, quizId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                QuizQuestion question = new QuizQuestion();
                question.setQuestionID(rs.getInt("QuestionID"));
                question.setQuizID(rs.getInt("QuizID"));
                question.setQuestionText(rs.getString("QuestionText"));
                question.setQuestionType(rs.getString("QuestionType"));
                questions.add(question);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(QuizQuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return questions;
    }
    
    public static boolean deleteAllQuestionsByQuizId(int quizId) throws Exception {
        String sql = "DELETE FROM QuizQuestions WHERE QuizID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, quizId);
            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            Logger.getLogger(QuizAnswerDAO.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
            return false;
        }
    }
    
    public static void main(String[] args) {
        List<QuizQuestion> q = QuizQuestionDAO.getQuizQuestionsByQuizId(7);
        for (QuizQuestion quizQuestion : q) {
            System.out.println(q.toString());
        }
    }
}