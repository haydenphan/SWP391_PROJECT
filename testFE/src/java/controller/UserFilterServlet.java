package controller;

import DAO.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserFilterServlet", urlPatterns = {"/filterUsers"})
public class UserFilterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String role = request.getParameter("role");
        String banned = request.getParameter("banned");
        String newUser = request.getParameter("newUser");
        String topPurchaser = request.getParameter("topPurchaser");

        UserDAO userDAO = new UserDAO();
        List<User> filteredUsers = userDAO.filterUsers(role, banned, newUser, topPurchaser);

        request.setAttribute("listUser", filteredUsers);
        request.getRequestDispatcher("pages/filteredUsers.jsp").forward(request, response); // Replace with your JSP path
    }
}
