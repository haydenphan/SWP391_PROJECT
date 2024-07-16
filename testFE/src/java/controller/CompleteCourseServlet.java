package controller;

import DAO.CertificateDAO;
import DAO.CourseDAO;
import DAO.JDBC;
import DAO.UserDAO;
import config.CloudinaryConfig;
import model.Certificate;
import model.Course;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

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
            CourseDAO courseDAO = new CourseDAO();
            UserDAO userDAO = new UserDAO();

            // Retrieve course information
            Course course = courseDAO.getCourseByID(courseId);
            String learnerName = userDAO.getUserByID(userId).getFirstName() + " " + userDAO.getUserByID(userId).getLastName();
            String instructorName = userDAO.getUserByID(course.getCreatedBy()).getFirstName() + " " + userDAO.getUserByID(course.getCreatedBy()).getLastName();

            // Generate the certificate PDF and upload to Cloudinary
            String certificateUrl = generateCertificate(learnerName, course.getCourseName(), instructorName);

            // Save certificate details to the database
            Certificate certificate = new Certificate();
            certificate.setLearnerID(userId);
            certificate.setInstructorID(course.getCreatedBy());
            certificate.setCourseID(courseId);
            certificate.setCertificateUrl(certificateUrl);

            CertificateDAO certificateDAO = new CertificateDAO();
            certificateDAO.insert(certificate);

            // Set response content type to application/pdf
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "inline; filename=\"certificate.pdf\"");

            // Redirect to the URL of the uploaded certificate
            response.sendRedirect(certificateUrl);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while completing the course.");
        } catch (Exception ex) {
            Logger.getLogger(CompleteCourseServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private String generateCertificate(String learnerName, String courseName, String instructorName) throws DocumentException, IOException {
        String systemAdminName = "Eduman";
        String certificateDir = getServletContext().getRealPath("certificates");
        String certificatePath = certificateDir + "/" + learnerName.replace(" ", "_") + "_" + courseName.replace(" ", "_") + ".pdf";

        // Ensure the directory exists
        File dir = new File(certificateDir);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        Document document = new Document(PageSize.A4);
        PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(certificatePath));

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

        // Upload the generated PDF to Cloudinary
        Cloudinary cloudinary = CloudinaryConfig.getCloudinary();
        Map uploadResult = cloudinary.uploader().upload(new File(certificatePath), ObjectUtils.emptyMap());

        // Return the URL of the uploaded certificate
        return (String) uploadResult.get("url");
    }
}
