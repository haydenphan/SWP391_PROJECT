package controller;

import DAO.NotificationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "MarkAsReadServlet", urlPatterns = {"/markAsRead"})
public class MarkAsReadServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String notificationIdStr = request.getParameter("notificationId");
        if (notificationIdStr == null || notificationIdStr.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid notification ID");
            return;
        }

        int notificationId = Integer.parseInt(notificationIdStr);
        boolean success = NotificationDAO.markAsRead(notificationId);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"success\":" + success + "}");
    }
}