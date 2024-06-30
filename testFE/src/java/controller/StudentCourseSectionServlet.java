package controller;

import DAO.CourseSectionDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.CourseSection;

@WebServlet(name = "StudentCourseSectionServlet", urlPatterns = {"/student-course-sections"})
public class StudentCourseSectionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        int courseId = Integer.parseInt(request.getParameter("courseId"));
        CourseSectionDAO courseSectionDAO = new CourseSectionDAO();
        List<CourseSection> sectionList = courseSectionDAO.getCourseSectionsByCourseId(courseId);

        if (sectionList != null && !sectionList.isEmpty()) {
            request.setAttribute("sectionList", sectionList);
            RequestDispatcher dis = request.getRequestDispatcher("/pages/manageStudentSection.jsp");
            dis.forward(request, response);
        } else {
            request.setAttribute("error", "Khóa học không có phần nào!");
            RequestDispatcher dis = request.getRequestDispatcher("/errors/errorAlert.jsp");
            dis.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet for student course sections";
    }
}
