package controller;

import DAO.CourseDAO;
import model.Course;
import config.CloudinaryConfig;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.time.LocalDateTime;

import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "EditCourseInfoServlet", urlPatterns = {"/edit-course-info-servlet"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 100 // 100MB
)
public class EditCourseInfoServlet extends HttpServlet {

    private Cloudinary cloudinary;

    @Override
    public void init() {
        this.cloudinary = CloudinaryConfig.getCloudinary();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        String action = request.getParameter("action");
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        Course course = CourseDAO.getCoursesByID(courseId);

        if ("save".equals(action)) {
            saveCourse(request, course);
            response.sendRedirect(request.getContextPath() + "/course-details?courseId=" + courseId);
        } else {
            request.setAttribute("currentCourse", course);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/editCourseInfo.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void saveCourse(HttpServletRequest request, Course course) throws IOException, ServletException, Exception {
        String title = request.getParameter("courseName");
        String description = request.getParameter("courseDescription");
        double price = Double.parseDouble(request.getParameter("coursePrice"));

        course.setCourseName(title);
        course.setDescription(description);
        course.setPrice(price);
        course.setLastUpdate(LocalDateTime.now());

        Part imagePart = request.getPart("courseImage");
        String imageUrl = request.getParameter("currentCourseImage");
        if (imagePart != null && imagePart.getSize() > 0) {
            imageUrl = uploadFileToCloudinary(imagePart);
        }
        course.setImageURL(imageUrl);

        boolean isUpdated = CourseDAO.updateCourse(course);
        if (!isUpdated) {
            throw new ServletException("Error updating course");
        }
    }

    private String uploadFileToCloudinary(Part filePart) throws IOException {
        String fileName = filePart.getSubmittedFileName();
        Map uploadResult = cloudinary.uploader().upload(filePart.getInputStream(), ObjectUtils.asMap("resource_type", "auto", "public_id", fileName));
        return (String) uploadResult.get("secure_url");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(EditCourseInfoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(EditCourseInfoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Edit Course Info Servlet";
    }
}
