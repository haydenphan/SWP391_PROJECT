package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.VideoProgress;
import DAO.JDBC;
import model.User;

@WebServlet("/getProgress")
public class GetProgressServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        int userId = user.getUserID();
        int lectureId = Integer.parseInt(request.getParameter("lectureId"));

        VideoProgress progress = getProgressFromDatabase(userId, lectureId);

        response.setContentType("application/json");
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(response.getWriter(), progress);
    }

    private VideoProgress getProgressFromDatabase(int userId, int lectureId) {
        VideoProgress progress = null;
        String sql = "SELECT WatchedPercentage FROM LectureProgress WHERE UserID = ? AND LectureID = ?";

        try (Connection connection = JDBC.getConnectionWithSqlJdbc(); PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            stmt.setInt(2, lectureId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    progress = new VideoProgress();
                    progress.setUserID(userId);
                    progress.setLectureID(lectureId);
                    progress.setWatchedPercentage(rs.getInt("WatchedPercentage"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return progress;
    }
}
