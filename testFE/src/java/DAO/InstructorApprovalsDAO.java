package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.InstructorApprovals;
import java.sql.SQLException;

public class InstructorApprovalsDAO extends DAO<InstructorApprovals> {

    @Override
    public int insert(InstructorApprovals approval) {
        String sql = "INSERT INTO InstructorApprovals (UserID, IsApproved, RequestDate, ApprovalDate) VALUES (?, ?, ?, ?)";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, approval.getUserID());
            ps.setBoolean(2, approval.isIsApproved());
            ps.setDate(3, new java.sql.Date(approval.getRequestDate().getTime()));
            ps.setDate(4, null);

            int affectedRows = ps.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Creating approval failed, no rows affected.");
            }

            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1); // Return the generated approvalID
                } else {
                    throw new SQLException("Creating approval failed, no ID obtained.");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int update(InstructorApprovals approval) {
        String sql = "UPDATE InstructorApprovals SET UserID = ?, IsApproved = ?, RequestDate = ?, ApprovalDate = ? WHERE ApprovalID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, approval.getUserID());
            ps.setBoolean(2, approval.isIsApproved());
            ps.setDate(3, new java.sql.Date(approval.getRequestDate().getTime()));
            ps.setDate(4, new java.sql.Date(approval.getApprovalDate().getTime()));
            ps.setInt(5, approval.getApprovalID());
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int delete(InstructorApprovals approval) {
        String sql = "DELETE FROM InstructorApprovals WHERE ApprovalID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, approval.getApprovalID());
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public InstructorApprovals select(int id) {
        String sql = "SELECT ApprovalID, UserID, IsApproved, RequestDate, ApprovalDate FROM InstructorApprovals WHERE ApprovalID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new InstructorApprovals(
                            rs.getInt("ApprovalID"),
                            rs.getInt("UserID"),
                            rs.getBoolean("IsApproved"),
                            rs.getDate("RequestDate"),
                            rs.getDate("ApprovalDate")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<InstructorApprovals> selectAll() {
        String sql = "SELECT ApprovalID, UserID, IsApproved, RequestDate, ApprovalDate FROM InstructorApprovals";
        List<InstructorApprovals> approvals = new ArrayList<>();
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                approvals.add(new InstructorApprovals(
                        rs.getInt("ApprovalID"),
                        rs.getInt("UserID"),
                        rs.getBoolean("IsApproved"),
                        rs.getDate("RequestDate"),
                        rs.getDate("ApprovalDate")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return approvals;
    }

    public static boolean isUserApproved(int userID) {
        String sql = "SELECT IsApproved FROM InstructorApprovals WHERE UserID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getBoolean("IsApproved");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static int getApprovalIDByUserID(int userID) {
        String sql = "SELECT ApprovalID FROM InstructorApprovals WHERE UserID = ?";
        try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("ApprovalID");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0; // Return 0 or another appropriate value if no ApprovalID is found
    }
    
    public static boolean doesUserIDExist(int userID) {
    String sql = "SELECT 1 FROM InstructorApprovals WHERE UserID = ?";
    try (Connection con = JDBC.getConnectionWithSqlJdbc(); PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setInt(1, userID);
        try (ResultSet rs = ps.executeQuery()) {
            return rs.next(); // Returns true if there is at least one row, false otherwise
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false; // Return false in case of an exception
}

}
