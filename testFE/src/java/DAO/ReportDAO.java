package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Report;

public class ReportDAO {

    public List<Report> reports;

    public ReportDAO() {
        if (reports == null) {
            reports = new ArrayList<>();
        }
    }

    private int getLastId() throws ClassNotFoundException, Exception {
        int id = 0;
        try (Connection conn = JDBC.getConnectionWithSqlJdbc()) {
            String sql = """
                         SELECT TOP 1 ReportID
                         FROM Report
                         ORDER BY ReportID DESC;""";
            try (PreparedStatement st = conn.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    id = rs.getInt("ReportID");
                } else {
                    id = 1;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }

    public List<Report> getReports() throws ClassNotFoundException, Exception {
        List<Report> reportList = new ArrayList<>();
        try (Connection conn = JDBC.getConnectionWithSqlJdbc()) {
            String sql = "SELECT r.ReportID, r.UserID, r.Time, r.Title, r.IsReaded, r.Content FROM Report as r ORDER BY r.Time DESC";
            try (PreparedStatement st = conn.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    reportList.add(new Report(
                            rs.getInt("ReportID"),
                            rs.getInt("UserID"),
                            rs.getString("Time"),
                            rs.getString("Title"),
                            rs.getBoolean("IsReaded"),
                            rs.getString("Content")));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reportList;
    }

    public List<Report> getList() throws SQLException, ClassNotFoundException, Exception {
        if (reports.size() <= 0) {
            reports = getReports();
        }
        return reports;
    }

    public void create(Report data) throws SQLException, ClassNotFoundException, Exception {
        String sql = "INSERT INTO [dbo].[Report] ([UserID], [Time], [Title], [IsReaded], [Content]) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, data.getUserID());
            stmt.setString(2, data.getTime());
            stmt.setString(3, data.getTitle());
            stmt.setBoolean(4, data.isReaded());
            stmt.setString(5, data.getContent());

            int rowsAffected = stmt.executeUpdate();
            System.out.println(rowsAffected + " row(s) affected.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Report read(int id) throws SQLException, ClassNotFoundException, Exception {
        Report report = null;
        String sql = "SELECT ReportID, re.UserID, Time, Title, IsReaded, Content FROM Report AS re WHERE ReportID = ?";
        try (Connection conn = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    report = new Report(
                            rs.getInt("ReportID"),
                            rs.getInt("UserID"),
                            rs.getString("Time"),
                            rs.getString("Title"),
                            rs.getBoolean("IsReaded"),
                            rs.getString("Content")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return report;
    }

    public boolean reply(int id, boolean isUser) throws SQLException, ClassNotFoundException, Exception {
        int bitData = isUser ? 1 : 0;
        String updateSql = "UPDATE [dbo].[Report] SET [IsReaded] = ? WHERE ReportID = ?";
        try (Connection conn = JDBC.getConnectionWithSqlJdbc(); PreparedStatement st = conn.prepareStatement(updateSql)) {
            st.setInt(1, bitData);
            st.setInt(2, id);
            boolean result = st.executeUpdate() > 0;
            if (result) {
                reports = getReports();
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean update(int id, Report newData) throws SQLException, ClassNotFoundException {
        String updateSql = "UPDATE [dbo].[Report] SET [IsReaded] = ? WHERE ReportID = ?";
        try (Connection conn = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = conn.prepareStatement(updateSql)) {
            stmt.setBoolean(1, newData.isReaded());
            stmt.setInt(2, id);

            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                reports = getReports();
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static void main(String[] args) throws Exception {
        ReportDAO dao = new ReportDAO();
        for (Report report : dao.getReports()) {
            System.out.println(report.toString());
        }
    }
}
