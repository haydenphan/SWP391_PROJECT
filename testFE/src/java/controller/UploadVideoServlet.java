package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;

@WebServlet("/uploadVideo")
@MultipartConfig
public class UploadVideoServlet extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "uploads/videos";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Create path components to save the file
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs(); // Use mkdirs() to create the directory and any necessary parent directories

        Part filePart = request.getPart("video");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.

        // Create the file on server
        File file = new File(uploadDir, fileName);
        try (InputStream fileContent = filePart.getInputStream()) {
            Files.copy(fileContent, file.toPath());
        }

        // Optionally, save the file path to database
        String filePath = UPLOAD_DIRECTORY + "/" + fileName;
        // saveFilePathToDatabase(filePath);

        response.getWriter().println("Video uploaded successfully! File path: " + filePath);
    }

    // Optionally, you can create a method to save the file path to your database
    /*
    private void saveFilePathToDatabase(String filePath) {
        // Implement your database logic here
    }
    */
}
