
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author tuan6
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/homepage/register"})
public class RegisterServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String firstname = req.getParameter("firstname");
        String lastname = req.getParameter("lastname");
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role_raw = req.getParameter("role");
        int role = Integer.parseInt(role_raw);
        String pageRedirect = "login.jsp";
        UserDAO userDAO = new UserDAO();

        if (userDAO.getUserByEmail(email) != null) {
            String errorMessage = "Đăng kí không thành công ! Email đã tồn tại";
            req.setAttribute("errorMessage", errorMessage);
            req.getRequestDispatcher("registration.jsp").forward(req, resp);
        }
        if (userDAO.getUserByUserName(username) != null) {
            String errorMessage = "Đăng kí không thành công ! Nickname đã tồn tại";
            req.setAttribute("errorMessage", errorMessage);
            req.getRequestDispatcher("registration.jsp").forward(req, resp);
        }
        User account = new User();
        account.setUsername(username);
        account.setPasswordHash(password);
        account.setFirstName(firstname);
        account.setLastName(lastname);
        account.setEmail(email);
        account.setRoleID(role);
        account.setRegistrationDate(null);
        boolean addStatus = userDAO.addUser(account);
        if (addStatus) {
                String successMessage = "Đăng kí thành công!";
                req.setAttribute("successMessage", successMessage);
            } else {
                req.setAttribute("errorMessage", "Có lôi bên server ! Vui long thu lai sau ");
            }
        // Check if passwords match
//        if (repass.equals(password)) {
//            int id = userDAO.getLengthUser() + 1;
//            User newUser = new User(name, username, password, Integer.parseInt(gender), phone);
//            newUser.setIDAccount(id);
//            newUser.setIDEmail(email);
//            boolean addStatus = userDAO.addUser(newUser);
//            if (addStatus) {
//                String successMessage = "Đăng kí thành công!";
//                req.setAttribute("successMessage", successMessage);
//            } else {
//                req.setAttribute("errorMessage", "Có lôi bên server ! Vui long thu lai sau ");
//            }
//
//        } else {
//            String errorMessage = "Đăng kí không thành công ! Mật khẩu không khớp ";
//
//            req.setAttribute("errorMessage", errorMessage);
//        }

        req.getRequestDispatcher(pageRedirect).forward(req, resp);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
