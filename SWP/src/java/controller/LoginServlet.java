package controller;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

@WebServlet(name = "LoginServlet", urlPatterns = {"/homepage/login"})
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("username");
        String password = req.getParameter("password");
        HttpSession session = req.getSession();
        boolean authenticated = authenticate(userName, password);
        String errorMessage = "Username or password incorrect !";
        String pageRedirect = "login.jsp";
        UserDAO userDAO = new UserDAO();
        // get user info
        User user = userDAO.getUserByUserName(userName);
        //check user info get role neu role = 1 thi k cho login.
        if (authenticated) {
            session.setAttribute("account", user);
            pageRedirect = "user-profile.jsp";
        }
        resp.sendRedirect(pageRedirect);
    }

    private boolean authenticate(String userName, String password) {
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByUserName(userName);
        if (user != null) {
            return user.getPasswordHash().equals(password);
        }
        return false;
    }

}