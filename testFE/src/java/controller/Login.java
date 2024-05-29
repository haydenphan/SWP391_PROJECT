/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.UserDAO;
import jakarta.servlet.RequestDispatcher;
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

/**
 *
 * @author ASUS-PRO
 */
@WebServlet(name = "Login", urlPatterns = {"/dang-nhap"})
public class Login extends HttpServlet {

    public Login() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tendangnhap = request.getParameter("tendangnhap");
        String password = request.getParameter("password");

        User user = new User();
        user.setPasswordHash(password);
        user.setUserName(tendangnhap);

        UserDAO userDAO = new UserDAO();
        User res = null;
        try {
            res = userDAO.checkExistedAccount(user);
        } catch (Exception ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }

//        request.setAttribute("UserName", res.getUserName());
        String url = "";

        if (res != null) {
            // Tao session luu thong tin user 
            HttpSession session = request.getSession();
            session.setAttribute("user", res);
            
            url = "/pages/user-profile.jsp";
        } else {
            request.setAttribute("baoLoi", "Tên đăng nhập hoặc mật khẩu không đúng!");
            url = "/pages/login.jsp";
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
