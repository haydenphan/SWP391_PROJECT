package controller;

import DAO.UserDAO;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.PasswordUtils;
import model.User;

/**
 * Servlet implementation class UpdatePassword
 */
@WebServlet(name = "UpdatePassword", urlPatterns = {"/UpdatePassword"})
public class UpdatePassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        HttpSession mySession = request.getSession();
        User user = (User) mySession.getAttribute("user");

        byte[] salt = PasswordUtils.generateSalt();
        String hashedPassword = null;
        try {
            hashedPassword = PasswordUtils.hashPassword(password, salt);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }
                
        user.setPasswordHash(hashedPassword);
        user.setStoredSalt(salt);
        
        UserDAO userDAO = new UserDAO();
        try {
            userDAO.updateUserPassword(user);
        } catch (Exception ex) {
            Logger.getLogger(UpdatePassword.class.getName()).log(Level.SEVERE, null, ex);
        }

        boolean isUpdated = true; // This is just a placeholder

        RequestDispatcher dispatcher = null;
        if (isUpdated) {
            request.setAttribute("message", "Password has been reset successfully.");
            dispatcher = request.getRequestDispatcher("pages/user-profile.jsp");
        } else {
            request.setAttribute("error", "Failed to reset password. Please try again.");
            dispatcher = request.getRequestDispatcher("pages/reset-password.jsp");
        }
        dispatcher.forward(request, response);
    }
}
