package controller;

import DAO.UserDAO;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

@WebServlet(name = "Login", urlPatterns = {"/dang-nhap"})
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tendangnhap = request.getParameter("tendangnhap");
        String password = request.getParameter("password");

        User user = new User();
        user.setPasswordHash(password);

        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        Pattern pattern = Pattern.compile(emailRegex);
        Matcher matcher = pattern.matcher(tendangnhap);

        if (matcher.matches()) {
            user.setEmail(tendangnhap);
        } else {
            user.setUserName(tendangnhap);
        }
        user.setProviderID(1);

        UserDAO userDAO = new UserDAO();
        User res = null;
        try {
            res = userDAO.checkExistedAccount(user);
        } catch (Exception ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }

        String url = "";

        if (res != null && res.isIsActive()) {
            HttpSession session = request.getSession();
            session.setAttribute("user", res);
            url = "/home?role=" + switch (res.getRole()) {
                case 1 ->
                    "1";
                case 2 ->
                    "2";
                default ->
                    "3";
            };
        } else {
            request.setAttribute("baoLoi", "Tên đăng nhập hoặc mật khẩu không đúng!");
            url = "/pages/login.jsp";
        }
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to login page (or handle GET requests accordingly)
        doPost(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
