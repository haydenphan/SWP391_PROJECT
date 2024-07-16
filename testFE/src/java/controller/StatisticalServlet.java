package controller;

import DAO.CourseEnrollmentDAO;
import DAO.TransactionDAO;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "StatisticalServlet", urlPatterns = {"/statistical"})
public class StatisticalServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet StatisticalServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StatisticalServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        String yearStr = request.getParameter("year");
        String type = request.getParameter("type");

        int year;
        try {
            year = Integer.parseInt(yearStr);
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\": \"Invalid year format\"}");
            return;
        }

        if ("revenue".equalsIgnoreCase(type)) {
            handleRevenueRequest(response, year);
        } else if ("enrollment".equalsIgnoreCase(type)) {
            handleEnrollmentRequest(response, year);
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\": \"Invalid type\"}");
        }
    }

    private void handleRevenueRequest(HttpServletResponse response, int year) throws IOException {
        TransactionDAO transactionDAO = new TransactionDAO();
        List<Double> monthlyRevenue = transactionDAO.getMonthlyRevenue(year);

        if (monthlyRevenue == null || monthlyRevenue.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_NO_CONTENT);
            response.getWriter().write("{\"error\": \"No data found\"}");
            return;
        }

        Gson gson = new Gson();
        String json = gson.toJson(monthlyRevenue);

        try (PrintWriter out = response.getWriter()) {
            out.print(json);
        }
    }

    private void handleEnrollmentRequest(HttpServletResponse response, int year) throws IOException {
        CourseEnrollmentDAO enrollmentDAO = new CourseEnrollmentDAO();
        List<Integer> monthlyEnrollments = enrollmentDAO.getMonthlyCourseEnrolled(year);

        if (monthlyEnrollments == null || monthlyEnrollments.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_NO_CONTENT);
            response.getWriter().write("{\"error\": \"No data found\"}");
            return;
        }

        Gson gson = new Gson();
        String json = gson.toJson(monthlyEnrollments);

        try (PrintWriter out = response.getWriter()) {
            out.print(json);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
