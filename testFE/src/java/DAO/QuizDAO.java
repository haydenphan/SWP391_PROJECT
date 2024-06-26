package DAO;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import java.util.List;

import model.Quiz;

public class QuizDAO {

    public static void createQuiz(Quiz quiz) {
        String sql = "INSERT INTO Quizzes (LectureID, QuizName, IsGraded, CreatedDate) VALUES (?, ?, ?, ?)";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, quiz.getLectureId());
            stmt.setString(2, quiz.getQuizName());
            stmt.setBoolean(3, quiz.isGraded());
            stmt.setObject(4, quiz.getCreatedDate());

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("New quiz added successfully.");
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int quizId = generatedKeys.getInt(1);
                        quiz.setQuizId(quizId);
                        System.out.println("Generated Quiz ID: " + quizId);
                    }
                }
            } else {
                System.out.println("Failed to add new quiz.");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Read a quiz by ID
    public static Quiz getQuizById(int quizId) {
        String sql = "SELECT * FROM Quizzes WHERE QuizID = ?";
        Quiz quiz = null;
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, quizId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                quiz = new Quiz();
                quiz.setQuizId(rs.getInt("QuizID"));
                quiz.setLectureId(rs.getInt("LectureID"));
                quiz.setQuizName(rs.getString("QuizName"));
                quiz.setGraded(rs.getBoolean("IsGraded"));
                quiz.setCreatedDate(rs.getObject("CreatedDate", LocalDateTime.class));
            } else {
                System.out.println("Quiz not found with ID: " + quizId);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return quiz;
    }

    // Read all quizzes
    public static List<Quiz> getAllQuizzes() {
        String sql = "SELECT * FROM Quiz";
        List<Quiz> quizzes = new ArrayList<>();
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz();
                quiz.setQuizId(rs.getInt("QuizID"));
                quiz.setLectureId(rs.getInt("LectureID"));
                quiz.setQuizName(rs.getString("QuizName"));
                quiz.setGraded(rs.getBoolean("IsGraded"));
                quiz.setCreatedDate(rs.getObject("CreatedDate", LocalDateTime.class));
                quizzes.add(quiz);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return quizzes;
    }

    // Update a quiz
    public static void updateQuiz(Quiz quiz) {
        String sql = "UPDATE Quiz SET LectureID = ?, QuizName = ?, IsGraded = ?, CreatedDate = ? WHERE QuizID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, quiz.getLectureId());
            stmt.setString(2, quiz.getQuizName());
            stmt.setBoolean(3, quiz.isGraded());
            stmt.setObject(4, quiz.getCreatedDate());
            stmt.setInt(5, quiz.getQuizId());
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Quiz updated successfully.");
            } else {
                System.out.println("Quiz not found with ID: " + quiz.getQuizId());
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Delete a quiz by ID
    public static void deleteQuiz(int quizId) {
        String sql = "DELETE FROM Quiz WHERE QuizID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, quizId);
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Quiz deleted successfully.");
            } else {
                System.out.println("Quiz not found with ID: " + quizId);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        // Example usage:
        // Create a new quiz
        Quiz newQuiz = new Quiz();
        newQuiz.setLectureId(3);
        newQuiz.setQuizName("Java Basics Quiz");
        newQuiz.setGraded(true);
        newQuiz.setCreatedDate(LocalDateTime.now());
        createQuiz(newQuiz);

    }
}
