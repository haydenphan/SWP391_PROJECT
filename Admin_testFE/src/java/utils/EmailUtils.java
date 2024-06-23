//package utils;
//
//import com.sun.jdi.connect.Transport;
//import jakarta.websocket.Session;
//import java.net.Authenticator;
//import java.net.PasswordAuthentication;
//import java.util.Properties;
//import jakarta.mail.*;
//import jakarta.mail.internet.*;
//
//public class EmailUtils {
//    public static void sendEmail(String to, String subject, String content) throws MessagingException {
//        final String username = "your_email@gmail.com";
//        final String password = "your_password";
//
//        Properties props = new Properties();
//        props.put("mail.smtp.auth", "true");
//        props.put("mail.smtp.starttls.enable", "true");
//        props.put("mail.smtp.host", "smtp.gmail.com");
//        props.put("mail.smtp.port", "587");
//
//        Session session = Session.getInstance(props, new Authenticator() {
//            protected PasswordAuthentication getPasswordAuthentication() {
//                return new PasswordAuthentication(username, password);
//            }
//        });
//
//        Message message = new MimeMessage((MimeMessage) session);
//        message.setFrom(new InternetAddress("your_email@gmail.com"));
//        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
//        message.setSubject(subject);
//        message.setText(content);
//
//        Transport.send(message);
//    }
//}
