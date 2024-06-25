package controller;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "ValidateOtpEmail", urlPatterns = {"/ValidateOtpEmail"})
public class ValidateOtpEmail extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession mySession = request.getSession();
        String otp = request.getParameter("otp");
        RequestDispatcher dispatcher = null;
        
//        System.out.println(mySession.getAttribute("user").toString());

        int value = Integer.parseInt(otp);
        int otpvalue = (int) mySession.getAttribute("otp");

        if (value == otpvalue) {
            request.setAttribute("email", mySession.getAttribute("email"));
            dispatcher = request.getRequestDispatcher("/dang-ky");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("error", "Invalid OTP");
            dispatcher = request.getRequestDispatcher("pages/EnterOtp.jsp");
            dispatcher.forward(request, response);
        }
    }
}