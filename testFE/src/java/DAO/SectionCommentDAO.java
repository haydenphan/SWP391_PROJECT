package DAO;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.SectionComment;
import model.User;

public class SectionCommentDAO {

    public int insert(SectionComment sectionComment) {
        int res = 0;
        String sql = "INSERT INTO SectionComments (SectionID, UserID, CommentText, ParentCommentID, CommentDate, RepliedToUserID) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, sectionComment.getSectionID());
            stmt.setInt(2, sectionComment.getUserID());
            stmt.setString(3, sectionComment.getCommentText());
            if (sectionComment.getParentCommentID() != null) {
                stmt.setInt(4, sectionComment.getParentCommentID());
            } else {
                stmt.setNull(4, java.sql.Types.INTEGER);
            }
            stmt.setObject(5, sectionComment.getCommentDate());
            if (sectionComment.getRepliedToUserID() != null) {
                stmt.setInt(6, sectionComment.getRepliedToUserID());
            } else {
                stmt.setNull(6, java.sql.Types.INTEGER);
            }

            res = stmt.executeUpdate();

            // Retrieve the auto-generated CommentID if needed
            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    sectionComment.setCommentID(generatedKeys.getInt(1));
                } else {
                    throw new SQLException("Inserting comment failed, no ID obtained.");
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error inserting SectionComment: " + e.getMessage());
        } catch (Exception ex) {
            Logger.getLogger(SectionCommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return res;
    }

    public int updateComment(int commentID, String newCommentText, Integer userID) {
        String sql = "UPDATE SectionComments SET CommentText = ?, CommentDate = CURRENT_TIMESTAMP WHERE CommentID = ? AND UserID = ?";
        int result = 0;

        try (Connection conn = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, newCommentText);
            stmt.setInt(2, commentID);
            stmt.setInt(3, userID); // Ensure that only the owner of the comment can update it

            result = stmt.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error updating comment: " + e.getMessage());
        } catch (Exception ex) {
            Logger.getLogger(SectionCommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return result;
    }

    // Helper method to extract SectionComment object from ResultSet
    private SectionComment extractSectionCommentFromResultSet(ResultSet rs) throws SQLException {
        SectionComment sectionComment = new SectionComment();

        sectionComment.setCommentID(rs.getInt("CommentID"));
        sectionComment.setSectionID(rs.getInt("SectionID"));
        sectionComment.setUserID(rs.getInt("UserID"));
        sectionComment.setCommentText(rs.getString("CommentText"));
        sectionComment.setParentCommentID(rs.getInt("ParentCommentID"));
        sectionComment.setCommentDate(rs.getTimestamp("CommentDate").toLocalDateTime());
        return sectionComment;
    }

    public List<SectionComment> getCommentsBySection(int sectionID, int position, int offset, Integer parentID, String sortBy, Integer viewerID) {
        List<SectionComment> comments = new ArrayList<>();

        String sortOrder;
        switch (sortBy.toLowerCase()) {
            case "latest":
                sortOrder = "sc.CommentDate DESC";
                break;
            case "likes":
                sortOrder = "TotalLikes DESC";
                break;
            default:
                sortOrder = "sc.CommentID ASC";
                break;
        }
        String hasLikedStr
                = viewerID == null ? "(SELECT COUNT(*) FROM CommentLikes cl WHERE 0 > 1) AS ViewerLike "
                        : "(SELECT COUNT(*) FROM CommentLikes cl WHERE cl.CommentID = sc.CommentID AND cl.UserID = ?) AS ViewerLike ";
        String pIDFilter = parentID == null ? "sc.ParentCommentID IS NULL" : "sc.ParentCommentID = ?";

        String sql = "SELECT sc.CommentID, sc.SectionID, sc.UserID, sc.CommentText, sc.ParentCommentID, "
                + "sc.CommentDate, sc.RepliedToUserID, "
                + "u.UserID AS UserUserID, u.FirstName AS UserFirstName, u.LastName AS UserLastName, u.Avatar AS UserAvatar, "
                + "u2.UserID AS RepliedToUserID, u2.FirstName AS RepliedToFirstName, u2.LastName AS RepliedToLastName, u2.Avatar AS RepliedToAvatar, "
                + "(SELECT COUNT(*) FROM CommentLikes cl WHERE cl.CommentID = sc.CommentID) AS TotalLikes, "
                + "(SELECT COUNT(*) FROM SectionComments WHERE SectionComments.ParentCommentID = sc.CommentID) AS TotalReplies, "
                + hasLikedStr
                + "FROM SectionComments sc "
                + "JOIN Users u ON sc.UserID = u.UserID "
                + "LEFT JOIN Users u2 ON sc.RepliedToUserID = u2.UserID "
                + "WHERE sc.SectionID = ? AND "
                + pIDFilter + " "
                + "ORDER BY " + sortOrder + " "
                + "OFFSET ? ROWS "
                + "FETCH NEXT ? ROWS ONLY";

        try (Connection conn = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            int paramIndex = 1;
            if (viewerID != null) {
                stmt.setInt(paramIndex++, viewerID);
            }
            stmt.setInt(paramIndex++, sectionID);
            if (parentID != null) {
                stmt.setInt(paramIndex++, parentID);
            }
            stmt.setInt(paramIndex++, position);
            stmt.setInt(paramIndex++, offset);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    SectionComment comment = extractSectionCommentFromResultSet(rs);

                    // Set user details
                    User owner = new User();
                    owner.setUserID(rs.getInt("UserUserID"));
                    owner.setFirstName(rs.getString("UserFirstName"));
                    owner.setLastName(rs.getString("UserLastName"));
                    owner.setAvatar(rs.getString("UserAvatar"));
                    comment.setUser(owner);

                    // set viewer id
                    comment.setViewerID(viewerID);
                    // Set replied-to user details
                    if (rs.getInt("RepliedToUserID") != 0) { // Assuming 0 means no replied-to user
                        comment.setRepliedToUserID(rs.getInt("RepliedToUserID"));
                        User repliedToUser = new User();
                        repliedToUser.setUserID(rs.getInt("RepliedToUserID"));
                        repliedToUser.setFirstName(rs.getString("RepliedToFirstName"));
                        repliedToUser.setLastName(rs.getString("RepliedToLastName"));
                        repliedToUser.setAvatar(rs.getString("RepliedToAvatar"));
                        comment.setRepliedToUser(repliedToUser);
                    }
                    // Set total replies
                    comment.setTotalReplies(rs.getInt("TotalReplies"));
                    // Set total likes
                    comment.setLikes(rs.getInt("TotalLikes"));
                    comment.setLikeStatus(rs.getInt("ViewerLike") > 0);
                    comments.add(comment);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error retrieving comments: " + e.getMessage());
        } catch (Exception ex) {
            Logger.getLogger(SectionCommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return comments;
    }

    public SectionComment getCommentByID(int commentID, Integer viewerID) {
        SectionComment comment = null;

        String hasLikedStr = viewerID == null
                ? "(SELECT COUNT(*) FROM CommentLikes cl WHERE 0 > 1) AS ViewerLike "
                : "(SELECT COUNT(*) FROM CommentLikes cl WHERE cl.CommentID = sc.CommentID AND cl.UserID = ?) AS ViewerLike ";

        String sql = "SELECT sc.CommentID, sc.SectionID, sc.UserID, sc.CommentText, sc.ParentCommentID, "
                + "sc.CommentDate, sc.RepliedToUserID, "
                + "u.UserID AS UserUserID, u.FirstName AS UserFirstName, u.LastName AS UserLastName, u.Avatar AS UserAvatar, "
                + "u2.UserID AS RepliedToUserID, u2.FirstName AS RepliedToFirstName, u2.LastName AS RepliedToLastName, u2.Avatar AS RepliedToAvatar, "
                + "(SELECT COUNT(*) FROM CommentLikes cl WHERE cl.CommentID = sc.CommentID) AS TotalLikes, "
                + "(SELECT COUNT(*) FROM SectionComments WHERE SectionComments.ParentCommentID = sc.CommentID) AS TotalReplies, "
                + hasLikedStr
                + "FROM SectionComments sc "
                + "JOIN Users u ON sc.UserID = u.UserID "
                + "LEFT JOIN Users u2 ON sc.RepliedToUserID = u2.UserID "
                + "WHERE sc.CommentID = ?";

        try (Connection conn = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            int paramIndex = 1;
            if (viewerID != null) {
                stmt.setInt(paramIndex++, viewerID);
            }
            stmt.setInt(paramIndex++, commentID);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    comment = extractSectionCommentFromResultSet(rs);

                    // Set user details
                    User owner = new User();
                    owner.setUserID(rs.getInt("UserUserID"));
                    owner.setFirstName(rs.getString("UserFirstName"));
                    owner.setLastName(rs.getString("UserLastName"));
                    owner.setAvatar(rs.getString("UserAvatar"));
                    comment.setUser(owner);

                    // set viewer id
                    comment.setViewerID(viewerID);

                    // Set replied-to user details
                    if (rs.getInt("RepliedToUserID") != 0) { // Assuming 0 means no replied-to user
                        comment.setRepliedToUserID(rs.getInt("RepliedToUserID"));
                        User repliedToUser = new User();
                        repliedToUser.setUserID(rs.getInt("RepliedToUserID"));
                        repliedToUser.setFirstName(rs.getString("RepliedToFirstName"));
                        repliedToUser.setLastName(rs.getString("RepliedToLastName"));
                        repliedToUser.setAvatar(rs.getString("RepliedToAvatar"));
                        comment.setRepliedToUser(repliedToUser);
                    }
                    // Set total replies
                    comment.setTotalReplies(rs.getInt("TotalReplies"));
                    // Set total likes
                    comment.setLikes(rs.getInt("TotalLikes"));
                    comment.setLikeStatus(rs.getInt("ViewerLike") > 0);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error retrieving comment: " + e.getMessage());
        } catch (Exception ex) {
            Logger.getLogger(SectionCommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return comment;
    }

    public boolean hasUserLikedComment(int commentID, int userID) {
        String sql = "SELECT COUNT(*) AS LikeCount FROM CommentLike WHERE CommentID = ? AND UserID = ?";
        boolean hasLiked = false;

        try (Connection conn = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, commentID);
            stmt.setInt(2, userID);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int likeCount = rs.getInt("LikeCount");
                    if (likeCount > 0) {
                        hasLiked = true;
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error checking if user liked comment: " + e.getMessage());
        } catch (Exception ex) {
            Logger.getLogger(SectionCommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return hasLiked;
    }

    public boolean changeLikeStatus(int commentID, int userID) {
        boolean liked = false;

        // Check if the user has already liked the comment
        String checkLikeSql = "SELECT COUNT(*) FROM CommentLikes WHERE CommentID = ? AND UserID = ?";
        try (Connection conn = JDBC.getConnectionWithSqlJdbc(); PreparedStatement checkStmt = conn.prepareStatement(checkLikeSql)) {
            checkStmt.setInt(1, commentID);
            checkStmt.setInt(2, userID);
            try (ResultSet rs = checkStmt.executeQuery()) {
                if (rs.next() && rs.getInt(1) > 0) {
                    // User has already liked the comment, so remove the like
                    String unlikeSql = "DELETE FROM CommentLikes WHERE CommentID = ? AND UserID = ?";
                    try (PreparedStatement unlikeStmt = conn.prepareStatement(unlikeSql)) {
                        unlikeStmt.setInt(1, commentID);
                        unlikeStmt.setInt(2, userID);
                        unlikeStmt.executeUpdate();
                    }
                } else {
                    // User has not liked the comment, so add a like
                    String likeSql = "INSERT INTO CommentLikes (CommentID, UserID) VALUES (?, ?)";
                    try (PreparedStatement likeStmt = conn.prepareStatement(likeSql)) {
                        likeStmt.setInt(1, commentID);
                        likeStmt.setInt(2, userID);
                        likeStmt.executeUpdate();
                        liked = true;
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(SectionCommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return liked;
    }

    public int getTotalLikes(int commentID) {
        int totalLikes = 0;
        String sql = "SELECT COUNT(*) FROM CommentLikes WHERE CommentID = ?";

        try (Connection conn = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, commentID);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    totalLikes = rs.getInt(1);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(SectionCommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return totalLikes;
    }

    public boolean isUserOwnerOfComment(int commentID, int userID) {
        boolean isOwner = false;
        String sql = "SELECT COUNT(*) FROM SectionComments WHERE CommentID = ? AND UserID = ?";

        try (Connection conn = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, commentID);
            stmt.setInt(2, userID);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    isOwner = rs.getInt(1) > 0;
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("Error checking comment ownership: " + e.getMessage());
        } catch (Exception ex) {
            Logger.getLogger(SectionCommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return isOwner;
    }

    public static void main(String[] args) {
        // Create a SectionComment object to insert
        SectionComment sectionComment = new SectionComment();
        sectionComment.setSectionID(3); // Replace with your SectionID
        sectionComment.setUserID(1); // Replace with your UserID
        sectionComment.setCommentText("new comment."); // Replace with your comment text
        sectionComment.setParentCommentID(null); // Replace with parent comment ID if needed
        sectionComment.setCommentDate(LocalDateTime.now()); // Current timestamp
        sectionComment.setRepliedToUserID(null);

        // Create an instance of SectionCommentDAO
        SectionCommentDAO sectionCommentDAO = new SectionCommentDAO();

        List<SectionComment> comments = sectionCommentDAO.getCommentsBySection(3, 0, 100, null, "latest", null);
        for (SectionComment comment : comments) {
            System.out.println(comment);
        }

        System.out.println(sectionCommentDAO.getCommentByID(3, null));
//        sectionCommentDAO.insert(sectionComment);
//        System.out.print(comments.get(0).getCommentDate());
    }

}
