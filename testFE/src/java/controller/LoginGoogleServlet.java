package controller;

import DAO.UserDAO;
import utils.GoogleUtils;
import model.User;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "LoginGoogleServlet", urlPatterns = {"/loginByGG"})
public class LoginGoogleServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        String state = request.getParameter("state");

        if (code == null || code.isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher("/pages/home.jsp");
            dis.forward(request, response);
        } else {
            try {
                String accessToken = GoogleUtils.getToken(code);
                User googleUser = GoogleUtils.getUserInfo(accessToken);
                request.setAttribute("pojo", googleUser);

                UserDAO userDAO = new UserDAO();

                if ("register".equals(state)) {
                    boolean emailExists = userDAO.checkExistedEmail(googleUser.getEmail());
                    if (emailExists) {
                        request.setAttribute("error", "Email already exists. Please login.");
                        RequestDispatcher dis = request.getRequestDispatcher("/errors/errorAlert.jsp");
                        dis.forward(request, response);
                    } else {
                        RequestDispatcher dis = request.getRequestDispatcher("pages/google.jsp");
                        dis.forward(request, response);
                    }
                } else {
                    User existingUser = userDAO.checkExistedGGAccount(googleUser);
                    
                    if (existingUser != null) {
                        int role = existingUser.getRole();
                        request.getSession().setAttribute("user", existingUser);
                        if (role == 1) {
                            response.sendRedirect(request.getContextPath() + "/pages/user-profile.jsp");
                        }
                        response.sendRedirect(request.getContextPath() + "/pages/instructor-profile.jsp");
                    } else {
                        request.setAttribute("error", "User not found. Please register.");
                        RequestDispatcher dis = request.getRequestDispatcher("/errors/errorAlert.jsp");
                        dis.forward(request, response);
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
                request.setAttribute("error", "Error: " + e.getMessage());
                RequestDispatcher dis = request.getRequestDispatcher("/errors/errorAlert.jsp");
                dis.forward(request, response);
            } catch (Exception ex) {
                java.util.logging.Logger.getLogger(LoginGoogleServlet.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
