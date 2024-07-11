package controller;

import DAO.CourseDAO;
import DAO.LanguageDAO;
import DAO.LevelDAO;
import DAO.SubcategoryDAO;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import config.CloudinaryConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.util.Map;
import model.Course;
import model.User;
import org.apache.commons.io.IOUtils;

@WebServlet(name = "CourseAddingServlet", urlPatterns = {"/course-adding-servlet/*"})
@MultipartConfig
public class CourseAddingServlet extends HttpServlet {

    private Cloudinary cloudinary;

    @Override
    public void init() {
        this.cloudinary = CloudinaryConfig.getCloudinary();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // Your processRequest implementation
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String actionString = request.getPathInfo();
        String url = "";
        HttpSession session = request.getSession();

        switch (actionString) {
            case "/save-info" -> {
                // Fetch form parameters
                String subcategory = request.getParameter("subcategory");
                String name = request.getParameter("courseName");
                double price = Double.parseDouble(request.getParameter("price"));
                String language = request.getParameter("language");
                String level = request.getParameter("level");
                String description = request.getParameter("description");
                String requirements = request.getParameter("requirements");

                // Handle cover image upload
                Part filePart = request.getPart("coverImage");
                String coverImageUrl = uploadToCloudinary(filePart);

                CourseDAO courseDAO = new CourseDAO();
                Course course = new Course();
                course.setCourseName(name);
                course.setDescription(description);
                course.setPrice(price);
                course.setAverageRating(0);
                course.setCreatedBy(((User) session.getAttribute("user")).getUserID());
                System.out.println("User ID: " + course.getCreatedBy());
                LocalDateTime now = LocalDateTime.now();
                course.setCreatedDate(now);
                course.setImageURL(coverImageUrl);
                course.setIsPublished(false);
                course.setTotalEnrolled(0);
                course.setRequirements(requirements);
                course.setLastUpdate(now);
                course.setLanguageID(LanguageDAO.getLanguageIdByName(language));
                course.setLevelID(LevelDAO.getLevelIdByName(level));
                course.setSubcategoryID(SubcategoryDAO.getSubcategoryIdByName(subcategory));
                courseDAO.insert(course);
                session.setAttribute("courseCreated", true);
                url = "/pages/createCourse.jsp";
            }

            case "/create-course" ->
                url = "/pages/createCourse.jsp";

            default -> {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }
        }

        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    private String uploadToCloudinary(Part filePart) throws IOException {
        try (InputStream fileContent = filePart.getInputStream()) {
            byte[] bytes = IOUtils.toByteArray(fileContent);
            Map uploadResult = cloudinary.uploader().upload(bytes, ObjectUtils.emptyMap());
            return (String) uploadResult.get("url");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
