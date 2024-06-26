/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.UserDAO;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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

        if (res != null && res.isIsActive()) {
            // Tao session luu thong tin user 
            HttpSession session = request.getSession();
            session.setAttribute("user", res);
            System.out.println(res.getRole());
            url = switch (res.getRole()) {
                case 1 -> "/pages/home.jsp";
                case 2 -> "/pages/instructor-profile.jsp";
                default -> "/admin/adminHome.jsp";
            };
            
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
