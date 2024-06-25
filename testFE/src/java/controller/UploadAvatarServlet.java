package controller;

import java.io.IOException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import DAO.UserDAO;
import config.CloudinaryConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.User;

@WebServlet(name = "UploadAvatarServlet", urlPatterns = {"/uploadAvatar"})
@MultipartConfig
public class UploadAvatarServlet extends HttpServlet {

    private Cloudinary cloudinary;

    @Override
    public void init() {
        this.cloudinary = CloudinaryConfig.getCloudinary();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part filePart = request.getPart("avatar");
        String fileName = filePart.getSubmittedFileName();

        // Ensure the file is read as a byte array before uploading
        byte[] fileContent = filePart.getInputStream().readAllBytes();

        try {
            // Upload the file to Cloudinary
            Map<String, Object> uploadResult = cloudinary.uploader().upload(fileContent, ObjectUtils.asMap(
                    "public_id", "avatars/" + fileName,
                    "folder", "avatars"
            ));

            // Get the URL of the uploaded file
            String avatarUrl = uploadResult.get("secure_url").toString();

            User user = (User) request.getSession().getAttribute("user");
            int userId = user.getUserID();

            // Update the database with the new avatar URL
            UserDAO userDAO = new UserDAO();
            boolean updateSuccess = userDAO.updateUserAvatar(userId, avatarUrl);

            user.setAvatar(avatarUrl);
            request.getSession().setAttribute("user", user);

            response.setContentType("application/json");
            if (updateSuccess) {
                response.getWriter().write("{\"success\": true, \"avatarUrl\": \"" + avatarUrl + "\"}");
            } else {
                response.getWriter().write("{\"success\": false, \"message\": \"Database update failed.\"}");
            }
        } catch (Exception ex) {
            Logger.getLogger(UploadAvatarServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.setContentType("application/json");
            response.getWriter().write("{\"success\": false, \"message\": \"File upload failed.\"}");
        }
    }
}