package controller;

import DAO.CourseDAO;
import DAO.InstructorCertificatesDAO;
import DAO.NotificationDAO;
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
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;
import model.InstructorCertificates;
import model.Notification;
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

        System.out.println(actionString);
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
                handleSubmission(request, response, user, courseId, instructorId, cert, false);
            }
            case "/resubmit" -> {
                handleSubmission(request, response, user, courseId, instructorId, cert, true);
            }
            case "/update" -> {
                handleUpdate(request, response, cert);
            }
            case "/delete" -> {
                handleDelete(request, response, cert);
            }
            default ->
                throw new AssertionError();
        }
        RequestDispatcher dis = request.getRequestDispatcher(url);
        dis.forward(request, response);
    }

    private void handleSubmission(HttpServletRequest request, HttpServletResponse response, User user, int courseId, int instructorId, InstructorCertificates cert, boolean isResubmit) throws ServletException, IOException {
        Part certificatePart = request.getPart("certificate");
        String certificateUrl = null;

        try {
            if (certificatePart != null && certificatePart.getSize() > 0) {
                certificateUrl = uploadToCloudinary(certificatePart);
            } else if (cert != null) {
                certificateUrl = cert.getCertificateUrl();
            }

            if (certificateUrl != null) {
                InstructorCertificatesDAO certDAO = new InstructorCertificatesDAO();
                if (cert == null) {
                    cert = new InstructorCertificates();
                    cert.setUserID(instructorId);
                    cert.setCourseID(courseId);
                    cert.setCertificateUrl(certificateUrl);
                    cert.setUploadDate(LocalDateTime.now());
                    certDAO.insert(cert);
                } else {
                    cert.setCertificateUrl(certificateUrl);
                    cert.setUploadDate(LocalDateTime.now());
                    certDAO.update(cert);
                }

                if (isResubmit) {
                    CourseDAO dao = new CourseDAO();
                    dao.uncancelledCourse(courseId);
                }

                sendNotification(user, courseId, isResubmit);

                request.setAttribute("message", "Submission successful!");
                RequestDispatcher dis = request.getRequestDispatcher("/course-approval-servlet/request");
                dis.forward(request, response);
            } else {
                throw new Exception("Certificate URL is null");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Submission failed!");
            RequestDispatcher dis = request.getRequestDispatcher("/course-approval-servlet/request");
            dis.forward(request, response);
        }
    }

    private void handleUpdate(HttpServletRequest request, HttpServletResponse response, InstructorCertificates cert) throws ServletException, IOException {
        Part certificatePart = request.getPart("certificate");

        try {
            String certificateUrl = uploadToCloudinary(certificatePart);
            cert.setCertificateUrl(certificateUrl);
            cert.setUploadDate(LocalDateTime.now());
            InstructorCertificatesDAO certDAO = new InstructorCertificatesDAO();
            certDAO.update(cert);
            request.setAttribute("message", "Update successful!");
            RequestDispatcher dis = request.getRequestDispatcher("/course-approval-servlet/request");
            dis.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Update failed!");
            RequestDispatcher dis = request.getRequestDispatcher("/course-approval-servlet/request");
            dis.forward(request, response);
        }
    }

    private void handleDelete(HttpServletRequest request, HttpServletResponse response, InstructorCertificates cert) throws ServletException, IOException {
        try {
            InstructorCertificatesDAO certDAO = new InstructorCertificatesDAO();
            certDAO.delete(cert.getCertificateID());
            request.setAttribute("message", "Deletion successful!");
            RequestDispatcher dis = request.getRequestDispatcher("/course-approval-servlet/request");
            dis.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Deletion failed!");
            RequestDispatcher dis = request.getRequestDispatcher("/course-approval-servlet/request");
            dis.forward(request, response);
        }
    }

    private void sendNotification(User user, int courseId, boolean isResubmit) {
        try {
            NotificationDAO notiDAO = new NotificationDAO();
            UserDAO userDAO = new UserDAO();
            List<Integer> adminIds = userDAO.getAllAdminIds();

            for (int adminId : adminIds) {
                Notification notification = new Notification();
                notification.setUserId(adminId);
                notification.setMessage("Instructor " + user.getUserID() + (isResubmit ? " resubmitted" : " requested to publish") + " a course!");
                notification.setType(isResubmit ? "CourseResubmissionRequest" : "CoursePublicationRequest");
                notification.setTimeStamp(LocalDateTime.now());
                notification.setTarget("CoursePublicationRequest");
                notification.setTargetId(courseId);
                notification.setIsRead(false);
                notiDAO.insertNotification(notification);
            }
        } catch (Exception e) {
            Logger.getLogger(CourseApprovalServlet.class.getName()).log(Level.SEVERE, null, e);
        }
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