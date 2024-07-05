package controller;

import DAO.CourseCompletionDAO;
import DAO.CourseDAO;
import DAO.JDBC;
import model.Course;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

@WebServlet(name = "CompleteCourseServlet", urlPatterns = {"/completeCourse"})
public class CompleteCourseServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public CompleteCourseServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        int courseId = Integer.parseInt(request.getParameter("courseId"));

        try (Connection connection = JDBC.getConnectionWithSqlJdbc()) {
            CourseCompletionDAO completionDAO = new CourseCompletionDAO(connection);
            CourseDAO courseDAO = new CourseDAO();

            // Retrieve course information
            Course course = courseDAO.getCourseByID(courseId);
            String learnerName = completionDAO.getLearnerName(userId);
            String instructorName = completionDAO.getInstructorName(course.getCreatedBy());

            // Complete the course
            completionDAO.completeCourse(userId, course);

            // Generate the certificate PDF
            generateCertificate(response, learnerName, course.getCourseName(), instructorName);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while completing the course.");
        } catch (Exception ex) {
            Logger.getLogger(CompleteCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void generateCertificate(HttpServletResponse response, String learnerName, String courseName, String instructorName) throws DocumentException, IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline; filename=\"certificate.pdf\"");

        String systemAdminName = "Eduman";

        Document document = new Document(PageSize.A4);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PdfWriter writer = PdfWriter.getInstance(document, baos);

        document.open();

        
        String backgroundPath = getServletContext().getRealPath("img/certificate/Certificate_Background.png");
        Image background = Image.getInstance(backgroundPath);
        background.setAbsolutePosition(0, 0);
        background.scaleAbsolute(PageSize.A4);
        document.add(background);

        
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

        
        String fontPath = getServletContext().getRealPath("fonts/DancingScript-Regular.ttf");
        BaseFont dancingScript = BaseFont.createFont(fontPath, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        Font studentNameFont = new Font(dancingScript, 30, Font.BOLD, BaseColor.BLACK);
        Paragraph student = new Paragraph(learnerName, studentNameFont);
        student.setAlignment(Element.ALIGN_CENTER);
        student.setSpacingBefore(15);
        document.add(student);

        
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

        
        Font signatureFont = new Font(dancingScript, 12, Font.ITALIC, BaseColor.BLUE);
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

        
        String sealPath = getServletContext().getRealPath("img/certificate/Seal.png");
        Image seal = Image.getInstance(sealPath);
        seal.setAbsolutePosition(420, 620); 
        seal.scalePercent(14);
        document.add(seal);

        document.close();

        OutputStream os = response.getOutputStream();
        baos.writeTo(os);
        os.flush();
        os.close();
    }
}
