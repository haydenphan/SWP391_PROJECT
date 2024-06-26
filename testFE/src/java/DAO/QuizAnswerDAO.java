package DAO;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class QuizAnswerDAO {

    // Create a new quiz answer
    public static void addQuizAnswer(int questionID, String answerText, boolean isCorrect) {
        String sql = "INSERT INTO QuizAnswers (QuestionID, AnswerText, isCorrect) VALUES (?, ?,?)";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, questionID);

            stmt.setString(2, answerText);
            stmt.setBoolean(3, isCorrect);
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

    // Read a quiz answer by ID
    public static void getQuizAnswerById(int answerID) {
        String sql = "SELECT * FROM quiz_answers WHERE answer_id = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, answerID);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                int questionID = rs.getInt("question_id");
                String answerText = rs.getString("answer_text");
                boolean isCorrect = rs.getBoolean("is_correct");
                System.out.println("Answer ID: " + answerID
                        + ", Question ID: " + questionID
                        + ", Answer Text: " + answerText
                        + ", Is Correct: " + isCorrect);
            } else {
                System.out.println("Answer not found with ID: " + answerID);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(QuizAnswerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Update a quiz answer
    public static void updateQuizAnswer(int answerID, int questionID, String answerText, boolean isCorrect) {
        String sql = "UPDATE quiz_answers SET question_id = ?, answer_text = ?, is_correct = ? WHERE answer_id = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, questionID);
            stmt.setString(2, answerText);
            stmt.setBoolean(3, isCorrect);
            stmt.setInt(4, answerID);
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Answer updated successfully.");
            } else {
                System.out.println("Answer not found with ID: " + answerID);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(QuizAnswerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Delete a quiz answer by ID
    public static void deleteQuizAnswer(int answerID) {
        String sql = "DELETE FROM quiz_answers WHERE answer_id = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, answerID);
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Answer deleted successfully.");
            } else {
                System.out.println("Answer not found with ID: " + answerID);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(QuizAnswerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        //aadd
        addQuizAnswer(1, "Java is a programming language.", true);

        // Get an answer by ID
    }
}
