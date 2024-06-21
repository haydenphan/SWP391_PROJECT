package controller;

import DAO.CourseDAO;
import DAO.CourseSectionDAO;
import DAO.SectionLectureDAO;
import DAO.LectureMaterialDAO;
import model.Course;
import model.CourseSection;
import model.SectionLecture;
import model.LectureMaterial;
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
import java.util.logging.Level;
import java.util.logging.Logger;
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
            throws ServletException, IOException, Exception {
        String action = request.getParameter("action");
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        Course course = CourseDAO.getCoursesByID(courseId);
        List<CourseSection> sections = CourseSectionDAO.getCourseSections(courseId);

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

    private void saveCourse(HttpServletRequest request, Course course) throws IOException, ServletException, Exception {
        String title = request.getParameter("courseName");
        String description = request.getParameter("courseDescription");
        double price = Double.parseDouble(request.getParameter("coursePrice"));

        course.setCourseName(title);
        course.setDescription(description);
        course.setPrice(price);
        course.setLastUpdate(LocalDateTime.now());

        Part imagePart = request.getPart("courseImage");
        String imageUrl = request.getParameter("currentCourseImage");
        if (imagePart != null && imagePart.getSize() > 0) {
            imageUrl = uploadFileToCloudinary(imagePart);
        }
        course.setImageURL(imageUrl);

        boolean isUpdated = CourseDAO.updateCourse(course);
        if (!isUpdated) {
            throw new ServletException("Error updating course");
        }
        updateSectionsAndLectures(request, course.getCourseID());
    }

    private void updateSectionsAndLectures(HttpServletRequest request, int courseId) throws IOException, ServletException, Exception {
        CourseSectionDAO courseSectionDAO = new CourseSectionDAO();
        SectionLectureDAO sectionLectureDAO = new SectionLectureDAO();
        LectureMaterialDAO lectureMaterialDAO = new LectureMaterialDAO();

        String[] sectionIds = request.getParameterValues("sectionId");
        if (sectionIds != null) {
            for (String sectionIdStr : sectionIds) {
                int sectionId = Integer.parseInt(sectionIdStr);
                boolean deleteSection = Boolean.parseBoolean(request.getParameter("deleteSection" + sectionIdStr));
                if (deleteSection) {
                    courseSectionDAO.delete(sectionId);
                    continue;
                }

                String sectionTitle = request.getParameter("sectionTitle" + sectionIdStr);

                CourseSection section = new CourseSection();
                section.setSectionID(sectionId);
                section.setCourseID(courseId);
                section.setSectionName(sectionTitle);

                boolean isUpdated = courseSectionDAO.updateSection(section);
                if (!isUpdated) {
                    throw new ServletException("Error updating section");
                }

                String[] lectureIds = request.getParameterValues("lectureId" + sectionIdStr);
                if (lectureIds != null) {
                    for (String lectureIdStr : lectureIds) {
                        int lectureId = Integer.parseInt(lectureIdStr);
                        boolean deleteLecture = Boolean.parseBoolean(request.getParameter("deleteLecture" + sectionIdStr + "_" + lectureIdStr));
                        if (deleteLecture) {
                            sectionLectureDAO.delete(lectureId);
                            continue;
                        }

                        String lectureTitle = request.getParameter("lectureTitle" + sectionIdStr + "_" + lectureIdStr);
                        Part videoPart = request.getPart("lectureVideo" + sectionIdStr + "_" + lectureIdStr);
                        String videoUrl = request.getParameter("currentLectureVideo" + sectionIdStr + "_" + lectureIdStr);
                        if (videoPart != null && videoPart.getSize() > 0) {
                            videoUrl = uploadFileToCloudinary(videoPart);
                        }

                        SectionLecture lecture = new SectionLecture();
                        lecture.setLectureID(lectureId);
                        lecture.setSectionID(sectionId);
                        lecture.setLectureName(lectureTitle);
                        lecture.setLectureURL(videoUrl);

                        sectionLectureDAO.updateLecture(lecture);

                        String[] materialIds = request.getParameterValues("lectureMaterialId" + sectionIdStr + "_" + lectureIdStr);
                        if (materialIds != null) {
                            for (String materialIdStr : materialIds) {
                                int materialId = Integer.parseInt(materialIdStr);
                                Part materialPart = request.getPart("lectureMaterial" + sectionIdStr + "_" + lectureIdStr + "_" + materialIdStr);
                                String materialUrl = request.getParameter("currentLectureMaterial" + sectionIdStr + "_" + lectureIdStr + "_" + materialIdStr);
                                if (materialPart != null && materialPart.getSize() > 0) {
                                    materialUrl = uploadFileToCloudinary(materialPart);
                                }

                                LectureMaterial material = new LectureMaterial();
                                material.setLectureMaterialId(materialId);
                                material.setLectureId(lectureId);
                                material.setLectureMaterialUrl(materialUrl);

                                lectureMaterialDAO.updateMaterial(material);
                            }
                        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(EditCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(EditCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Edit Course Servlet";
    }
}
