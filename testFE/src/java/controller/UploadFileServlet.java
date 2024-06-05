package controller;

import jakarta.servlet.ServletContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

/**
 *
 * @author quanhd
 */
@MultipartConfig
@WebServlet(name = "UploadFileServlet", urlPatterns = {"/UploadFile"})
public class UploadFileServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String action = request.getParameter("Action");
            Part part = request.getPart(action);
            ServletContext context = request.getServletContext();
            String tempDirectory = context.getInitParameter("javax.servlet.context.tempdir");
            String fileName = Path.of(part.getSubmittedFileName()).getFileName().toString();
            String uploadDirectory = context.getRealPath("/resource")+"\\"+action;
            if (!Files.exists(Path.of(uploadDirectory))) {
                Files.createDirectories(Path.of(uploadDirectory));
            }           
            Files.copy(part.getInputStream(), Path.of(uploadDirectory, fileName), StandardCopyOption.REPLACE_EXISTING);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        response.sendRedirect("pages/addCourse.jsp");
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
