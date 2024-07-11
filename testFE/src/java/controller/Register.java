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
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;
import java.time.LocalDateTime;
import utils.PasswordUtils;

@WebServlet(name = "Register", urlPatterns = {"/dang-ky"})
public class Register extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Register</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String firstname = (String) session.getAttribute("firstname");
        String lastname = (String) session.getAttribute("lastname");
        String email = (String) session.getAttribute("email");
        String username = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");
        String roles = (String) session.getAttribute("roles");

        if (!roles.equals("learner") && !roles.equals("instructor")) {
            response.sendRedirect(request.getContextPath() + "/errorPage.jsp");
            return;
        }

        int roleID = roles.equals("learner") ? 1 : 2;
        int providerID = 1;
        String url = "";

        UserDAO userDAO = new UserDAO();

        LocalDateTime now = LocalDateTime.now();
        byte[] salt = PasswordUtils.generateSalt();
        String hashedPassword = null;
        try {
            hashedPassword = PasswordUtils.hashPassword(password, salt);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }
        String defaultAvatarUrl = request.getContextPath() + "/img/avatar-default.png";
        String defaultBio = "No bio yet";
        User user = new User();
        user.setUserName(username);
        user.setPasswordHash(hashedPassword);
        user.setFirstName(firstname);
        user.setLastName(lastname);
        user.setEmail(email);
        user.setRole(roleID);
        user.setRegistrationDate(now);
        user.setIsActive(true);
        user.setAvatar(defaultAvatarUrl);
        user.setBio(defaultBio);
        user.setStoredSalt(salt);
        user.setProviderID(providerID);

        userDAO.insert(user);
        session.setAttribute("user", user);

        url = "/home?role=" + user.getRole();

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
    }
}