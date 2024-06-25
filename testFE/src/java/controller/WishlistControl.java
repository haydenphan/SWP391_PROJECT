package controller;

import DAO.CourseDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Course;
import model.ProductCart;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

@WebServlet(name = "WishlistControl", urlPatterns = {"/Wishlist/*"})
public class WishlistControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CartControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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

    private void showWishlist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        HashMap<Integer, ProductCart> wishlist = (HashMap<Integer, ProductCart>) session.getAttribute("wishlist");

        if (wishlist == null) {
            wishlist = new HashMap<>();
            session.setAttribute("wishlist", wishlist);
        }

        request.setAttribute("wishlist", wishlist); // Change "cart" to "wishlist"
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/wishlist.jsp");
        requestDispatcher.forward(request, response);
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

    private void addToWishlist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            // User not logged in, redirect to login page
            response.sendRedirect(request.getContextPath() + "/dang-nhap");
            return;
        }

        int courseID = Integer.parseInt(request.getParameter("CourseID"));
        Course course = CourseDAO.getCoursesByIDForCart(courseID);

        ProductCart productCart;
        HashMap<Integer, ProductCart> wishlist = (HashMap<Integer, ProductCart>) session.getAttribute("wishlist");
        if (wishlist == null) {
            wishlist = new HashMap<>();
        }
        productCart = new ProductCart(course, 1);
        wishlist.put(courseID, productCart);
        session.setAttribute("wishlist", wishlist);
        response.sendRedirect(request.getContextPath() + "/Wishlist/");
    }

    private void removeFromWishlist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int CourseID = Integer.parseInt(request.getParameter("CourseID"));
        HashMap<Integer, ProductCart> wishlist = (HashMap<Integer, ProductCart>) session.getAttribute("wishlist");

        if (wishlist != null && wishlist.containsKey(CourseID)) {
            wishlist.remove(CourseID);
        }

        session.setAttribute("wishlist", wishlist);
        response.setContentType("text/plain");
        response.getWriter().write("Success");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}