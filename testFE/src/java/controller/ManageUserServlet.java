package controller;

import DAO.AdminDAO;
import DAO.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ManageUserServlet", urlPatterns = {"/manageuser"})
public class ManageUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        if (session != null && session.getAttribute("user") != null) {
            switch (action) {
                case "viewList" ->
                    getListUser(request, response);
                case "enableUser" ->
                    enableUser(request, response);
                case "disableUser" ->
                    disableUser(request, response);
                case "setRole" ->
                    setRoleUser(request, response);
                case "filterUsers" ->
                    filterUsers(request, response);
                default ->
                    getListUser(request, response);
            }
        } else {
            response.sendRedirect("sign-in.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void getListUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user.getRole() != 3) {
            request.setAttribute("msg", "Trang chỉ dành cho quản trị viên!");
            request.getRequestDispatcher("product").forward(request, response);
            return;
        }

        try {
            String indexS = request.getParameter("index");
            int index = (indexS == null) ? 1 : Integer.parseInt(indexS);
            AdminDAO adminDAO = new AdminDAO();
            List<User> listUsers = (List) request.getAttribute("listUser") != null ? (List) request.getAttribute("listUser") : adminDAO.getUsers(index);
            int count = adminDAO.getTotalUser();

            int endPage = count / 10;
            if (count % 10 != 0) {
                endPage++;
            }

            if (!listUsers.isEmpty()) {
                request.setAttribute("endP", endPage);
                request.setAttribute("selectedPage", index);
                request.setAttribute("listUser", listUsers);
            } else {
                request.setAttribute("msg", "There are no users in your system");
            }
            request.getRequestDispatcher("/admin/manage-user.jsp").forward(request, response);
        } catch (IOException | NumberFormatException | SQLException | ServletException e) {
        }
    }

    private void disableUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String idAccountS = request.getParameter("id");
            if (idAccountS != null) {
                int idAccount = Integer.parseInt(idAccountS);
                AdminDAO adminDAO = new AdminDAO();
                int result = adminDAO.disableUser(idAccount);
                request.setAttribute("isDisable", result > 0 ? "Disable successfully" : "Disable User Failed");
            }
            getListUser(request, response);
        } catch (IOException | NumberFormatException | SQLException | ServletException e) {
        }
    }

    private void enableUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String idAccountS = request.getParameter("id");
            if (idAccountS != null) {
                int idAccount = Integer.parseInt(idAccountS);
                AdminDAO adminDAO = new AdminDAO();
                int result = adminDAO.enableUser(idAccount);
                request.setAttribute("isDisable", result > 0 ? "Enable successfully" : "Enable User Failed");
            }
            getListUser(request, response);
        } catch (IOException | NumberFormatException | SQLException | ServletException e) {
        }
    }

    private void setRoleUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String idAccountS = request.getParameter("id");
            String roleIdS = request.getParameter("roleId");
            if (idAccountS != null && roleIdS != null) {
                int idAccount = Integer.parseInt(idAccountS);
                int roleId = Integer.parseInt(roleIdS);
                AdminDAO adminDAO = new AdminDAO();
                int result = adminDAO.setRoleUser(idAccount, roleId);
                request.setAttribute("isDisable", result > 0 ? "Role set successfully" : "Set Role Failed");
            }
            getListUser(request, response);
        } catch (IOException | NumberFormatException | SQLException | ServletException e) {
        }
    }

    private void filterUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String role = request.getParameter("role");
        String banned = request.getParameter("banned");
        String newUser = request.getParameter("newUser");
        String topPurchaser = request.getParameter("topPurchaser");

        UserDAO userDAO = new UserDAO();
        System.out.println("filtered list");
        List<User> filteredUsers = userDAO.filterUsers(role, banned, newUser, topPurchaser);

        request.setAttribute("listUser", filteredUsers);
        getListUser(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Manage User Servlet";
    }
}
