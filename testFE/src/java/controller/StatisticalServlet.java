package controller;

import DAO.CourseEnrollmentDAO;
import DAO.TransactionDAO;
import DAO.UserDAO;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

        switch (type.toLowerCase()) {
            case "revenue":
                handleRevenueRequest(response, year);
                break;
            case "enrollment":
                handleEnrollmentRequest(response, year);
                break;
            case "completion":
                handleCompletionRequest(response, year);
                break;
            case "usercount":
                handleUserCountRequest(response, year);
                break;
            case "income":
                try {
                int instructorId = Integer.parseInt(request.getParameter("instructorId"));
                int courseId = Integer.parseInt(request.getParameter("courseId"));
                handleIncomeRequest(response, year, instructorId, courseId);
            } catch (NumberFormatException e) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"error\": \"Invalid instructorId or courseId format\"}");
            } catch (Exception ex) {
                Logger.getLogger(StatisticalServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            break;

            default:
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"error\": \"Invalid type\"}");
                break;
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

    private void handleCompletionRequest(HttpServletResponse response, int year) throws IOException {
        CourseEnrollmentDAO enrollmentDAO = new CourseEnrollmentDAO();
        List<Integer> monthlyCompletions = enrollmentDAO.getMonthlyCourseCompleted(year);

        if (monthlyCompletions == null || monthlyCompletions.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_NO_CONTENT);
            response.getWriter().write("{\"error\": \"No data found\"}");
            return;
        }

        Gson gson = new Gson();
        String json = gson.toJson(monthlyCompletions);

        try (PrintWriter out = response.getWriter()) {
            out.print(json);
        }
    }

    private void handleUserCountRequest(HttpServletResponse response, int year) throws IOException {
        UserDAO userDAO = new UserDAO();
        List<int[]> monthlyUserCounts = userDAO.getMonthlyUserCount(year);

        if (monthlyUserCounts == null || monthlyUserCounts.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_NO_CONTENT);
            response.getWriter().write("{\"error\": \"No data found\"}");
            return;
        }

        int[] learners = new int[12];
        int[] instructors = new int[12];
        for (int i = 0; i < 12; i++) {
            learners[i] = monthlyUserCounts.get(i)[0];
            instructors[i] = monthlyUserCounts.get(i)[1];
        }

        Gson gson = new Gson();
        String json = gson.toJson(new UserCountResponse(learners, instructors));

        try (PrintWriter out = response.getWriter()) {
            out.print(json);
        }
    }

    private void handleIncomeRequest(HttpServletResponse response, int year, int instructorId, int courseId) throws IOException, Exception {
        TransactionDAO transactionDAO = new TransactionDAO();
        List<Double> monthlyIncome = transactionDAO.getMonthlyIncomeForInstructorAndCourse(instructorId, courseId, year);

        if (monthlyIncome == null || monthlyIncome.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_NO_CONTENT);
            response.getWriter().write("{\"error\": \"No data found\"}");
            return;
        }

        Gson gson = new Gson();
        String json = gson.toJson(monthlyIncome);

        try (PrintWriter out = response.getWriter()) {
            out.print(json);
        }
    }

    private static class UserCountResponse {

        int[] learners;
        int[] instructors;

        UserCountResponse(int[] learners, int[] instructors) {
            this.learners = learners;
            this.instructors = instructors;
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
