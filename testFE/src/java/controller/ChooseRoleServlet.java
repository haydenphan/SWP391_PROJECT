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
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

@WebServlet(name = "ChooseRoleServlet", urlPatterns = {"/choose-role"})
public class ChooseRoleServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String roleName = request.getParameter("role");
        int roleID = 0;
        if (roleName.equals("1")) {
            roleID = 1;
        } else {
            roleID = 2;
        }
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            Random rd = new Random();
            String username = System.currentTimeMillis() + rd.nextInt(1000) + "";
            user.setUserName(username);
            user.setRole(roleID);
            System.out.println(roleID);
            System.out.println(user.toString());
            // Update user role in the database
            UserDAO userDAO = new UserDAO();
            try {
                userDAO.insert(user);
            } catch (Exception ex) {
                Logger.getLogger(ChooseRoleServlet.class.getName()).log(Level.SEVERE, null, ex);
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while updating user role.");
                return;
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "User not found in session.");
            return;
        }
        session.setAttribute("user", user);

        // Forward to the user profile page
        String url = "/pages/lecturer-profile.jsp";
        if (user.getRole() == 1) {
            url = "/pages/user-profile.jsp";
        }
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Servlet that handles user role selection and updates";
    }
}