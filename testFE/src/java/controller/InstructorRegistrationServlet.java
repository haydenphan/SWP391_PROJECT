package controller;

import DAO.InstructorApprovalsDAO;
import DAO.InstructorCertificatesDAO;
import DAO.NotificationDAO;
import DAO.UserDAO;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import config.CloudinaryConfig;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.InstructorApprovals;
import model.InstructorCertificates;
import model.Notification;
import model.User;
import org.apache.commons.io.IOUtils;

@WebServlet(name = "InstructorRegistrationServlet", urlPatterns = {"/instructor-registration"})
@MultipartConfig
public class InstructorRegistrationServlet extends HttpServlet {

    private Cloudinary cloudinary;

    @Override
    public void init() {
        this.cloudinary = CloudinaryConfig.getCloudinary();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserDAO userDAO = new UserDAO();
        User user = (User) session.getAttribute("user");
        String url = "/home?role=" + user.getRole();

        InstructorApprovalsDAO iADAO = new InstructorApprovalsDAO();
        InstructorApprovals approval = new InstructorApprovals();
        approval.setUserID(user.getUserID());
        approval.setIsApproved(false);
        approval.setRequestDate(java.sql.Date.valueOf(LocalDate.now()));
        approval.setApprovalDate(null);

        int approvalID = iADAO.insert(approval);

        // Fetch form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String bio = request.getParameter("bio");

        // Split name into first name and last name
        String[] nameParts = name.split(" ", 2);
        String firstName = nameParts.length > 0 ? nameParts[0] : "";
        String lastName = nameParts.length > 1 ? nameParts[1] : "";

        // Handle cover image upload
        Part coverImagePart = request.getPart("coverImage");
        String coverImageUrl = uploadToCloudinary(coverImagePart);

        // Handle credentials files upload
        List<String> credentialsUrls = new ArrayList<>();
        for (Part part : request.getParts()) {
            if (part.getName().equals("credentials")) {
                String fileUrl = uploadToCloudinary(part);
                credentialsUrls.add(fileUrl);

                // Insert each credential into the database
                InstructorCertificates certificate = new InstructorCertificates();
                certificate.setApprovalID(approvalID);
                certificate.setCertificateUrl(fileUrl);
                certificate.setUploadDate(LocalDateTime.now());
                InstructorCertificatesDAO icDAO = new InstructorCertificatesDAO();
                icDAO.insert(certificate);
            }
        }

        // Update user object
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setBio(bio);
        user.setAvatar(coverImageUrl);

        try {
            // Update user in database
            boolean updated = userDAO.updateUserProfile(user);
            if (updated) {
                session.setAttribute("user", user);
                request.setAttribute("message", "Profile updated successfully.");
            } else {
                request.setAttribute("message", "Failed to update profile.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "An error occurred while updating profile.");
        }
        
        NotificationDAO notiDAO = new NotificationDAO();
        List<Integer> adminIds = userDAO.getAllAdminIds();

        for (int adminId : adminIds) {
            Notification notification = new Notification();
            notification.setUserId(adminId);
            notification.setMessage("User " + user.getUserID() + " requested to be register as instructor");
            notification.setType("InstructorRegistration");
            notification.setTimeStamp(LocalDateTime.now());
            notification.setTarget("InstructorRegistration");
            notification.setTargetId(user.getUserID());
            notification.setIsRead(false);
            notiDAO.insertNotification(notification);
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
    public String getServletInfo() {
        return "Instructor Registration Servlet";
    }
}
