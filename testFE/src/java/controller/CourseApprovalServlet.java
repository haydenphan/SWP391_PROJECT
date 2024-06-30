package controller;

import DAO.CourseDAO;
import DAO.InstructorCertificatesDAO;
import DAO.UserDAO;
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
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
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
            throws ServletException, IOException, Exception {
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
        InstructorCertificatesDAO certDAO = new InstructorCertificatesDAO();
        InstructorCertificates cert = certDAO.getCertificateByCourseAndUser(courseId, instructorId);
        request.setAttribute("certificate", cert);

        switch (actionString) {
            case "/request" -> {
                url = "/pages/courseApproval.jsp";
            }
            case "/submit" -> {
                Part certificatePart = request.getPart("certificate");

                try {
                    String certificateUrl = uploadToCloudinary(certificatePart);
                    InstructorCertificates t = new InstructorCertificates();
                    t.setUserID(instructorId);
                    t.setCourseID(courseId);
                    t.setCertificateUrl(certificateUrl);
                    t.setUploadDate(LocalDateTime.now());
                    certDAO.insert(t);
                    request.setAttribute("message", "Submission successful!");
                    url = "/course-approval-servlet/request";
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("error", "Submission failed!");
                    url = "/course-approval-servlet/request";
                }
            }
            case "/update" -> {
                Part certificatePart = request.getPart("certificate");

                try {
                    String certificateUrl = uploadToCloudinary(certificatePart);
                    cert.setCertificateUrl(certificateUrl);
                    cert.setUploadDate(LocalDateTime.now());
                    certDAO.update(cert);
                    request.setAttribute("message", "Update successful!");
                    url = "/course-approval-servlet/request";
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("error", "Update failed!");
                    url = "/course-approval-servlet/request";
                }
            }
            case "/delete" -> {
                try {
                    certDAO.delete(cert.getCertificateID());
                    request.setAttribute("message", "Deletion successful!");
                    url = "/course-approval-servlet/request";
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("error", "Deletion failed!");
                    url = "/course-approval-servlet/request";
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CourseApprovalServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CourseApprovalServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}