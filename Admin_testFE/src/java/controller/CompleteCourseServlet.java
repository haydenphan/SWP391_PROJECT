package controller;

import DAO.CourseCompletionDAO;
import DAO.CourseDAO;
import DAO.JDBC;
import model.Course;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "CompleteCourseServlet", urlPatterns = {"/completeCourse"})
public class CompleteCourseServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public CompleteCourseServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Logger logger = Logger.getLogger(CompleteCourseServlet.class.getName());
        int userId = 0;
        int courseId = 0;

        try {
            userId = Integer.parseInt(request.getParameter("userId"));
            courseId = Integer.parseInt(request.getParameter("courseId"));
            logger.log(Level.INFO, "Received request: userId={0}, courseId={1}", new Object[]{userId, courseId});
        } catch (NumberFormatException e) {
            logger.log(Level.SEVERE, "Invalid UserID or CourseID format", e);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid UserID or CourseID format");
            return;
        }

        Connection connection = null;
        try {
            connection = JDBC.getConnectionWithSqlJdbc();
            logger.log(Level.INFO, "Database connection established");

            CourseCompletionDAO completionDAO = new CourseCompletionDAO(connection);
            CourseDAO courseDAO = new CourseDAO();

            // Retrieve course information
            Course course = courseDAO.getCourseByID(courseId);
            if (course == null) {
                logger.log(Level.SEVERE, "Course not found for courseId: {0}", courseId);
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Course not found");
                return;
            }
            logger.log(Level.INFO, "Course retrieved: {0}", course.getCourseName());

            String learnerName = completionDAO.getLearnerName(userId);
            if (learnerName == null) {
                logger.log(Level.SEVERE, "Learner not found for userId: {0}", userId);
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Learner not found");
                return;
            }
            logger.log(Level.INFO, "Learner retrieved: {0}", learnerName);

            String instructorName = completionDAO.getInstructorName(course.getCreatedBy());
            if (instructorName == null) {
                logger.log(Level.SEVERE, "Instructor not found for instructorId: {0}", course.getCreatedBy());
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Instructor not found");
                return;
            }
            logger.log(Level.INFO, "Instructor retrieved: {0}", instructorName);

            // Complete the course
            completionDAO.completeCourse(userId, course);
            logger.log(Level.INFO, "Course completion recorded");

            // Generate the certificate PDF
            generateCertificate(response, learnerName, course.getCourseName(), instructorName);
            logger.log(Level.INFO, "Certificate generated successfully");

        } catch (SQLException | ClassNotFoundException e) {
            logger.log(Level.SEVERE, "Database error", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while completing the course.");
        } catch (Exception ex) {
            logger.log(Level.SEVERE, "An error occurred", ex);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred: " + ex.getMessage());
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                    logger.log(Level.INFO, "Database connection closed");
                } catch (SQLException e) {
                    logger.log(Level.SEVERE, "Error closing the database connection", e);
                }
            }
        }
    }

    private void generateCertificate(HttpServletResponse response, String learnerName, String courseName, String instructorName) throws DocumentException, IOException {
        Logger logger = Logger.getLogger(CompleteCourseServlet.class.getName());
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline; filename=\"certificate.pdf\"");

        String systemAdminName = "Eduman";

        Document document = new Document(PageSize.A4);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PdfWriter writer = PdfWriter.getInstance(document, baos);

        document.open();

        try {
            String backgroundPath = getServletContext().getRealPath("img/certificate/Certificate_Background.png");
            logger.log(Level.INFO, "Background image path: {0}", backgroundPath);
            Image background = Image.getInstance(backgroundPath);
            background.setAbsolutePosition(0, 0);
            background.scaleAbsolute(PageSize.A4);
            document.add(background);
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error loading certificate background image", e);
            throw new DocumentException("Error loading certificate background image");
        }

        Font titleFont = new Font(Font.FontFamily.TIMES_ROMAN, 36, Font.BOLD, BaseColor.DARK_GRAY);
        Paragraph title = new Paragraph("Certificate of Completion", titleFont);
        title.setAlignment(Element.ALIGN_CENTER);
        title.setSpacingBefore(150);
        document.add(title);

        Font nameFont = new Font(Font.FontFamily.TIMES_ROMAN, 20, Font.BOLD, BaseColor.BLUE);
        Paragraph recipient = new Paragraph("This Certificate is Presented To", nameFont);
        recipient.setAlignment(Element.ALIGN_CENTER);
        recipient.setSpacingBefore(30);
        document.add(recipient);

        try {
            String fontPath = getServletContext().getRealPath("fonts/DancingScript-Regular.ttf");
            logger.log(Level.INFO, "Font path: {0}", fontPath);
            BaseFont dancingScript = BaseFont.createFont(fontPath, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            Font studentNameFont = new Font(dancingScript, 30, Font.BOLD, BaseColor.BLACK);
            Paragraph student = new Paragraph(learnerName, studentNameFont);
            student.setAlignment(Element.ALIGN_CENTER);
            student.setSpacingBefore(15);
            document.add(student);
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error loading certificate font", e);
            throw new DocumentException("Error loading certificate font");
        }

        Font courseFont = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.NORMAL, BaseColor.BLACK);
        Paragraph courseDetails = new Paragraph("For successfully completing the course", courseFont);
        courseDetails.setAlignment(Element.ALIGN_CENTER);
        courseDetails.setSpacingBefore(30);
        document.add(courseDetails);

        Font courseNameFont = new Font(Font.FontFamily.TIMES_ROMAN, 24, Font.BOLD, BaseColor.DARK_GRAY);
        Paragraph courseNameParagraph = new Paragraph(courseName, courseNameFont);
        courseNameParagraph.setAlignment(Element.ALIGN_CENTER);
        courseNameParagraph.setSpacingBefore(10);
        document.add(courseNameParagraph);

        Font signatureFont = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.ITALIC, BaseColor.BLUE);
        PdfPTable table = new PdfPTable(2);
        table.setWidthPercentage(80);
        table.setHorizontalAlignment(Element.ALIGN_CENTER);
        table.setSpacingBefore(70);

        PdfPCell instructorCell = new PdfPCell();
        instructorCell.setBorder(Rectangle.NO_BORDER);
        instructorCell.setHorizontalAlignment(Element.ALIGN_CENTER);

        Paragraph instructorSign = new Paragraph(instructorName, signatureFont);
        instructorSign.setAlignment(Element.ALIGN_CENTER);
        instructorCell.addElement(instructorSign);

        Paragraph instructorTitle = new Paragraph("INSTRUCTOR", new Font(Font.FontFamily.HELVETICA, 10, Font.NORMAL, BaseColor.RED));
        instructorTitle.setAlignment(Element.ALIGN_CENTER);
        instructorCell.addElement(instructorTitle);

        PdfPCell adminCell = new PdfPCell();
        adminCell.setBorder(Rectangle.NO_BORDER);
        adminCell.setHorizontalAlignment(Element.ALIGN_CENTER);

        Paragraph adminSign = new Paragraph(systemAdminName, signatureFont);
        adminSign.setAlignment(Element.ALIGN_CENTER);
        adminCell.addElement(adminSign);

        Paragraph adminTitle = new Paragraph("SYSTEM ADMIN", new Font(Font.FontFamily.HELVETICA, 10, Font.NORMAL, BaseColor.RED));
        adminTitle.setAlignment(Element.ALIGN_CENTER);
        adminCell.addElement(adminTitle);

        table.addCell(instructorCell);
        table.addCell(adminCell);

        document.add(table);

        try {
            String sealPath = getServletContext().getRealPath("img/certificate/Seal.png");
            logger.log(Level.INFO, "Seal image path: {0}", sealPath);
            Image seal = Image.getInstance(sealPath);
            seal.setAbsolutePosition(420, 620);
            seal.scalePercent(14);
            document.add(seal);
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error loading seal image", e);
            throw new DocumentException("Error loading seal image");
        }

        document.close();

        OutputStream os = response.getOutputStream();
        baos.writeTo(os);
        os.flush();
        os.close();
    }
}
