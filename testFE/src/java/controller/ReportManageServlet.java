package controller;

import DAO.ReportDAO;
import utils.StringExtention;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Report;
import model.User;

@WebServlet(name = "ReportManageServlet", urlPatterns = {"/ReportManage"})
public class ReportManageServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action") != null ? request.getParameter("action") : "";
        ReportDAO reDao = new ReportDAO();
        String url = "";

        try {
            switch (action) {
                case "reports" -> {
                    List<Report> reports = reDao.getReports();
                    request.setAttribute("reports", reports);
                    url = "admin/manageReport.jsp";
                }
                case "createReport" -> {
                    HttpSession session = request.getSession(false);
                    if (session == null) {
                        response.sendRedirect("home?role=0");
                        return;
                    }

                    User user = (User) session.getAttribute("user");
                    if (user == null) {
                        response.sendRedirect("home?role=0");
                        return;
                    }

                    String title = request.getParameter("title");
                    String content = request.getParameter("content");
                    String time = StringExtention.GetCurrentDate();

                    Report sendReport = new Report(user.getUserID(), time, title, false, content);
                    reDao.create(sendReport);

                    // Send confirmation email
                    String emailContent = content + "\nThank you for your report. We will reply soon.";
                    sendEmail(user.getEmail(), title + " (do not reply to this email)", emailContent);

                    url = "home?role=" + user.getRole(); // Redirect to a success page
                }
                default -> {
                    request.setAttribute("error", "Could not send your report.");
                    url = "errors/errorAlert.jsp";
                }
            }
        } catch (Exception e) {
            Logger.getLogger(ReportManageServlet.class.getName()).log(Level.SEVERE, null, e);
            request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
            url = "error.jsp";
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    private void sendEmail(String to, String subject, String content) {
        String from = "khanhnhiphan.amy@gmail.com"; // Replace with your email
        String password = "iyly iecp genq qkro"; // Replace with your email password

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new jakarta.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setText(content);
            Transport.send(message);
            System.out.println("Confirmation email sent successfully");
        } catch (MessagingException e) {
            Logger.getLogger(ReportManageServlet.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ReportManageServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ReportManageServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Handles report management actions";
    }
}
