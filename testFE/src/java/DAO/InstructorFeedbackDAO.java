package DAO;

import model.InstructorFeedback;
import model.User;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class InstructorFeedbackDAO extends DAO<InstructorFeedback> {

    public List<Integer> getStarRatingsCount(String instructorID) {
        List<Integer> starCounts = new ArrayList<>(5);
        // Initialize list with zeros for 1 to 5 stars
        for (int i = 0; i < 5; i++) {
            starCounts.add(0);
        }

        String sql = "SELECT Rating, COUNT(*) AS starCount "
                + "FROM InstructorFeedback "
                + "WHERE InstructorID = ? "
                + "GROUP BY Rating";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {

            st.setString(1, instructorID);

            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    int rating = rs.getInt("Rating");
                    int count = rs.getInt("starCount");

                    if (rating >= 1 && rating <= 5) {
                        starCounts.set(rating - 1, count);
                    }
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return starCounts;
    }

    public List<InstructorFeedback> getFeedbacksByPage(int instructorID, int page, int pageSize) {
        List<InstructorFeedback> feedbacks = new ArrayList<>();
        String sql = "SELECT * FROM ("
                + "SELECT ROW_NUMBER() OVER (ORDER BY f.FeedbackDate DESC) AS RowNum, f.*, u.UserID, u.Avatar, u.FirstName, u.LastName "
                + "FROM InstructorFeedback f "
                + "JOIN Users u ON f.LearnerID = u.UserID "
                + "WHERE f.InstructorID = ?) AS Sub "
                + "WHERE RowNum BETWEEN ? AND ?";

        int startRow = (page - 1) * pageSize + 1;
        int endRow = startRow + pageSize - 1;

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, instructorID);
            st.setInt(2, startRow);
            st.setInt(3, endRow);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    InstructorFeedback feedback = new InstructorFeedback();
                    feedback.setFeedbackID(rs.getInt("FeedbackID"));
                    feedback.setInstructorID(rs.getInt("InstructorID"));
                    feedback.setComment(rs.getString("Comment"));
                    feedback.setRating(rs.getInt("Rating"));
                    feedback.setFeedbackDate(rs.getTimestamp("FeedbackDate").toLocalDateTime());

                    User learner = new User();
                    learner.setUserID(rs.getInt("UserID"));
                    learner.setAvatar(rs.getString("Avatar"));
                    learner.setFirstName(rs.getString("FirstName"));
                    learner.setLastName(rs.getString("LastName"));
                    feedback.setLearner(learner);

                    feedbacks.add(feedback);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(InstructorFeedbackDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(InstructorFeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return feedbacks;
    }

    // Method to get the total number of feedback entries
    public int getTotalFeedbacksForInstructor(int instructorID) {
        int totalFeedbacks = 0;
        String sql = "SELECT COUNT(*) AS total FROM InstructorFeedback WHERE InstructorID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, instructorID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    totalFeedbacks = rs.getInt("total");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(InstructorFeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return totalFeedbacks;
    }

    // Method to calculate the total number of pages based on the total number of feedback entries and entries per page
    public int getTotalPages(int instructorID, int entriesPerPage) {
        int totalFeedbacks = getTotalFeedbacksForInstructor(instructorID);
        return (int) Math.ceil((double) totalFeedbacks / entriesPerPage);
    }

    @Override
    public int insert(InstructorFeedback feedback) {
        int result = 0;
        String sql = "INSERT INTO InstructorFeedback (InstructorID, LearnerID, Comment, Rating, FeedbackDate) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, feedback.getInstructorID());
            st.setInt(2, feedback.getLearner().getUserID());
            st.setString(3, feedback.getComment());
            st.setInt(4, feedback.getRating());
            st.setTimestamp(5, Timestamp.valueOf(feedback.getFeedbackDate()));

            result = st.executeUpdate();

        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(InstructorFeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return result;
    }

    public int delete(int feedbackID) {
        int result = 0;
        String sql = "DELETE FROM InstructorFeedback WHERE FeedbackID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, feedbackID);
            result = st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(InstructorFeedbackDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(InstructorFeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return result;
    }

    public int update(InstructorFeedback feedback) {
        int result = 0;
        String sql = "UPDATE InstructorFeedback SET InstructorID = ?, LearnerID = ?, Comment = ?, Rating = ?, FeedbackDate = ? WHERE FeedbackID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, feedback.getInstructorID());
            st.setInt(2, feedback.getLearner().getUserID());
            st.setString(3, feedback.getComment());
            st.setInt(4, feedback.getRating());
            st.setTimestamp(5, Timestamp.valueOf(feedback.getFeedbackDate()));
            st.setInt(6, feedback.getFeedbackID());

            result = st.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(InstructorFeedbackDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(InstructorFeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return result;
    }

    public InstructorFeedback getFeedbackByID(int feedbackID) {
        InstructorFeedback feedback = null;
        String sql = "SELECT * FROM InstructorFeedback WHERE FeedbackID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, feedbackID);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    feedback = new InstructorFeedback();
                    feedback.setFeedbackID(rs.getInt("FeedbackID"));
                    feedback.setInstructorID(rs.getInt("InstructorID"));
                    feedback.setComment(rs.getString("Comment"));
                    feedback.setRating(rs.getInt("Rating"));
                    feedback.setFeedbackDate(rs.getTimestamp("FeedbackDate").toLocalDateTime());

                    User learner = new User();
                    learner.setUserID(rs.getInt("LearnerID"));
                    feedback.setLearner(learner);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(InstructorFeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return feedback;
    }

    public static void main(String[] args) {
        InstructorFeedbackDAO feedbackDAO = new InstructorFeedbackDAO();

        // Create a test InstructorFeedback object
        InstructorFeedback feedback = new InstructorFeedback();
        feedback.setInstructorID(1);
        User learner = new User();
        learner.setUserID(1);
        feedback.setLearner(learner);
        feedback.setComment("Excellent instructor!");
        feedback.setRating(5);
        feedback.setFeedbackDate(LocalDateTime.now());

        // Insert the feedback
        System.out.println(feedbackDAO.getStarRatingsCount("1"));
    }

    public InstructorFeedback getFeedbackForInstructorByLearner(int instructorID, int learnerID) {
        InstructorFeedback feedback = null;
        String sql = "SELECT * FROM InstructorFeedback WHERE InstructorID = ? AND LearnerID = ?";

        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, instructorID);
            st.setInt(2, learnerID);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    feedback = new InstructorFeedback();
                    feedback.setFeedbackID(rs.getInt("FeedbackID"));
                    feedback.setInstructorID(rs.getInt("InstructorID"));
                    feedback.setComment(rs.getString("Comment"));
                    feedback.setRating(rs.getInt("Rating"));
                    feedback.setFeedbackDate(rs.getTimestamp("FeedbackDate").toLocalDateTime());

                    User learner = new User();
                    learner.setUserID(rs.getInt("LearnerID"));
                    feedback.setLearner(learner);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error! " + e.getMessage());
            Logger.getLogger(InstructorFeedbackDAO.class.getName()).log(Level.SEVERE, null, e);
        } catch (Exception ex) {
            Logger.getLogger(InstructorFeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return feedback;
    }

}
