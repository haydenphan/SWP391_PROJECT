package controller;


import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    
    
}
