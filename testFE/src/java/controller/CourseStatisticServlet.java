package controller;

import DAO.CourseDAO;
import DAO.CourseEnrollmentDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author quanhd
 */
@WebServlet(name="CourseStatisticServlet", urlPatterns={"/CourseStatistic"})
public class CourseStatisticServlet extends HttpServlet {
   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");       
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        CourseEnrollmentDAO ceDAO = new CourseEnrollmentDAO();
        User user = (User) request.getSession().getAttribute("user");
        if(user == null){
            request.getRequestDispatcher("pages/login.jsp").forward(request, response);
            return;
        }
        String courseID = request.getParameter("id");
        List<User> learners = ceDAO.getLearnersByCourseID(courseID);
        request.setAttribute("cls", learners);
        request.getRequestDispatcher("/pages/courseStatistic.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}