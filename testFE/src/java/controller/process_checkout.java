package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import model.Cart;
import model.CartDetails;
import model.Course;

/**
 *
 * @author Thunguyet
 */
@WebServlet(name = "process_checkout", urlPatterns = {"/process_checkout"})
public class process_checkout extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet process_checkout</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet process_checkout at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/pages/checkout.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");

        Cart cart = (Cart) session.getAttribute("cart");
        double total = 0;
        if (cart != null && !cart.isEmpty()) {
            for (CartDetails item : cart.getCartDetails()) {
                Course course = item.getCourse();
                double itemTotal = course.getPrice();
                total += itemTotal;
            }
        }

        // Save checkout information in session
        session.setAttribute("firstName", firstName);
        session.setAttribute("lastName", lastName);
        session.setAttribute("email", email);
        session.setAttribute("total", total);

        // Redirect to vnpay_pay.jsp
        response.sendRedirect(request.getContextPath() + "/pages/vnpay_pay.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
