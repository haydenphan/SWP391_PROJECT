package controller;

import DAO.CourseSectionDAO;
import DAO.LectureMaterialDAO;
import DAO.SectionLectureDAO;
import model.CourseSection;
import model.SectionLecture;
import config.CloudinaryConfig;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Collection;
import java.util.Map;
import model.LectureMaterial;
import org.apache.commons.io.IOUtils;

@WebServlet(name = "SectionLectureServlet", urlPatterns = {"/section-lecture-servlet"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 100 // 100MB
)
public class SectionLectureServlet extends HttpServlet {

    private Cloudinary cloudinary;
    private static final long MAX_FILE_SIZE = 10485760; // 10MB in bytes

    @Override
    public void init() {
        this.cloudinary = CloudinaryConfig.getCloudinary();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String courseIdStr = request.getParameter("courseId");
        String sectionCountStr = request.getParameter("sectionCount");

        if (courseIdStr == null || courseIdStr.isEmpty() || sectionCountStr == null || sectionCountStr.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid courseId or sectionCount");
            return;
        }

        int courseId;
        int sectionCount;

        try {
            courseId = Integer.parseInt(courseIdStr);
            sectionCount = Integer.parseInt(sectionCountStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format for courseId or sectionCount");
            return;
        }

        CourseSectionDAO courseSectionDAO = new CourseSectionDAO();
        SectionLectureDAO sectionLectureDAO = new SectionLectureDAO();
        LectureMaterialDAO lectureMaterialDAO = new LectureMaterialDAO();

        for (int i = 1; i <= sectionCount; i++) {
            String sectionTitle = request.getParameter("sectionTitle" + i);
            if (sectionTitle == null || sectionTitle.isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid sectionTitle for section " + i);
                return;
            }
            int sectionOrder = i;
            LocalDateTime createdDate = LocalDateTime.now();

            CourseSection courseSection = new CourseSection();
            courseSection.setCourseID(courseId);
            courseSection.setSectionName(sectionTitle);
            courseSection.setSectionOrder(sectionOrder);
            courseSection.setCreatedDate(createdDate);

            int sectionId = courseSectionDAO.insert(courseSection);

            if (sectionId > 0) {
                String lectureCountStr = request.getParameter("lectureCount" + i);

                if (lectureCountStr == null || lectureCountStr.isEmpty()) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid lectureCount for section " + i);
                    return;
                }

                int lectureCount;

                try {
                    lectureCount = Integer.parseInt(lectureCountStr);
                } catch (NumberFormatException e) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid number format for lectureCount for section " + i);
                    return;
                }

                for (int j = 1; j <= lectureCount; j++) {
                    String lectureTitle = request.getParameter("lectureTitle" + i + "_" + j);
                    Part videoPart = request.getPart("lectureVideo" + i + "_" + j);
                    Collection<Part> materialParts = request.getParts();
                    processLecture(sectionId, lectureTitle, videoPart, materialParts, i, j, createdDate, sectionLectureDAO, lectureMaterialDAO);
                }
            }
        }

        response.sendRedirect("success.jsp");
    }

    private void processLecture(int sectionId, String lectureTitle, Part videoPart, Collection<Part> materialParts, int sectionIndex, int lectureIndex, LocalDateTime createdDate, SectionLectureDAO sectionLectureDAO, LectureMaterialDAO lectureMaterialDAO) throws IOException, ServletException {
        if (videoPart.getSize() > MAX_FILE_SIZE) {
            throw new ServletException("Video file size too large for lecture " + lectureIndex);
        }

        String videoUrl = uploadFileToCloudinary(videoPart);

        SectionLecture sectionLecture = new SectionLecture();
        sectionLecture.setSectionID(sectionId);
        sectionLecture.setLectureName(lectureTitle);
        sectionLecture.setLectureURL(videoUrl);
        sectionLecture.setCreatedDate(createdDate);
        int lectureId = sectionLectureDAO.insert(sectionLecture);

        for (Part materialPart : materialParts) {
            if (materialPart.getName().startsWith("lectureMaterial" + sectionIndex + "_" + lectureIndex) && materialPart.getSize() > 0) {
                if (materialPart.getSize() > MAX_FILE_SIZE) {
                    throw new ServletException("Material file size too large for lecture " + lectureIndex);
                }

                String materialUrl = uploadFileToCloudinary(materialPart);

                LectureMaterial materialLecture = new LectureMaterial();
                materialLecture.setLectureId(lectureId);
                materialLecture.setLectureMaterialUrl(materialUrl);
                lectureMaterialDAO.insert(materialLecture);
            }
        }
    }

    private String uploadFileToCloudinary(Part filePart) throws IOException {
        byte[] fileContent = IOUtils.toByteArray(filePart.getInputStream());
        String fileName = filePart.getSubmittedFileName();
        String extension = fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase();
        String baseName = fileName.substring(0, fileName.lastIndexOf('.'));

        Map uploadResult = cloudinary.uploader().upload(fileContent, ObjectUtils.asMap(
                "resource_type", getResourceType(extension),
                "public_id", baseName + "." + extension
        ));
        return uploadResult.get("secure_url").toString();
    }

    private String getResourceType(String extension) {
        return switch (extension) {
            case "jpg", "jpeg", "png", "gif", "mp4", "avi", "mov" ->
                "auto";
            case "docx" ->
                "raw";
            default ->
                "raw";
        };
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
