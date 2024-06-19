package control;

import DAO.UserDAO;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.io.IOException;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

@WebServlet(name = "ForgotPasswordControl", urlPatterns = {"/forgotPassword"})
public class ForgotPasswordControl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        System.out.println(email);
        RequestDispatcher dispatcher = null;
        int otpvalue = 0;
        HttpSession mySession = request.getSession();
        UserDAO userDAO = new UserDAO();
        User user = null;
        try {
            user = userDAO.retExistedEmailAcc(email);
            System.out.println(user.toString());
        } catch (Exception ex) {
            Logger.getLogger(ForgotPasswordControl.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        mySession.setAttribute("user", user);

        if (email != null && !email.trim().isEmpty() && user != null) {
            // sending otp
            Random rand = new Random();
            otpvalue = rand.nextInt(1255650);

            String to = email; // recipient email
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");

            Session session = Session.getInstance(props, new jakarta.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("khanhnhiphan.amy@gmail.com", "iyly iecp genq qkro");
                }
            });

            try {
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress("your-email@gmail.com"));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject("OTP for Password Reset");
                message.setText("Your OTP is: " + otpvalue);
                Transport.send(message);
                System.out.println("Message sent successfully");
            } catch (MessagingException e) {
                e.printStackTrace();
                request.setAttribute("error", "Failed to send OTP. Please try again.");
                dispatcher = request.getRequestDispatcher("pages/forgot-password.jsp");
                dispatcher.forward(request, response);
                return;
            }

            dispatcher = request.getRequestDispatcher("pages/enterOtpForPW.jsp");
            request.setAttribute("message", "OTP has been sent to your email address");
            mySession.setAttribute("otp", otpvalue);
            mySession.setAttribute("email", email);
            dispatcher.forward(request, response);
            System.out.println(mySession.getAttribute("user").toString());
        } else {
            request.setAttribute("error", "Please enter a valid email address");
            dispatcher = request.getRequestDispatcher("pages/forgot-password.jsp");
            dispatcher.forward(request, response);
        }
    }
}
