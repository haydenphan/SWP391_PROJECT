package controller;

import DAO.CourseSectionDAO;
import DAO.LectureMaterialDAO;
import DAO.SectionLectureDAO;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import config.CloudinaryConfig;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.LectureMaterial;
import model.SectionLecture;
import org.apache.commons.io.IOUtils;

@WebServlet(name = "LectureManagementServlet", urlPatterns = {"/lecture-management"})
@MultipartConfig // Add this annotation to handle file uploads
public class LectureManagementServlet extends HttpServlet {
    
    private Cloudinary cloudinary;
    
    @Override
    public void init() {
        this.cloudinary = CloudinaryConfig.getCloudinary();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        String sectionIdParam = request.getParameter("sectionId");
        String url = "";
        
        if (sectionIdParam == null || sectionIdParam.isEmpty()) {
            request.setAttribute("error", "Section ID is missing");
            url = "/errors/errorAlert.jsp";
        } else {
            int sectionId = Integer.parseInt(sectionIdParam);
            
            if ("view".equals(action)) {
                List<SectionLecture> lectures = SectionLectureDAO.getLecturesBySectionId(sectionId);
                request.setAttribute("lectures", lectures);
                url = "/pages/manageLecture.jsp";
            } else if ("edit-name".equals(action)) {
                int lectureId = Integer.parseInt(request.getParameter("lectureId"));
                String lectureName = request.getParameter("lectureName");
                if (SectionLectureDAO.updateLectureName(lectureId, lectureName)) {
                    url = "/lecture-management?action=view&sectionId=" + sectionId;
                } else {
                    request.setAttribute("error", "Failed to update lecture name");
                    url = "/errors/errorAlert.jsp";
                }
            } else if ("edit-video".equals(action)) {
                int lectureId = Integer.parseInt(request.getParameter("lectureId"));
                Part filePart = request.getPart("lectureVideo");
                
                if (filePart != null && filePart.getSize() > 0 && isValidVideo(filePart)) {
                    String lectureVideoUrl = uploadToCloudinary(filePart, "video");
                    if (SectionLectureDAO.updateLectureVideo(lectureId, lectureVideoUrl)) {
                        url = "/lecture-management?action=view&sectionId=" + sectionId;
                    } else {
                        request.setAttribute("error", "Failed to update lecture video");
                        url = "/errors/errorAlert.jsp";
                    }
                } else {
                    request.setAttribute("error", "Invalid or no video file uploaded");
                    url = "/errors/errorAlert.jsp";
                }
            } else if ("add-material".equals(action)) {
                int lectureId = Integer.parseInt(request.getParameter("lectureId"));
                Part filePart = request.getPart("lectureMaterial");
                
                if (filePart != null && filePart.getSize() > 0 && isValidDocument(filePart)) {
                    String lectureMaterialUrl = uploadToCloudinary(filePart, "auto");
                    LectureMaterialDAO dao = new LectureMaterialDAO();
                    if (lectureMaterialUrl != null) {
                        dao.insert(new LectureMaterial(lectureId, lectureMaterialUrl));
                        url = "/lecture-management?action=view&sectionId=" + sectionId;
                    } else {
                        request.setAttribute("error", "Failed to add lecture material");
                        url = "/errors/errorAlert.jsp";
                    }
                } else {
                    request.setAttribute("error", "Invalid or no material file uploaded");
                    url = "/errors/errorAlert.jsp";
                }
            } else if ("delete-material".equals(action)) {
                if (Integer.valueOf(request.getParameter("materialId")) != null) {
                    int materialId = Integer.parseInt(request.getParameter("materialId"));
                    LectureMaterialDAO.deleteMaterial(materialId);
                }                 
                url = "/lecture-management?action=view&sectionId=" + sectionId;
            } else if ("add-lecture".equals(action)) {
                String lectureName = request.getParameter("lectureName");
                Part videoPart = request.getPart("lectureVideo");
                List<Part> materialParts = (List<Part>) request.getParts().stream()
                        .filter(part -> "lectureMaterials".equals(part.getName()))
                        .collect(Collectors.toList());
                
                if (lectureName != null && !lectureName.isEmpty() && videoPart != null && videoPart.getSize() > 0 && isValidVideo(videoPart)) {
                    String lectureVideoUrl = uploadToCloudinary(videoPart, "video");
                    SectionLecture newLecture = new SectionLecture();
                    newLecture.setLectureName(lectureName);
                    newLecture.setLectureURL(lectureVideoUrl);
                    newLecture.setSectionID(sectionId);
                    newLecture.setCreatedDate(LocalDateTime.now());
                    
                    SectionLectureDAO dao = new SectionLectureDAO();
                    int lectureId = dao.insert(newLecture);
                    
                    if (lectureId > 0) {
                        for (Part materialPart : materialParts) {
                            if (materialPart.getSize() > 0 && isValidDocument(materialPart)) {
                                String lectureMaterialUrl = uploadToCloudinary(materialPart, "auto");
                                LectureMaterialDAO materialDao = new LectureMaterialDAO();
                                materialDao.insert(new LectureMaterial(lectureId, lectureMaterialUrl));
                            }
                        }
                        url = "/lecture-management?action=view&sectionId=" + sectionId;
                    } else {
                        request.setAttribute("error", "Failed to add lecture");
                        url = "/errors/errorAlert.jsp";
                    }
                } else {
                    request.setAttribute("error", "Invalid lecture data");
                    url = "/errors/errorAlert.jsp";
                }
            }
            
            request.setAttribute("section", CourseSectionDAO.getSectionById(sectionId));
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
    
    private String uploadToCloudinary(Part filePart, String resourceType) throws IOException {
        try (InputStream fileContent = filePart.getInputStream()) {
            byte[] bytes = IOUtils.toByteArray(fileContent);
            Map uploadResult = cloudinary.uploader().upload(bytes, ObjectUtils.asMap("resource_type", resourceType));
            return (String) uploadResult.get("url");
        }
    }
    
    private boolean isValidVideo(Part filePart) {
        String contentType = filePart.getContentType();
        return contentType.startsWith("video/");
    }
    
    private boolean isValidDocument(Part filePart) {
        String contentType = filePart.getContentType();
        return contentType.equals("application/pdf") || contentType.equals("application/msword") || contentType.equals("application/vnd.openxmlformats-officedocument.wordprocessingml.document") || contentType.equals("application/vnd.ms-powerpoint") || contentType.equals("application/vnd.openxmlformats-officedocument.presentationml.presentation") || contentType.equals("application/vnd.ms-excel") || contentType.equals("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
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
        return "Lecture Management Servlet";
    }
}
