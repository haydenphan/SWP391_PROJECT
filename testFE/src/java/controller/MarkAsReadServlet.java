package controller;

import DAO.NotificationDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
