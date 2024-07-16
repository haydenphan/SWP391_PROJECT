

package controller;

import DAO.CourseDAO;
import DAO.CourseEnrollmentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Course;
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
        HttpSession session = request.getSession();
        CourseDAO courseDAO = new CourseDAO();
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
