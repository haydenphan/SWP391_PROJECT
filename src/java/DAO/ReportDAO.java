package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Comment;
import model.Report;
import utils.StringExtention;

/**
 *
 * @author quanhd
 */
public class ReportDAO {

    public List<Report> reports;

    public ReportDAO() {
        if (reports == null) {
            reports = new ArrayList<>();
        }
    }

    private int GetLastId() throws ClassNotFoundException, Exception {
        int id = 0;
        try {
            Connection conn = JDBC.getConnectionWithSqlJdbc();
            String sql = """
                         SELECT TOP 1 ReportID
                         FROM Report
                         ORDER BY ReportID DESC;""";
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                id = rs.getInt("ReportID");
            } else {
                id = 1;
            }
            conn.close();
            return id;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Report> Reports() throws ClassNotFoundException, Exception {
        List<Report> reportList = new ArrayList<>();
        try {
            Connection conn = JDBC.getConnectionWithSqlJdbc();
            String sql = "SELECT r.reportID,r.userID, r.time, r.title, isReaded, isNewComment, c.content \n" +
                          "  FROM Report as r, Comment as c WHERE c.ReportID = r.ReportID  ORDER BY r.time DESC";
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                reportList.add(new Report(
                        rs.getInt("reportID"),
                        rs.getInt("userID"),
                        rs.getString("time"),
                        rs.getString("title"),
                        rs.getBoolean("isReaded"),
                        rs.getBoolean("isNewComment"),
                        rs.getString("content")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reportList;
    }

    public List<Comment> getComments(int id) throws ClassNotFoundException, Exception {
        List<Comment> comments = new ArrayList<>();
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            conn = JDBC.getConnectionWithSqlJdbc();
            String sql = "SELECT [Id],[ReportID],[IsReply],[Content],[Time] FROM [dbo].[Comment] WHERE ReportID = ?";
            st = conn.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();

            while (rs.next()) {
                String time = StringExtention.ConverDateToString(rs.getTimestamp("Time"));
                Comment comment = new Comment(
                        rs.getInt("Id"),
                        rs.getInt("ReportID"),
                        rs.getBoolean("IsReply"),
                        rs.getString("Content"),
                        time);
                comments.add(comment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return comments;
    }

    public boolean createComment(Comment data, int idReport) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO [dbo].[Comment] ([ReportID], [IsReply], [Content], [Time]) VALUES (?, ?, ?, ?)";

        try (Connection conn = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            int id = idReport;
            if (idReport == 0) {
                id = GetLastId();
                if (id == 0) {
                    throw new Exception("Failed to get last ID for Report");
                }
            }

            stmt.setInt(1, id);
            stmt.setBoolean(2, data.IsReply());
            stmt.setString(3, data.getContent());
            stmt.setString(4, data.getTime());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new SQLException("Error creating comment", ex);
        }
    }
    
    public List<Report> getList() throws SQLException, ClassNotFoundException, Exception {
        if (reports.size() <= 0) {
            Reports();
        }
        return reports;
    }

    public void create(Report data) throws SQLException, ClassNotFoundException {
        try {
            String sql = "INSERT INTO [dbo].[Report]\n"
                    + "  ([userID],[time],[title],[isReaded])\n"
                    + "  VALUES\n"
                    + "  (?,?,?,?)";
            PreparedStatement stmt = JDBC.getConnectionWithSqlJdbc().prepareStatement(sql);

            stmt.setInt(1, data.getUserID());
            stmt.setString(2, data.getTime());
            stmt.setString(3, data.getTitle());
            stmt.setBoolean(4, data.isIsReaded());

            int rowsAffected = stmt.executeUpdate();
            System.out.println(rowsAffected + " row(s) affected.");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
        }
    }

    public Report read(int id) throws SQLException, ClassNotFoundException {
        Report report = null;
        try (Connection conn = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = conn.prepareStatement(
                "SELECT ReportID, re.UserID, Time, Title, u.Email "
                + "FROM Report AS re "
                + "JOIN Users AS u ON u.UserID = re.UserID "
                + "WHERE ReportID = ?")) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    report = new Report(
                            rs.getInt("ReportID"),
                            rs.getInt("UserID"),
                            rs.getString("Time"),
                            rs.getString("Title"),
                            rs.getString("Email")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
        }
        return report;
    }

    public boolean reply(int id, boolean isUser) throws SQLException, ClassNotFoundException, Exception {
        int bitData = isUser ? 1 : 0;
        String updateSql = "UPDATE [dbo].[Report] SET [isReaded] = ?, [isNewComment] = ? WHERE reportID = ?";

        try (Connection conn = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = conn.prepareStatement(updateSql)) {

            st.setInt(1, bitData);
            st.setInt(2, bitData);
            st.setInt(3, id);

            boolean result = st.executeUpdate() > 0;

            if (result) {
                Reports();
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean update(int id, Report newData) throws SQLException, ClassNotFoundException {
        String updateSql = """
                       UPDATE [dbo].[Report]
                          SET [IsRead] = ?
                        WHERE ReportID = ? """;
        try (Connection conn = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = conn.prepareStatement(updateSql)) {

            stmt.setBoolean(1, false);
            stmt.setInt(2, id);

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                Reports();
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
