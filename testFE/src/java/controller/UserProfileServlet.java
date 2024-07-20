package controller;

import DAO.CertificateDAO;
import DAO.TransactionDAO;
import DAO.CourseEnrollmentDAO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Certificate;
import model.Course;
import model.Transaction;
import model.User;
import utils.LocalDateTimeAdapter;

@WebServlet(name = "UserProfileServlet", urlPatterns = {"/user-profile"})
public class UserProfileServlet extends HttpServlet {

    private TransactionDAO transactionDAO = new TransactionDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            String action = request.getParameter("action");

            if ("getTransactions".equals(action)) {
                try {
                    List<Transaction> transactions = transactionDAO.getTransactionsByUserID(user.getUserID());

                    // Register the custom LocalDateTime adapter
                    Gson gson = new GsonBuilder()
                            .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter())
                            .setPrettyPrinting()
                            .create();

                    String transactionsJson = gson.toJson(transactions);

                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(transactionsJson);
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while fetching transactions.");
                }
            } else {
                // Fetch certificates
                List<Certificate> certificates = CertificateDAO.getCertificatesByUserId(user.getUserID());
                request.setAttribute("certificates", certificates);

                // Fetch courses and mark completion status
                List<Course> courseList = CourseEnrollmentDAO.getCoursesByUserID(user.getUserID());
                Map<Integer, Boolean> courseCompletionMap = new HashMap<>();
                for (Course course : courseList) {
                    System.out.println(course.toString());
                    boolean isCompleted = CourseEnrollmentDAO.hasLearnerCompletedCourse(user.getUserID(), course.getCourseID());
                    courseCompletionMap.put(course.getCourseID(), isCompleted);
                }
                request.setAttribute("courseList", courseList);
                request.setAttribute("courseCompletionMap", courseCompletionMap);

                request.getRequestDispatcher("pages/user-profile.jsp").forward(request, response);
            }
        } else {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User not logged in.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
