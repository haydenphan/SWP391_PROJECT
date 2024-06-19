/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.CourseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author quanhd
 */
@WebServlet(name="AdminCourseManage", urlPatterns={"/AdminCourseManage"})
public class AdminCourseManage extends HttpServlet {
   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminCourseManage</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminCourseManage at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        CourseDAO cdao = new CourseDAO();
        
        String courseIDParam = request.getParameter("courseID");
        if (courseIDParam != null) {
            int courseID = Integer.parseInt(courseIDParam);
            cdao.updateCourseStatus(courseID, true);
        }
        
        response.sendRedirect("PendingCourseList");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
