package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import java.util.List;

import model.Quiz;

public class QuizDAO {

    public static void createQuiz(Quiz quiz) {
        String sql = "INSERT INTO Quizzes (SectionID, QuizName, IsGraded, CreatedDate) VALUES (?, ?, ?, ?)";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, quiz.getSectionId());
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

    public static List<Quiz> getQuizzesBySectionId(int sectionId) {
        String sql = "SELECT * FROM Quizzes WHERE SectionID = ?";
        List<Quiz> quizzes = new ArrayList<>();
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, sectionId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Quiz quiz = new Quiz();
                quiz.setQuizId(rs.getInt("QuizID"));
                quiz.setSectionId(rs.getInt("SectionID"));
                quiz.setQuizName(rs.getString("QuizName"));
                quiz.setGraded(rs.getBoolean("IsGraded"));
                quizzes.add(quiz);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return quizzes;
    }

    public static boolean deleteQuizById(int quizId) {
        String sql = "DELETE FROM Quizzes WHERE QuizID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, quizId);
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Quiz deleted successfully.");
                return true;
            } else {
                System.out.println("No quiz found with ID: " + quizId);
                return false;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        } catch (Exception ex) {
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public static void main(String[] args) {
        List<Quiz> list = QuizDAO.getQuizzesBySectionId(3);
        for (Quiz quiz : list) {
            System.out.println(quiz.toString());
        }
    }
}