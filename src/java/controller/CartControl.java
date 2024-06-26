package controller;

import DAO.CartDAO;
import DAO.CourseDAO;
import DAO.JDBC;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.CartDetails;
import model.Course;
import model.User;

@WebServlet(name = "CartControl", urlPatterns = {"/Cart/*"})
public class CartControl extends HttpServlet {

    private CartDAO cartDAO;
    private static final Logger LOGGER = Logger.getLogger(CartControl.class.getName());

    @Override
    public void init() throws ServletException {
        Connection connection;
        try {
            connection = JDBC.getConnectionWithSqlJdbc();
            cartDAO = new CartDAO(connection);
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "Database connection error", ex);
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String action = request.getPathInfo();
            LOGGER.log(Level.INFO, "Action: {0}", action);
            if (action == null || action.equals("/")) {
                showCart(request, response);
            } else if (action.equals("/add-to-cart")) {
                addToCart(request, response);
            } else if (action.equals("/remove-from-cart")) {
                removeFromCart(request, response);
            } else if (action.equals("/cancelcart")) {
                cancelCart(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error in doGet", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An internal error occurred");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void showCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/dang-nhap");
            return;
        }

        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            try {
                cart = cartDAO.getCartByUserID(user.getUserID());
                if (cart != null) {
                    List<CartDetails> cartDetailsList = cartDAO.getCartDetailsByCartID(cart.getCartID());
                    cart.setCartDetails(cartDetailsList);
                } else {
                    cart = new Cart();
                    cart.setUser(user);
                    session.setAttribute("cart", cart);
                }
            } catch (SQLException e) {
                LOGGER.log(Level.SEVERE, "Error retrieving cart from database", e);
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An internal error occurred");
                return;
            }
        }

        List<CartDetails> cartDetailsList = cart.getCartDetails();
        double total = calculateTotal(cartDetailsList);

        // Set session attributes
        session.setAttribute("cart", cart);
        session.setAttribute("cartDetails", cartDetailsList);
        session.setAttribute("total", total);

        request.setAttribute("cart", cart);
        request.setAttribute("cartDetails", cartDetailsList);
        request.setAttribute("total", total);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/cartOrder.jsp");
        dispatcher.forward(request, response);
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        System.out.println(user.toString());
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/dang-nhap");
            return;
        }

        try {
            String courseIDParam = request.getParameter("CourseID");
            if (courseIDParam == null || courseIDParam.isEmpty()) {
                LOGGER.log(Level.SEVERE, "CourseID parameter is missing");
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "CourseID parameter is missing");
                return;
            }

            int courseID = Integer.parseInt(courseIDParam);
            LOGGER.log(Level.INFO, "Fetching course with ID: {0}", courseID);
            Course course = CourseDAO.getCoursesByIDForCart(courseID);
            if (course == null) {
                LOGGER.log(Level.SEVERE, "Course not found for CourseID: {0}", courseID);
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Course not found");
                return;
            }

            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                cart.setUser(user);
                session.setAttribute("cart", cart);
            }

            List<CartDetails> cartDetailsList = cart.getCartDetails();
            if (cartDetailsList == null) {
                cartDetailsList = new ArrayList<>();
                cart.setCartDetails(cartDetailsList);
            }

            boolean found = false;
            for (CartDetails item : cartDetailsList) {
                if (item.getCourse().getCourseID() == courseID) {
                    found = true;
                    break;
                }
            }

            if (!found) {
                CartDetails cartDetails = new CartDetails(cart, course, course.getPrice());
                cartDetailsList.add(cartDetails);
            }

            cart.setTotalAmount(calculateTotal(cartDetailsList));

            if (cart.getCartID() == 0) {
                LOGGER.log(Level.INFO, "Inserting new cart into database");
                System.out.println(cart.toString());
                cartDAO.insertCart(cart, cartDetailsList);
            } else {
                LOGGER.log(Level.INFO, "Updating existing cart in database");
                cartDAO.updateCartDetails(cart, cartDetailsList);
            }

            session.setAttribute("cart", cart);
            response.sendRedirect(request.getContextPath() + "/Cart/");
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid CourseID format", e);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid CourseID format");
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL Error in addToCart", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An internal error occurred");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Unexpected error in addToCart", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An internal error occurred");
        }
    }

    private void removeFromCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/dang-nhap");
            return;
        }

        try {
            String courseIDParam = request.getParameter("CourseID");
            if (courseIDParam == null || courseIDParam.isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "CourseID parameter is missing");
                return;
            }

            int courseID = Integer.parseInt(courseIDParam);
            Cart cart = (Cart) session.getAttribute("cart");

            if (cart != null) {
                List<CartDetails> cartDetailsList = cart.getCartDetails();
                if (cartDetailsList != null) {
                    cartDetailsList.removeIf(item -> item.getCourse().getCourseID() == courseID);
                    cart.setTotalAmount(calculateTotal(cartDetailsList));

                    if (!cartDetailsList.isEmpty()) {
                        cartDAO.updateCartDetails(cart, cartDetailsList);
                    } else {
                        cartDAO.deleteCart(cart.getCartID());
                        cart.setCartID(0);
                    }

                    session.setAttribute("cart", cart);
                }
            }

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"success\": true, \"totalAmount\": " + cart.getTotalAmount() + ", \"itemCount\": " + cart.getCartDetails().size() + "}");
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid CourseID format", e);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid CourseID format");
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "SQL Error in removeFromCart", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An internal error occurred");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Unexpected error in removeFromCart", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An internal error occurred");
        }
    }

    private void cancelCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/dang-nhap");
            return;
        }

        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null && cart.getCartID() != 0) {
            try {
                cartDAO.deleteCart(cart.getCartID());
            } catch (SQLException e) {
                LOGGER.log(Level.SEVERE, "SQL Error in cancelCart", e);
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An internal error occurred");
                return;
            }
        }

        session.removeAttribute("cart");
        response.sendRedirect(request.getContextPath() + "/Cart/");
    }

    private double calculateTotal(List<CartDetails> cartDetails) {
        double total = 0;
        if (cartDetails != null) {
            for (CartDetails item : cartDetails) {
                total += item.getPrice();
            }
        }
        return total;
    }

    @Override
    public String getServletInfo() {
        return "Cart Control Servlet";
    }
}
