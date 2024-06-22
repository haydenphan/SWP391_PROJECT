package controller;

import DAO.CourseDAO;
import DAO.InstructorCertificatesDAO;
import DAO.UserDAO;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import config.CloudinaryConfig;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Course;
import model.InstructorCertificates;
import model.User;
import org.apache.commons.io.IOUtils;

@WebServlet(name = "CourseApprovalServlet", urlPatterns = {"/course-approval-servlet/*"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 100 // 100MB
)
public class CourseApprovalServlet extends HttpServlet {

    private Cloudinary cloudinary;

    @Override
    public void init() {
        this.cloudinary = CloudinaryConfig.getCloudinary();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String actionString = request.getPathInfo();
        String url = "";
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        int instructorId = Integer.parseInt(request.getParameter("instructorId"));
        Course course = CourseDAO.getCoursesByID(courseId);
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByID(instructorId);
        request.setAttribute("instructor", user);
        request.setAttribute("course", course);
        switch (actionString) {
            case "/request" -> {
                url = "/pages/courseApproval.jsp";
            }
            case "/submit" -> {
                System.out.println("1");
                Part certificatePart = request.getPart("certificate");

                try {
                    String certificateUrl = uploadToCloudinary(certificatePart);
                    InstructorCertificates t = new InstructorCertificates();
                    t.setUserID(instructorId);
                    t.setCertificateUrl(certificateUrl);
                    t.setUploadDate(LocalDateTime.now());
                    InstructorCertificatesDAO dao = new InstructorCertificatesDAO();
                    dao.insert(t);
                    request.setAttribute("message", "Submission successful!");
                    url = "/pages/submissionSuccess.jsp";
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("error", "Submission failed!");
                    url = "/pages/courseApproval.jsp";
                }
            }
            default ->
                throw new AssertionError();
        }
        RequestDispatcher dis = request.getRequestDispatcher(url);
        dis.forward(request, response);
    }

    private String uploadToCloudinary(Part filePart) throws IOException {
        try (InputStream fileContent = filePart.getInputStream()) {
            byte[] bytes = IOUtils.toByteArray(fileContent);
            Map uploadResult = cloudinary.uploader().upload(bytes, ObjectUtils.emptyMap());
            return (String) uploadResult.get("url");
        }
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
