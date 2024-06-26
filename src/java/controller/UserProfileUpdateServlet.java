/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.UserDAO;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author Khoi
 */
@WebServlet(name = "UserProfileUpdateServlet", urlPatterns = {"/user-profile/update"})
public class UserProfileUpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        
        User currentUser = (User)request.getSession().getAttribute("user");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String bio = request.getParameter("bio");

        User user = new User();
        user.setUserID(currentUser.getUserID());
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setBio(bio);

        boolean success = userDAO.updateUserProfile(user);
        if(success){
            User updatedUser = null;
            try {
                updatedUser = userDAO.getUserByUsername(currentUser.getUserName());
            } catch (Exception ex) {
                Logger.getLogger(UserProfileUpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            // Update the session attribute with the updated user information
            request.getSession().setAttribute("user", updatedUser);
        }

        response.sendRedirect(request.getContextPath() + "/pages/user-profile.jsp?status=" + (success ? "success" : "fail"));
    }
}
