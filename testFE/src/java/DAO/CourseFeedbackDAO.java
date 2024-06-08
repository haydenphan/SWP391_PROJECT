package DAO;

import model.CourseFeedback;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CourseFeedbackDAO extends DAO<CourseFeedback> {

    public List<CourseFeedback> getFeedbacksByPage(String courseID, int page, int pageSize) {
        List<CourseFeedback> feedbacks = new ArrayList<>();
        String sql = "SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY FeedbackDate DESC) AS RowNum, * FROM CourseFeedback WHERE CourseID = ?) AS Sub WHERE RowNum BETWEEN ? AND ?";

        int startRow = (page - 1) * pageSize + 1;
        int endRow = startRow + pageSize - 1;

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, courseID);
            st.setInt(2, startRow);
            st.setInt(3, endRow);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    CourseFeedback feedback = new CourseFeedback();
                    feedback.setFeedbackID(rs.getInt("FeedbackID"));
                    feedback.setCourseID(rs.getString("CourseID"));
                    feedback.setUserID(rs.getInt("StudentID"));
                    feedback.setRating(rs.getInt("Rating"));
                    feedback.setComment(rs.getString("FeedbackText"));
                    feedback.setFeedbackDate(rs.getTimestamp("FeedbackDate").toLocalDateTime());
                    feedbacks.add(feedback);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(CourseFeedbackDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseFeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return feedbacks;
    }

    // Other DAO methods...
// Method to get the total number of feedback entries
    public int getTotalFeedbacksForCourse(String courseID) {
        int totalFeedbacks = 0;
        String sql = "SELECT COUNT(*) AS total FROM CourseFeedback WHERE CourseID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, courseID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    totalFeedbacks = rs.getInt("total");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(CourseFeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalFeedbacks;
    }

    // Method to calculate the total number of pages based on the total number of feedback entries and entries per page
    public int getTotalPages(String courseID, int entriesPerPage) {
        int totalFeedbacks = getTotalFeedbacksForCourse(courseID);
        return (int) Math.ceil((double) totalFeedbacks / entriesPerPage);
    }

    @Override
    public int insert(CourseFeedback feedback) {
       int result = 0;
        String sql = "INSERT INTO CourseFeedback (CourseID, StudentID, FeedbackText, Rating, FeedbackDate) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, feedback.getCourseID());
            st.setInt(2, feedback.getUserID());
            st.setString(3, feedback.getComment());
            st.setInt(4, feedback.getRating());
            st.setTimestamp(5, java.sql.Timestamp.valueOf(feedback.getFeedbackDate()));

            result = st.executeUpdate();

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(CourseFeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return result; 
    }

    public static void main(String[] args) {
        CourseFeedbackDAO feedbackDAO = new CourseFeedbackDAO();

//        // Assuming you have a courseID to test with
//        String courseID = "3";
//
//        // Assuming you want to fetch the first page of feedbacks
//        int page = 0;
//
//        List<CourseFeedback> feedbacks = feedbackDAO.getFeedbacksByPage(courseID, page, 10);
//
//        // Print retrieved feedbacks
//        for (CourseFeedback feedback : feedbacks) {
//            System.out.println("Feedback ID: " + feedback.getFeedbackID());
//            System.out.println("Course ID: " + feedback.getCourseID());
//            System.out.println("User ID: " + feedback.getUserID());
//            System.out.println("Rating: " + feedback.getRating());
//            System.out.println("Comment: " + feedback.getComment());
//            System.out.println("Feedback Date: " + feedback.getFeedbackDate());
//            System.out.println("------------------------------------");
//        }
// Create a test CourseFeedback object
        CourseFeedback feedback = new CourseFeedback();
        feedback.setUserID(1);
        feedback.setCourseID("3");
        feedback.setComment("very good");
        feedback.setRating(3);
        feedback.setFeedbackDate(LocalDateTime.now());
        // Insert the feedback
        int result = feedbackDAO.insert(feedback);

        // Print the result
        if (result > 0) {
            System.out.println("Feedback inserted successfully!");
        } else {
            System.out.println("Failed to insert feedback.");
        }
    }
}