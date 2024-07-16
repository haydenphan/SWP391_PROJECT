//package controller;
//
//import DAO.CourseDAO;
//import java.io.IOException;
//import java.util.List;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import model.*;
//
//@WebServlet("/instructor-courses")
//public class InstructorCoursesServlet extends HttpServlet {
//
//    private static final int COURSES_PER_PAGE = 2;
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int instructorID = ((User) request.getSession().getAttribute("user")).getUserID();
//        CourseDAO dao = new CourseDAO();
//
//        // Get the current page number, default to 1 if not provided
//        int page = 1;
//        if (request.getParameter("page") != null) {
//            page = Integer.parseInt(request.getParameter("page"));
//        }
//
//        // Calculate the start and end index for courses to be displayed
//        int start = (page - 1) * COURSES_PER_PAGE;
//        List<Course> coursesList = dao.getCoursesByInstructorPaginated(instructorID, start, COURSES_PER_PAGE);
//        int totalCourses = CourseDAO.countCoursesByInstructor(instructorID);
//        System.out.println(totalCourses);
//        int totalPages = (int) Math.ceil((double) totalCourses / COURSES_PER_PAGE);
//
//        request.setAttribute("coursesList", coursesList);
//        request.setAttribute("currentPage", page);
//        request.setAttribute("totalPages", totalPages);
//
//        request.getRequestDispatcher("/pages/instructorHome.jsp").forward(request, response);
//    }
//    
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doGet(request, response);
//    }
//}
