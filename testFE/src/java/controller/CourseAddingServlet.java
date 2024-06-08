package controller;

import DAO.CourseDAO;
import DAO.LanguageDAO;
import DAO.LevelDAO;
import DAO.SubcategoryDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import model.Course;
import model.User;

@WebServlet(name = "CourseAddingServlet", urlPatterns = {"/course-adding-servlet/*"})
@MultipartConfig
public class CourseAddingServlet extends HttpServlet {

    private static final String COVER_IMAGE_UPLOAD_DIRECTORY = "uploads/coverImages";

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
        if (actionString.equals("/course-info")) {
            // Fetch form parameters
            String name = request.getParameter("courseName");
            double price = Double.parseDouble(request.getParameter("price"));
            String category = request.getParameter("category");
            String language = request.getParameter("language");
            String level = request.getParameter("level");
            String description = request.getParameter("description");
            String requirements = request.getParameter("requirements");

            // Handle cover image upload
            Part filePart = request.getPart("coverImage");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("") + File.separator + COVER_IMAGE_UPLOAD_DIRECTORY;
            String filePath = uploadPath + File.separator + fileName;

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            File existingFile = new File(filePath);
            if (existingFile.exists()) {
                existingFile.delete();
            }

            try (InputStream fileContent = filePart.getInputStream()) {
                Files.copy(fileContent, Paths.get(filePath));
            }

            // Save the cover image path to the session or database
            String coverImagePath = COVER_IMAGE_UPLOAD_DIRECTORY + "/" + fileName;

            session.setAttribute("coverImagePath", coverImagePath);
            session.setAttribute("name", name);
            session.setAttribute("price", price);
            session.setAttribute("category", category);
            session.setAttribute("language", language);
            session.setAttribute("level", level);
            session.setAttribute("description", description);
            session.setAttribute("requirements", requirements);

            url = "/pages/createCourse2.jsp";
        } else if (actionString.equals("/save-info")) {
            String subcategory = request.getParameter("subcategory");
            String name = (String) session.getAttribute("name");
            double price = (Double) session.getAttribute("price");
            String language = (String) session.getAttribute("language");
            String level = (String) session.getAttribute("level");
            String description = (String) session.getAttribute("description");
            String requirements = (String) session.getAttribute("requirements");
            String coverImagePath = (String) session.getAttribute("coverImagePath");

            CourseDAO courseDAO = new CourseDAO();
            Course course = new Course();
            course.setCourseName(name);
            course.setDescription(description);
            course.setPrice(price);
            course.setAverageRating(0);
            course.setCreatedBy(((User)session.getAttribute("user")).getUserID());
            LocalDateTime now = LocalDateTime.now();
            course.setCreatedDate(now);
            course.setImageURL(coverImagePath);
            course.setIsPublished(false);
            course.setTotalEnrolled(0);
            course.setRequirements(requirements);
            course.setLastUpdate(now);
            course.setLanguageID(LanguageDAO.getLanguageIdByName(language));
            course.setLevelID(LevelDAO.getLevelIdByName(level));
            course.setSubcategoryID(SubcategoryDAO.getSubcategoryIdByName(subcategory));
            courseDAO.insert(course);
            session.removeAttribute("coverImagePath");
            session.removeAttribute("name");
            session.removeAttribute("price");
            session.removeAttribute("category");
            session.removeAttribute("language");
            session.removeAttribute("level");
            session.removeAttribute("description");
            session.removeAttribute("requirements");
            url = "/pages/testSection.jsp" + "?courseId=" + courseDAO.getCourseIDByLecturerAndName(course.getCreatedBy(), course.getCourseName());
            System.out.println(url);
        } else if (actionString.equals("/create-course")) {
            url = "/pages/createCourse.jsp";
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
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
