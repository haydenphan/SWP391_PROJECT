package DAO;

import model.Quiz;
import model.QuizAnswer;
import model.QuizSubmissionDetail;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class QuizDAO {

    public static List<Quiz> getQuizzesBySectionId(int sectionId) throws Exception {
        List<Quiz> quizzes = new ArrayList<>();
        String query = "SELECT * FROM Quizzes WHERE SectionID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, sectionId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Quiz quiz = new Quiz();
                    quiz.setQuizId(rs.getInt("QuizID"));
                    quiz.setQuizDescription(rs.getString("QuizDescription"));
                    quiz.setSectionId(rs.getInt("SectionID"));
                    quiz.setQuizName(rs.getString("QuizName"));
                    quiz.setCreatedDate(rs.getTimestamp("CreatedDate").toLocalDateTime());
                    quiz.setDuration(rs.getString("Duration"));
                    quizzes.add(quiz);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return quizzes;
    }

    public static int addQuiz(Quiz quiz) throws Exception {
        String query = "INSERT INTO Quizzes (QuizDescription, SectionID, QuizName, CreatedDate, Duration) VALUES (?, ?, ?, ?, ?)";
        int generatedId = -1;

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, quiz.getQuizDescription());
            ps.setInt(2, quiz.getSectionId());
            ps.setString(3, quiz.getQuizName());
            ps.setTimestamp(4, Timestamp.valueOf(quiz.getCreatedDate()));
            ps.setString(5, quiz.getDuration());
            ps.executeUpdate();

            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    generatedId = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Error adding quiz", e);
        }
        return generatedId;
    }

    public static Quiz getQuizById(int quizId) throws Exception {
        Quiz quiz = null;
        String query = "SELECT * FROM Quizzes WHERE QuizID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, quizId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    quiz = new Quiz();
                    quiz.setQuizId(rs.getInt("QuizID"));
                    quiz.setQuizDescription(rs.getString("QuizDescription"));
                    quiz.setSectionId(rs.getInt("SectionID"));
                    quiz.setQuizName(rs.getString("QuizName"));
                    quiz.setCreatedDate(rs.getTimestamp("CreatedDate").toLocalDateTime());
                    quiz.setDuration(rs.getString("Duration"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return quiz;
    }

    public static void updateQuiz(Quiz quiz) throws Exception {
        String query = "UPDATE Quizzes SET QuizDescription = ?, SectionID = ?, QuizName = ?, CreatedDate = ?, Duration = ? WHERE QuizID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, quiz.getQuizDescription());
            ps.setInt(2, quiz.getSectionId());
            ps.setString(3, quiz.getQuizName());
            ps.setTimestamp(4, Timestamp.valueOf(quiz.getCreatedDate()));
            ps.setString(5, quiz.getDuration());
            ps.setInt(6, quiz.getQuizId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static boolean deleteQuiz(int quizId) throws Exception {
        String query = "DELETE FROM Quizzes WHERE QuizID = ?";
        boolean isDeleted = false;

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, quizId);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                isDeleted = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Error deleting quiz", e);
        }
        return isDeleted;
    }

    public static int numbersQuiz(int quizId) throws Exception {
        String sql = "SELECT COUNT(QuizID) as count FROM QuizQuestions WHERE QuizID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, quizId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("count");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    public static boolean isSubmitionQuiz(int studentID, int quizzID) throws Exception {
        String query = "SELECT TOP 1 * FROM QuizSubmissions WHERE StudentID = ? AND QuizID = ?";

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

    public static java.sql.Date DateSubmit(int studentID, int quizzID) throws Exception {
        String query = "SELECT TOP 1 SubmissionDate FROM QuizSubmissions WHERE StudentID = ? AND QuizID = ?";

        try (Connection conn = JDBC.getConnectionWithSqlJdbc(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, studentID);
            pstmt.setInt(2, quizzID);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getDate("SubmissionDate");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static boolean DetailQuizSubmit(int studentID, int quizzID) throws Exception {
        List<QuizSubmissionDetail> quizzes = new ArrayList<>();
        String query = """
                SELECT d.QuestionID, d.AnswerID as answerUser
                FROM QuizSubmissions s 
                JOIN QuizSubmissionDetails d on d.QuizSubmissionID = s.SubmissionID
                WHERE s.StudentID = ? AND s.QuizID = ?""";

        try (Connection conn = JDBC.getConnectionWithSqlJdbc(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, studentID);
            pstmt.setInt(2, quizzID);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int questionID = rs.getInt("QuestionID");
                int answerID = rs.getInt("answerUser");
                QuizSubmissionDetail detail = new QuizSubmissionDetail();
                detail.setAnswerId(answerID);
                detail.setQuestionId(questionID);
                quizzes.add(detail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static List<QuizAnswer> getCorrectAnswersByQuizID(int quizID) throws Exception {
        List<QuizAnswer> correctAnswers = new ArrayList<>();
        String query = "SELECT a.AnswerID, a.QuestionID, a.AnswerText, a.IsCorrect "
                + "FROM QuizAnswers a "
                + "INNER JOIN QuizQuestions q ON a.QuestionID = q.QuestionID "
                + "WHERE q.QuizID = ? AND a.IsCorrect = 1";

        try (Connection conn = JDBC.getConnectionWithSqlJdbc(); PreparedStatement pstmt = conn.prepareStatement(query)) {
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

    public static List<QuizSubmissionDetail> getSubmittedAnswersByQuizIDAndStudentID(int quizID, int studentID) throws Exception {
        List<QuizSubmissionDetail> submittedAnswers = new ArrayList<>();
        String query = "SELECT * FROM QuizSubmissionDetails WHERE QuizSubmissionID IN "
                + "(SELECT SubmissionID FROM QuizSubmissions WHERE QuizID = ? AND StudentID = ?)";

        try (Connection conn = JDBC.getConnectionWithSqlJdbc(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, quizID);
            pstmt.setInt(2, studentID);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                QuizSubmissionDetail submissionDetail = new QuizSubmissionDetail();
                submissionDetail.setId(rs.getInt("ID"));
                submissionDetail.setQuizSubmissionId(rs.getInt("QuizSubmissionID"));
                submissionDetail.setQuestionId(rs.getInt("QuestionID"));
                submissionDetail.setAnswerId(rs.getInt("AnswerID"));
                submittedAnswers.add(submissionDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return submittedAnswers;
    }

    public static int calculateScore(int quizID, int studentID) throws Exception {
        List<QuizAnswer> correctAnswers = getCorrectAnswersByQuizID(quizID);
        List<QuizSubmissionDetail> submittedAnswers = getSubmittedAnswersByQuizIDAndStudentID(quizID, studentID);

        int score = 0;

        for (QuizSubmissionDetail submittedAnswer : submittedAnswers) {
            for (QuizAnswer correctAnswer : correctAnswers) {
                if (submittedAnswer.getAnswerId() == correctAnswer.getAnswerID()) {
                    score++;
                    break;
                }
            }
        }
        return score;
    }

    public static boolean hasPassedQuiz(int quizID, int studentID) throws Exception {
        int score = calculateScore(quizID, studentID);
        int totalQuestions = numbersQuiz(quizID);

        return totalQuestions > 0 && ((double) score / totalQuestions) >= 0.5;
    }

    public static boolean hasPassedAllQuizzesInSection(int studentID, int sectionID) throws Exception {
        List<Integer> quizIDs = getQuizIDsBySectionID(sectionID);
        for (int quizID : quizIDs) {
            if (!hasPassedQuiz(quizID, studentID)) {
                return false;
            }
        }
        return true;
    }

    public static List<Integer> getQuizIDsBySectionID(int sectionID) throws Exception {
        List<Integer> quizIDs = new ArrayList<>();
        String query = "SELECT QuizID FROM Quizzes WHERE SectionID = ?";

        try (Connection conn = JDBC.getConnectionWithSqlJdbc(); PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, sectionID);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                quizIDs.add(rs.getInt("QuizID"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return quizIDs;
    }

    // Method to calculate the percentage of completed quizzes in a course
    public static double calculateQuizCompletionPercentage(int studentID, int courseID) throws Exception {
        // Step 1: Get total quizzes in the course
        String totalQuizzesQuery = "SELECT COUNT(q.QuizID) AS TotalQuizzes "
                + "FROM Quizzes q "
                + "JOIN CourseSections cs ON q.SectionID = cs.SectionID "
                + "WHERE cs.CourseID = ?";
        int totalQuizzes = 0;

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(totalQuizzesQuery)) {
            ps.setInt(1, courseID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    totalQuizzes = rs.getInt("TotalQuizzes");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Error calculating total quizzes", e);
        }

        // Step 2: Get quizzes completed by the student
        String completedQuizzesQuery = "SELECT COUNT(DISTINCT q.QuizID) AS CompletedQuizzes "
                + "FROM QuizSubmissions qs "
                + "JOIN Quizzes q ON qs.QuizID = q.QuizID "
                + "JOIN CourseSections cs ON q.SectionID = cs.SectionID "
                + "WHERE qs.StudentID = ? AND cs.CourseID = ?";
        int completedQuizzes = 0;

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(completedQuizzesQuery)) {
            ps.setInt(1, studentID);
            ps.setInt(2, courseID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    completedQuizzes = rs.getInt("CompletedQuizzes");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new Exception("Error calculating completed quizzes", e);
        }

        // Step 3: Calculate completion percentage
        if (totalQuizzes == 0) {
            return 0;
        }
        return (double) completedQuizzes / totalQuizzes * 100;
    }
}
