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
import model.QuizDetailSubmit;

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

    public static boolean isSubmitionQuiz(int studentID, int quizzID) throws Exception {
        String query = "SELECT TOP 1 *\n"
                + "  FROM QuizSubmissions s \n"
                + "  WHERE s.StudentID = ? AND s.QuizID = ?";

        try (Connection conn = JDBC.getConnectionWithSqlJdbc(); PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, studentID);
            pstmt.setInt(2, quizzID);
            ResultSet rs = pstmt.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public static boolean DetailQuizSubmit(int studentID, int quizzID) throws Exception {
        List<QuizDetailSubmit> quizzes = new ArrayList<>();
        String query = "SELECT d.QuestionID, d.AnswerID as answerUser\n"
                + "  FROM QuizSubmissions s \n"
                + "  JOIN QuizSubmissionDetails d on d.QuizSubmissionID = s.SubmissionID\n"
                + "  WHERE s.StudentID = ? AND s.QuizID = ?";

        try (Connection conn = JDBC.getConnectionWithSqlJdbc(); PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, studentID);
            pstmt.setInt(2, quizzID);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int questionID= rs.getInt("QuestionID");
                int answerID= rs.getInt("answerUser");
                QuizDetailSubmit detail = new QuizDetailSubmit(questionID,answerID);
                quizzes.add(detail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }
    
    public static List<QuizAnswer> getCorrectAnswersByQuizID(int quizID) throws Exception {
    List<QuizAnswer> correctAnswers = new ArrayList<>();
    String query = "SELECT a.AnswerID, a.QuestionID, a.AnswerText, a.IsCorrect " +
                   "FROM QuizAnswers a " +
                   "INNER JOIN QuizQuestions q ON a.QuestionID = q.QuestionID " +
                   "WHERE q.QuizID = ? AND a.IsCorrect = 1";

    try (Connection conn = JDBC.getConnectionWithSqlJdbc();
         PreparedStatement pstmt = conn.prepareStatement(query)) {

        pstmt.setInt(1, quizID);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            QuizAnswer answer = new QuizAnswer();
            answer.setAnswerID(rs.getInt("AnswerID"));
            answer.setQuestionID(rs.getInt("QuestionID"));
            answer.setAnswerText(rs.getString("AnswerText"));
            correctAnswers.add(answer);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return correctAnswers;
}
    
    public static List<QuizDetailSubmit> getSubmittedAnswersByQuizIDAndStudentID(int quizID, int studentID) throws Exception {
    List<QuizDetailSubmit> submittedAnswers = new ArrayList<>();
    String query = "SELECT * FROM QuizSubmissionDetails WHERE QuizSubmissionID IN " +
                   "(SELECT SubmissionID FROM QuizSubmissions WHERE QuizID = ? AND StudentID = ?)";

    try (Connection conn = JDBC.getConnectionWithSqlJdbc();
         PreparedStatement pstmt = conn.prepareStatement(query)) {

        pstmt.setInt(1, quizID);
        pstmt.setInt(2, studentID);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            QuizDetailSubmit submissionDetail = new QuizDetailSubmit();
            submissionDetail.setId(rs.getInt("ID"));
            submissionDetail.setQuizSubmissionID(rs.getInt("QuizSubmissionID"));
            submissionDetail.setQuestionID(rs.getInt("QuestionID"));
            submissionDetail.setAnswerID(rs.getInt("AnswerID"));
            submittedAnswers.add(submissionDetail);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return submittedAnswers;
}

 public static int calculateScore(int quizID, int studentID) throws Exception {
    List<QuizAnswer> correctAnswers = QuizDAO.getCorrectAnswersByQuizID(quizID);
    List<QuizDetailSubmit> submittedAnswers = getSubmittedAnswersByQuizIDAndStudentID(quizID, studentID);

    int score = 0;

    for (QuizDetailSubmit submittedAnswer : submittedAnswers) {
        for (QuizAnswer correctAnswer : correctAnswers) {
            if (submittedAnswer.getAnswerID() == correctAnswer.getAnswerID()) {
                score++;
                break;
            } 
        }
    }

    return score;
}   
    

   public static void main(String[] args) {
        try {
            int quizID = 2;
            int studentID = 1;

            int score = calculateScore(quizID, studentID);
            System.out.println("diem = " + score);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
   
   

//    public static void main(String[] args) {
//        List<Quiz> list = QuizDAO.getQuizzesBySectionId(3);
//        for (Quiz quiz : list) {
//            System.out.println(quiz.toString());
//        }
//    }
}
