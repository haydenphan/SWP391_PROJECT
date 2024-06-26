package controller;

import DAO.UserDAO;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import utils.PasswordUtils;

@WebServlet(name = "UserPasswordChangeServlet", urlPatterns = {"/user-profile/changePassword"})
public class UserPasswordChangeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        try {
            if (!PasswordUtils.verifyPassword(oldPassword, currentUser.getStoredSalt(), currentUser.getPasswordHash())) {
                response.sendRedirect(request.getContextPath() + "/pages/change-password.jsp?status=oldPasswordIncorrect");
                return;
            }

            if (!newPassword.equals(confirmPassword)) {
                response.sendRedirect(request.getContextPath() + "/pages/change-password.jsp?status=passwordsDoNotMatch");
                return;
            }

            byte[] newSalt = PasswordUtils.generateSalt();
            String hashedNewPassword = PasswordUtils.hashPassword(newPassword, newSalt);

            UserDAO userDAO = new UserDAO();
            currentUser.setPasswordHash(hashedNewPassword);
            currentUser.setStoredSalt(newSalt);
            boolean success = userDAO.updateUserPassword(currentUser);

            if (success) {
                session.setAttribute("user", currentUser);
                response.sendRedirect(request.getContextPath() + "/pages/user-profile.jsp?status=passwordChangeSuccess");
            } else {
                response.sendRedirect(request.getContextPath() + "/pages/change-password.jsp?status=passwordChangeFail");
            }
        } catch (NoSuchAlgorithmException e) {
            throw new ServletException("Password hashing algorithm not found", e);
        } catch (Exception ex) {
            Logger.getLogger(UserPasswordChangeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
