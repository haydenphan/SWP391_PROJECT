package controller;

import DAO.CourseDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Course;

@WebServlet(name = "SearchController", urlPatterns = {"/search"})
public class SearchServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Lấy tham số tìm kiếm từ request
        String txtSearch = request.getParameter("txt");

        // Gọi phương thức tìm kiếm trong DAO
        CourseDAO courseDAO = new CourseDAO();
        List<Course> searchResults = courseDAO.searchCourse(txtSearch);

        // Đặt danh sách kết quả tìm kiếm vào thuộc tính của request
        request.setAttribute("courses", searchResults);

        // Chuyển hướng sang trang courseList.jsp để hiển thị kết quả
        request.getRequestDispatcher("pages/courseList.jsp").forward(request, response);
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
        return "Short description";
    }
}
