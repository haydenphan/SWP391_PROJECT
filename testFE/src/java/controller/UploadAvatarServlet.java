package controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import DAO.UserDAO;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

@WebServlet(name = "UploadAvatarServlet", urlPatterns = {"/uploadAvatar"})
@MultipartConfig
public class UploadAvatarServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "avatars";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part filePart = request.getPart("avatar");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        String filePath = uploadPath + File.separator + fileName;

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Save the file on the server
        try {
            filePart.write(filePath);
            User user = (User)request.getSession().getAttribute("user");

            // Get the current user's ID from session or request (assuming it's stored in the session)
            int userId = user.getUserID();

            // Construct the avatar URL (assuming your context path and directory structure)
            String avatarUrl = request.getContextPath() + "/avatars/" + fileName;
            
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
        } catch (IOException e) {
            e.printStackTrace();
            response.setContentType("application/json");
            response.getWriter().write("{\"success\": false, \"message\": \"File upload failed.\"}");
        } catch (Exception ex) {
            Logger.getLogger(UploadAvatarServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
