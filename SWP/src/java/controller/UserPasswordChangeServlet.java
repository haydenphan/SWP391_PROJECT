/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
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
@WebServlet(name = "UserPasswordChangeServlet", urlPatterns = {"/user-profile/changePassword"})
public class UserPasswordChangeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean success = false;
        UserDAO userDAO = new UserDAO();

        User currentUser = (User)request.getSession().getAttribute("account");
        int userID = currentUser.getUserID();
        String oldPassword = currentUser.getPasswordHash();
        String oldPasswordParam = request.getParameter("oldPassword");
        if(oldPassword.equals(oldPasswordParam)){
            String newPassword = request.getParameter("newPassword");    
            String newPasswordRetype = request.getParameter("newPasswordRetype");
            if(newPassword.equals(newPasswordRetype)){
                success = userDAO.changeUserPassword(userID, newPassword);               
            }
        }
        response.sendRedirect("homepage/user-profile.jsp?status=" + (success ? "passwordChangeSuccess" : "passwordChangeFail"));
    }
}
