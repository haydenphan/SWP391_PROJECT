package controller;

import DAO.CourseDAO;
import DAO.CourseSectionDAO;
import DAO.SectionLectureDAO;
import model.Course;
import model.CourseSection;
import model.SectionLecture;
import config.CloudinaryConfig;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;

@WebServlet(name = "EditCourseServlet", urlPatterns = {"/edit-course-servlet"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 100 // 100MB
)
public class EditCourseServlet extends HttpServlet {

    private Cloudinary cloudinary;

    @Override
    public void init() {
        this.cloudinary = CloudinaryConfig.getCloudinary();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        Course course = CourseDAO.getCoursesByID(courseId);
        List<CourseSection> sections = CourseSectionDAO.getCourseSections(courseId);
        for (CourseSection section : sections) {
            for (SectionLecture lecture : section.getLectures()) {
                System.out.println(lecture.toString());
            }
        }

        if ("save".equals(action)) {
            saveCourse(request, course);
            response.sendRedirect(request.getContextPath() + "/course-details?courseId=" + courseId);
        } else {
            request.setAttribute("currentCourse", course);
            request.setAttribute("sections", sections);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/editCourse.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void saveCourse(HttpServletRequest request, Course course) throws IOException, ServletException {
        String title = request.getParameter("courseName");
        String description = request.getParameter("courseDescription");
        double price = Double.parseDouble(request.getParameter("coursePrice"));
        int categoryId = Integer.parseInt(request.getParameter("courseCategory"));

        course.setCourseName(title);
        course.setDescription(description);
        course.setPrice(price);
        course.setSubcategoryID(categoryId);

        Part imagePart = request.getPart("courseImage");
        if (imagePart != null && imagePart.getSize() > 0) {
            String imageUrl = uploadFileToCloudinary(imagePart);
            course.setImageURL(imageUrl);
        }

        CourseDAO.updateCourse(course);
        updateSectionsAndLectures(request, course.getCourseID());
    }

    private void updateSectionsAndLectures(HttpServletRequest request, int courseId) throws IOException, ServletException {
        CourseSectionDAO courseSectionDAO = new CourseSectionDAO();
        SectionLectureDAO sectionLectureDAO = new SectionLectureDAO();

        String[] sectionIds = request.getParameterValues("sectionId");
        if (sectionIds != null) {
            for (String sectionIdStr : sectionIds) {
                int sectionId = Integer.parseInt(sectionIdStr);
                String sectionTitle = request.getParameter("sectionTitle" + sectionId);
                int sectionOrder = Integer.parseInt(request.getParameter("sectionOrder" + sectionId));

                CourseSection section = new CourseSection();
                section.setSectionID(sectionId);
                section.setCourseID(courseId);
                section.setSectionName(sectionTitle);
                section.setSectionOrder(sectionOrder);

                courseSectionDAO.updateSection(section);

                String[] lectureIds = request.getParameterValues("lectureId" + sectionId);
                if (lectureIds != null) {
                    for (String lectureIdStr : lectureIds) {
                        int lectureId = Integer.parseInt(lectureIdStr);
                        String lectureTitle = request.getParameter("lectureTitle" + sectionId + "_" + lectureId);
                        Part videoPart = request.getPart("lectureVideo" + sectionId + "_" + lectureId);
                        Part materialPart = request.getPart("lectureMaterial" + sectionId + "_" + lectureId);

                        String videoUrl = videoPart != null && videoPart.getSize() > 0 ? uploadFileToCloudinary(videoPart) : null;
                        String materialUrl = materialPart != null && materialPart.getSize() > 0 ? uploadFileToCloudinary(materialPart) : null;

                        SectionLecture lecture = new SectionLecture();
                        lecture.setLectureID(lectureId);
                        lecture.setSectionID(sectionId);
                        lecture.setLectureName(lectureTitle);
                        if (videoUrl != null) {
                            lecture.setLectureURL(videoUrl);
                        }
                        if (materialUrl != null) {
                            lecture.setLectureURL(materialUrl);
                        }

                        sectionLectureDAO.updateLecture(lecture);
                    }
                }
            }
        }
    }

    private String uploadFileToCloudinary(Part filePart) throws IOException {
        String fileName = filePart.getSubmittedFileName();
        Map uploadResult = cloudinary.uploader().upload(filePart.getInputStream(), ObjectUtils.asMap("resource_type", "auto", "public_id", fileName));
        return (String) uploadResult.get("secure_url");
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
        return "Edit Course Servlet";
    }
}
