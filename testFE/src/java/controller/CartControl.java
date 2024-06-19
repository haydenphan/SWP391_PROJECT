package controller;

import DAO.CourseDAO;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Course;
import model.ProductCart;

@WebServlet(name = "CartControl", urlPatterns = {"/Cart/*"})
public class CartControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String actionString = request.getPathInfo();
        if (actionString == null || actionString.equals("/")) {
            showCart(request, response);
        } else if (actionString.equals("/add-to-cart")) {
            addToCart(request, response);
        } else if (actionString.equals("/remove-from-cart")) {
            removeFromCart(request, response);
        } else if (actionString.equals("/cancelcart")) {
            cancelCart(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private void showCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        HashMap<Integer, ProductCart> cart = (HashMap<Integer, ProductCart>) session.getAttribute("cart");

        if (cart == null) {
            cart = new HashMap<>();
            session.setAttribute("cart", cart);
        }

        double total = calculateTotal(cart);
        request.setAttribute("cart", cart);
        request.setAttribute("total", total);
        session.setAttribute("total", total);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/pages/cartOrder.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/dang-nhap");
            return;
        }

        int CourseID = Integer.parseInt(request.getParameter("CourseID"));
        Course course = CourseDAO.getCoursesByIDForCart(CourseID);

        ProductCart productCart;
        HashMap<Integer, ProductCart> cart = (HashMap<Integer, ProductCart>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
        }

        if (cart.containsKey(CourseID)) {
            productCart = cart.get(CourseID);
            //productCart.incrementQuantity();
        } else {
            productCart = new ProductCart(course, 1);
            cart.put(CourseID, productCart);
        }

        session.setAttribute("cart", cart);
        response.sendRedirect(request.getContextPath() + "/Cart/");
    }

    private void removeFromCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int CourseID = Integer.parseInt(request.getParameter("CourseID"));
        HashMap<Integer, ProductCart> cart = (HashMap<Integer, ProductCart>) session.getAttribute("cart");

        if (cart != null && cart.containsKey(CourseID)) {
            cart.remove(CourseID);
        }

        session.setAttribute("cart", cart);
        double updatedTotal = calculateTotal(cart);
        response.getWriter().write(String.valueOf(updatedTotal));
    }

    private void cancelCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("cart");
        response.getWriter().write("Cart cleared");
    }

    private double calculateTotal(HashMap<Integer, ProductCart> cart) {
        double total = 0;
        for (ProductCart item : cart.values()) {
            total += item.getCourse().getPrice();
        }
        return total;
    }

    @Override
    public String getServletInfo() {
        return "Cart Control Servlet";
    }
}
