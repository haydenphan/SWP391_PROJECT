package controller;

import DAO.CourseDAO;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Course;
import model.CourseEnrollment;
import model.ProductCart;
import model.User;
import DAO.CourseEnrollmentDAO;

@WebServlet("/paymentHandler")
public class PaymentHandlerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String isPaymentSuccessfulStr = request.getParameter("isPaymentSuccessful");
        boolean isPaymentSuccessful = Boolean.parseBoolean(isPaymentSuccessfulStr);
        System.out.println(isPaymentSuccessful);

        // Retrieve user and cart from session
        User user = (User) request.getSession().getAttribute("user");
        HashMap<Integer, ProductCart> cart = (HashMap<Integer, ProductCart>) request.getSession().getAttribute("cart");

        // Check transaction status
        if (isPaymentSuccessful) {
            // Transaction successful, save enrollment to database
            try {
                CourseEnrollmentDAO enrollmentDAO = new CourseEnrollmentDAO();
                for (ProductCart item : cart.values()) {
                    Course course = item.getCourse();
                    CourseEnrollment enrollment = new CourseEnrollment(
                            user.getUserID(),
                            course.getCourseID(),
                            LocalDateTime.now()
                    );
                    System.out.println(enrollment.toString());
                    CourseDAO.updateTotalEnrolled(course.getCourseID());
                    enrollmentDAO.insertEnrollment(enrollment);
                }
                // Clear the cart after successful enrollment
                request.getSession().removeAttribute("cart");
                response.sendRedirect(request.getContextPath() + "/pages/user-profile.jsp#courses?status=success");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("paymentResult.jsp?status=error");
            }
        } else {
            // Transaction failed
            response.sendRedirect("paymentResult.jsp?status=failed");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
