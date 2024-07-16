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
import model.QuizAnswer;
import model.QuizQuestion;

public class QuizDAO {

    public static int createQuiz(Quiz quiz) {
        String sql = "INSERT INTO Quizzes (SectionID, QuizName, IsGraded, CreatedDate, Duration) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            stmt.setInt(1, quiz.getSectionId());
            stmt.setString(2, quiz.getQuizName());
            stmt.setBoolean(3, quiz.isGraded());
            stmt.setObject(4, quiz.getCreatedDate());
            stmt.setString(5, quiz.getDuration()); // Set duration as MM:SS

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("New quiz added successfully.");
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int quizId = generatedKeys.getInt(1);
                        quiz.setQuizId(quizId);
                        System.out.println("Generated Quiz ID: " + quizId);
                        return quizId;
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
        return -1; // Return -1 if quiz ID is not generated
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

    public static Quiz getQuizById(int quizId) {
    Quiz quiz = null;
    List<QuizQuestion> questions = new ArrayList<>();
    List<QuizAnswer> answers = new ArrayList<>();

    try (Connection connection = JDBC.getConnectionWithSqlJdbc()) {

        // Fetch quiz details including duration
        try (PreparedStatement ps = connection.prepareStatement(
                "SELECT QuizID, QuizName, IsGraded, CreatedDate, Duration "
                + "FROM Quizzes WHERE QuizID = ?")) {
            ps.setInt(1, quizId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    quiz = new Quiz();
                    quiz.setQuizId(rs.getInt("QuizID"));
                    quiz.setQuizName(rs.getString("QuizName"));
                    quiz.setGraded(rs.getBoolean("IsGraded"));
                    quiz.setCreatedDate(rs.getTimestamp("CreatedDate").toLocalDateTime());
                    quiz.setDuration(rs.getString("Duration")); // Set duration
                    quiz.setQuestions(new ArrayList<>()); // Ensure this method exists in the Quiz class
                }
            }
        }

        // Fetch questions for the quiz
        if (quiz != null) {
            try (PreparedStatement ps = connection.prepareStatement(
                    "SELECT QuestionID, QuizID, QuestionText, QuestionType "
                    + "FROM QuizQuestions WHERE QuizID = ?")) {
                ps.setInt(1, quizId);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        QuizQuestion question = new QuizQuestion();
                        question.setQuestionID(rs.getInt("QuestionID"));
                        question.setQuizID(rs.getInt("QuizID"));
                        question.setQuestionText(rs.getString("QuestionText"));
                        question.setQuestionType(rs.getString("QuestionType"));
                        question.setAnswers(new ArrayList<>());
                        questions.add(question);
                    }
                }
            }

            // Fetch answers for the questions
            try (PreparedStatement ps = connection.prepareStatement(
                    "SELECT AnswerID, QuestionID, AnswerText, IsCorrect "
                    + "FROM QuizAnswers WHERE QuestionID IN "
                    + "(SELECT QuestionID FROM QuizQuestions WHERE QuizID = ?)")) {
                ps.setInt(1, quizId);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        QuizAnswer answer = new QuizAnswer();
                        answer.setAnswerID(rs.getInt("AnswerID"));
                        answer.setQuestionID(rs.getInt("QuestionID"));
                        answer.setAnswerText(rs.getString("AnswerText"));
                        answer.setCorrect(rs.getBoolean("IsCorrect"));
                        answers.add(answer);
                    }
                }
            }

            // Map answers to their respective questions
            for (QuizQuestion question : questions) {
                for (QuizAnswer answer : answers) {
                    if (answer.getQuestionID() == question.getQuestionID()) {
                        question.getAnswers().add(answer);
                    }
                }
            }

            quiz.setQuestions(questions); // Ensure this method exists in the Quiz class
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return quiz;
}


    public static void main(String[] args) {
        List<Quiz> list = QuizDAO.getQuizzesBySectionId(3);
        for (Quiz quiz : list) {
            System.out.println(quiz.toString());
        }
    }
}
