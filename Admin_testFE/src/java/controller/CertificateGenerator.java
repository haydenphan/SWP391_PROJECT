package controller;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletResponse;

import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CertificateGenerator {

    public static String generateCertificate(ServletContext context, HttpServletResponse response, String learnerName, String courseName, String instructorName) throws DocumentException, IOException {
        Logger logger = Logger.getLogger(CertificateGenerator.class.getName());
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "inline; filename=\"certificate.pdf\"");

        String systemAdminName = "Eduman";

        Document document = new Document(PageSize.A4);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PdfWriter.getInstance(document, baos);

        document.open();

        try {
            String backgroundPath = context.getRealPath("img/certificate/Certificate_Background.png");
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
            String fontPath = context.getRealPath("fonts/DancingScript-Regular.ttf");
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
            String sealPath = context.getRealPath("img/certificate/Seal.png");
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

        // Save the PDF to the server
        String certificatePath = context.getRealPath("/certificates/" + learnerName + "_" + courseName + ".pdf");
        try (FileOutputStream fos = new FileOutputStream(certificatePath)) {
            baos.writeTo(fos);
        }

        return "/certificates/" + learnerName + "_" + courseName + ".pdf";
    }
}
