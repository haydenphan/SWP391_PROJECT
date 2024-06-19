package controller;

import DAO.CourseDAO;
import model.Course;
import model.User;
import model.Cart;
import model.CartDetails;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "WishlistControl", urlPatterns = {"/Wishlist/*"})
public class WishlistControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String actionString = request.getPathInfo();
        if (actionString == null || actionString.equals("/")) {
            showWishlist(request, response);
        } else if (actionString.equals("/add-to-wishlist")) {
            addToWishlist(request, response);
        } else if (actionString.equals("/remove-from-wishlist")) {
            removeFromWishlist(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String actionString = request.getPathInfo();
        if (actionString == null) {
            actionString = "/add-to-wishlist";
        }
        switch (actionString) {
            case "/add-to-wishlist":
                addToWishlist(request, response);
                break;
            case "/remove-from-wishlist":
                removeFromWishlist(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private void showWishlist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart wishlist = (Cart) session.getAttribute("wishlist");

        if (wishlist == null) {
            wishlist = new Cart();
            session.setAttribute("wishlist", wishlist);
        }

        request.setAttribute("wishlist", wishlist);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/wishlist.jsp");
        requestDispatcher.forward(request, response);
    }

    private void addToWishlist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/dang-nhap");
            return;
        }

        int courseID = Integer.parseInt(request.getParameter("CourseID"));
        Course course = CourseDAO.getCoursesByIDForCart(courseID);

        if (course != null) {
            Cart wishlist = (Cart) session.getAttribute("wishlist");
            if (wishlist == null) {
                wishlist = new Cart();
                session.setAttribute("wishlist", wishlist);
            }

            List<CartDetails> cartDetailsList = wishlist.getCartDetails();
            if (cartDetailsList == null) {
                cartDetailsList = new ArrayList<>();
                wishlist.setCartDetails(cartDetailsList);
            }

            boolean found = false;
            for (CartDetails item : cartDetailsList) {
                if (item.getCourse().getCourseID() == courseID) {
                    found = true;
                    break;
                }
            }

            if (!found) {
                CartDetails cartDetails = new CartDetails(wishlist, course, course.getPrice());
                cartDetailsList.add(cartDetails);
            }
        }

        response.sendRedirect(request.getContextPath() + "/Wishlist/");
    }

    private void removeFromWishlist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/dang-nhap");
            return;
        }

        int courseID = Integer.parseInt(request.getParameter("CourseID"));
        Cart wishlist = (Cart) session.getAttribute("wishlist");

        if (wishlist != null) {
            List<CartDetails> cartDetailsList = wishlist.getCartDetails();
            if (cartDetailsList != null) {
                cartDetailsList.removeIf(item -> item.getCourse().getCourseID() == courseID);
            }
        }

        response.setContentType("text/plain");
        response.getWriter().write("Success");
    }

    @Override
    public String getServletInfo() {
        return "WishlistControl Servlet";
    }
}
