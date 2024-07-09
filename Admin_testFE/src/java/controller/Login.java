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
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.User;

@WebServlet(name = "Login", urlPatterns = {"/dang-nhap"})
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tendangnhap = request.getParameter("tendangnhap");
        String password = request.getParameter("password");

        System.out.println("Received login request with username/email: " + tendangnhap);

        User user = new User();
        user.setPasswordHash(password);

        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        Pattern pattern = Pattern.compile(emailRegex);
        Matcher matcher = pattern.matcher(tendangnhap);

        if (matcher.matches()) {
            user.setEmail(tendangnhap);
            System.out.println("Login attempt with email.");
        } else {
            user.setUserName(tendangnhap);
            System.out.println("Login attempt with username.");
        }
        user.setProviderID(1);

        UserDAO userDAO = new UserDAO();
        User res = null;
        try {
            res = userDAO.checkExistedAccount(user);
            System.out.println("UserDAO returned: " + (res != null ? res.toString() : "null"));
        } catch (Exception ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }

        String url = "";

        if (res != null && res.isIsActive()) {
            HttpSession session = request.getSession();
            session.setAttribute("user", res);
            url = "/home?role=" + switch (res.getRole()) {
                case 1 -> "1";
                case 2 -> "2";
                default -> "3";
            };
            System.out.println("Login successful. Redirecting to: " + url);
        } else {
            request.setAttribute("baoLoi", "Tên đăng nhập hoặc mật khẩu không đúng!");
            url = "/pages/login.jsp";
            System.out.println("Login failed. Redirecting to login page with error message.");
        }
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
