package controller;

import java.io.IOException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.VideoProgress;
import DAO.JDBC;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

@WebServlet("/trackProgress")
public class TrackProgressServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper mapper = new ObjectMapper();
        VideoProgress progress = mapper.readValue(request.getReader(), VideoProgress.class);

        // Get user ID from session or request context
        User user = (User) request.getSession().getAttribute("user");
        int userId = user.getUserID();

        // Save the progress to the database
        saveProgressToDatabase(userId, progress);

        response.setContentType("application/json");
        response.getWriter().write("{\"status\":\"success\"}");
    }

    private void saveProgressToDatabase(int userId, VideoProgress progress) {
        String sql = "IF EXISTS (SELECT 1 FROM LectureProgress WHERE UserID = ? AND LectureID = ?) "
                + "UPDATE LectureProgress SET WatchedPercentage = ? WHERE UserID = ? AND LectureID = ? "
                + "ELSE "
                + "INSERT INTO LectureProgress (UserID, LectureID, WatchedPercentage) VALUES (?, ?, ?)";

        try (Connection connection = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            stmt.setInt(2, progress.getLectureID());
            stmt.setInt(3, progress.getWatchedPercentage());
            stmt.setInt(4, userId);
            stmt.setInt(5, progress.getLectureID());
            stmt.setInt(6, userId);
            stmt.setInt(7, progress.getLectureID());
            stmt.setInt(8, progress.getWatchedPercentage());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}