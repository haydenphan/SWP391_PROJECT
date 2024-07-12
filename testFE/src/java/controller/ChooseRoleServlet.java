package controller;

import DAO.JDBC;
import DAO.UserDAO;
import DAO.WalletDAO;
import java.io.IOException;
import java.util.Random;
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
import model.Wallet;

@WebServlet(name = "ChooseRoleServlet", urlPatterns = {"/choose-role"})
public class ChooseRoleServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
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
            // Update user role in the database
            UserDAO userDAO = new UserDAO();
            try {
                int userID = userDAO.insert(user);
                if (user.getRole() == 2) {
                    Wallet uWallet = new Wallet();
                    uWallet.setBalance(0);
                    WalletDAO wDAO = new WalletDAO(JDBC.getConnectionWithSqlJdbc());
                    int walletID = wDAO.insert(uWallet);
                    if (walletID > 0) {
                        user.setWalletID(walletID);
                        userDAO.updateUserWalletID(userID, walletID);
                    }
                    System.out.println(walletID + "Wallet Status");
                }
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
        String url = "/home?role=2";
        if (user.getRole() == 1) {
            url = "/home?role=1";
        }
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet that handles user role selection and updates";
    }
}
