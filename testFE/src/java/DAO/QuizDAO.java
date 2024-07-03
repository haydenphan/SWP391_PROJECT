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

    public static void createQuiz(Quiz quiz) {
    String sql = "INSERT INTO Quizzes (SectionID, QuizName, IsGraded, CreatedDate, TimeLimitInSeconds) VALUES (?, ?, ?, ?, ?)";
    try (Connection con = JDBC.getConnectionWithSqlJdbc(); 
         PreparedStatement stmt = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
        
        stmt.setInt(1, quiz.getSectionId());
        stmt.setString(2, quiz.getQuizName());
        stmt.setBoolean(3, quiz.isGraded());
        stmt.setObject(4, quiz.getCreatedDate());
        stmt.setInt(5, quiz.getTimeLimitInSeconds()); // Thêm TimeLimitInSeconds vào PreparedStatement

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
    // Phương thức lấy quiz theo ID
    public static Quiz getQuizById(int quizId) {
        Quiz quiz = null;
        String sql = "SELECT * FROM Quizzes WHERE QuizID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, quizId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    quiz = new Quiz();
                    quiz.setQuizId(rs.getInt("QuizID"));
                    quiz.setSectionId(rs.getInt("SectionID"));
                    quiz.setQuizName(rs.getString("QuizName"));
                    quiz.setGraded(rs.getBoolean("IsGraded"));
                    quiz.setCreatedDate(rs.getTimestamp("CreatedDate").toLocalDateTime());

                    // Lấy danh sách câu hỏi của bài kiểm tra
                    List<QuizQuestion> questions = getQuestionsByQuizId(quizId);
                    quiz.setQuestions(questions);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return quiz;
    }

    public static List<QuizQuestion> getQuestionsByQuizId(int quizId) {
        List<QuizQuestion> questions = new ArrayList<>();
        String sql = "SELECT * FROM QuizQuestions WHERE QuizID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, quizId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    QuizQuestion question = new QuizQuestion();
                    question.setQuestionID(rs.getInt("QuestionID"));
                    question.setQuizID(rs.getInt("QuizID"));
                    question.setQuestionText(rs.getString("QuestionText"));
                    question.setQuestionType(rs.getString("QuestionType"));
                    
                    // Lấy danh sách câu trả lời của câu hỏi
                    List<QuizAnswer> answers = getAnswersByQuestionId(question.getQuestionID());
                    question.setAnswers(answers);
                    
                    questions.add(question);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return questions;
    }
    public static List<QuizAnswer> getAnswersByQuestionId(int questionId) {
        List<QuizAnswer> answers = new ArrayList<>();
        String sql = "SELECT * FROM QuizAnswers WHERE QuestionID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, questionId);
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
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(QuizDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return answers;
    }

    public static void main(String[] args) {
    // Test lấy bài kiểm tra theo ID và các câu hỏi của nó
    int quizId = 3;
    Quiz quiz = getQuizById(quizId);
    if (quiz != null) {
        System.out.println("Quiz ID: " + quiz.getQuizId());
        System.out.println("Section ID: " + quiz.getSectionId());
        System.out.println("Quiz Name: " + quiz.getQuizName());
        System.out.println("Graded: " + quiz.isGraded());
        System.out.println("Created Date: " + quiz.getCreatedDate());

        List<QuizQuestion> questions = quiz.getQuestions();
        if (questions != null && !questions.isEmpty()) {
            System.out.println("Quiz Questions:");
            for (QuizQuestion question : questions) {
                System.out.println("Question ID: " + question.getQuestionID());
                System.out.println("Question Text: " + question.getQuestionText());
                System.out.println("Question Type: " + question.getQuestionType());
                List<QuizAnswer> answers = question.getAnswers();
                if (answers != null && !answers.isEmpty()) {
                    for (QuizAnswer answer : answers) {
                        System.out.println("Answer ID: " + answer.getAnswerID());
                        System.out.println("Answer Text: " + answer.getAnswerText());
                        System.out.println("Is Correct: " + answer.isCorrect());
                    }
                }
                System.out.println("------------------------");
            }
        } else {
            System.out.println("No questions found for this quiz.");
        }
    } else {
        System.out.println("Quiz not found for ID: " + quizId);
    }
}
}