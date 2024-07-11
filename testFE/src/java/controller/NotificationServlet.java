package controller;

import DAO.NotificationDAO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.LocalDateTimeAdapter;
import model.Notification;
import model.User;

@WebServlet(name = "NotificationServlet", urlPatterns = {"/notifications"})
public class NotificationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        NotificationDAO notifiDAO = new NotificationDAO();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("UnAuthorized.");
            return;
        }

        String daysAgoStr = request.getParameter("daysAgo");
        // Default daysAgo to 7 days if not provided or invalid
        long daysAgo = 7; // Default to 7 days
        if (daysAgoStr != null && !daysAgoStr.isEmpty()) {
            try {
                daysAgo = Long.parseLong(daysAgoStr);
            } catch (NumberFormatException e) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("Invalid daysAgo parameter format.");
                return;
            }
        }
        // Calculate timestamp from days ago
        LocalDateTime sinceTimestamp = LocalDateTime.now().minus(daysAgo, ChronoUnit.DAYS);

        List<Notification> notifications = notifiDAO.getNotificationsForUserSince(sinceTimestamp, user.getUserID());
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter())
                .create();
        String json = gson.toJson(notifications);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}
