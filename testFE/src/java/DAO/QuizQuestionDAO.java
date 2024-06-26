package DAO;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class QuizQuestionDAO extends JDBC {

    // Create  question ::::
    public static void addQuizQuestion(int quizID, String questionText, String questionType) {
        String sql = "INSERT INTO quizQuestions (QuizID, QuestionText, QuestionType) VALUES (?, ?, ?)";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            stmt.setInt(1, quizID);
            stmt.setString(2, questionText);
            stmt.setString(3, questionType);

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("New question added successfully.");
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int generatedQuestionID = generatedKeys.getInt(1);
                        System.out.println("Generated Question ID: " + generatedQuestionID);
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
    }

    // Read a quiz question by ID
    public static void getQuizQuestionById(int questionID) {
        String sql = "SELECT * FROM quizQuestions WHERE questionID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, questionID);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                int quizID = rs.getInt("quizId");
                String questionText = rs.getString("question_text");
                String questionType = rs.getString("question_type");
                System.out.println("Question ID: " + questionID
                        + ", Quiz ID: " + quizID
                        + ", Question Text: " + questionText
                        + ", Question Type: " + questionType);
            } else {
                System.out.println("Question not found with ID: " + questionID);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(QuizQuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Update a quiz question
    public static void updateQuizQuestion(int questionID, int quizID, String questionText, String questionType) {
        String sql = "UPDATE quiz_questions SET quiz_id = ?, question_text = ?, question_type = ? WHERE question_id = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, quizID);
            stmt.setString(2, questionText);
            stmt.setString(3, questionType);
            stmt.setInt(4, questionID);
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Question updated successfully.");
            } else {
                System.out.println("Question not found with ID: " + questionID);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(QuizQuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Delete a quiz question by ID
    public static void deleteQuizQuestion(int questionID) {
        String sql = "DELETE FROM quiz_questions WHERE question_id = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, questionID);
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Question deleted successfully.");
            } else {
                System.out.println("Question not found with ID: " + questionID);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(QuizQuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Retrieve all quiz questions
    public static void getAllQuizQuestions() {
        String sql = "SELECT * FROM quizQuestions";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                int questionID = rs.getInt("question_id");
                int quizID = rs.getInt("quiz_id");
                String questionText = rs.getString("question_text");
                String questionType = rs.getString("question_type");
                System.out.println("Question ID: " + questionID
                        + ", Quiz ID: " + quizID
                        + ", Question Text: " + questionText
                        + ", Question Type: " + questionType);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(QuizQuestionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        // Example usage:
        addQuizQuestion(51, "What is Java?", "Multiple Choice");
//        getQuizQuestionById(1);
//        updateQuizQuestion(1, 1, "What is JDBC?", "Multiple Choice");
//        deleteQuizQuestion(1);
//        getAllQuizQuestions();
    }
}
