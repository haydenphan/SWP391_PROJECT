package controller;

import DAO.CourseSectionDAO;
import DAO.SectionLectureDAO;
import model.CourseSection;
import model.SectionLecture;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.time.LocalDateTime;

@WebServlet(name = "SectionLectureServlet", urlPatterns = {"/section-lecture-servlet"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 100 // 100MB
)
public class SectionLectureServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String courseIdStr = request.getParameter("courseId");
        String sectionCountStr = request.getParameter("sectionCount");

        // Log received parameters
        System.out.println("courseId: " + courseIdStr);
        System.out.println("sectionCount: " + sectionCountStr);

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

        for (int i = 1; i <= sectionCount; i++) {
            String sectionTitle = request.getParameter("sectionTitle" + i);
            System.out.println("sectionTitle" + i + ": " + sectionTitle); // Log sectionTitle
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
                System.out.println("lectureCount" + i + ": " + lectureCountStr); // Log lectureCount

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
                    Part materialPart = request.getPart("lectureMaterial" + i + "_" + j);

                    String videoFileName = Paths.get(videoPart.getSubmittedFileName()).getFileName().toString();
                    String materialFileName = Paths.get(materialPart.getSubmittedFileName()).getFileName().toString();

                    String videoFilePath = saveFile(videoPart, videoFileName);
                    String materialFilePath = saveFile(materialPart, materialFileName);

                    SectionLecture sectionLecture = new SectionLecture();
                    sectionLecture.setSectionID(sectionId);
                    sectionLecture.setLectureName(lectureTitle);
                    sectionLecture.setLectureType("Video");
                    sectionLecture.setLectureURL(videoFilePath);
                    sectionLecture.setCreatedDate(createdDate);

                    sectionLectureDAO.insert(sectionLecture);
                }
            }
        }

        response.sendRedirect("success.jsp");
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

    private String saveFile(Part filePart, String fileName) throws IOException {
        String applicationPath = getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        String filePath = uploadFilePath + File.separator + fileName;
        filePart.write(filePath);
        return UPLOAD_DIR + "/" + fileName;
    }
}
