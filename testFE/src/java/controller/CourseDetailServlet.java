package controller;

import DAO.CourseDAO;
import DAO.CourseEnrollmentDAO;
import DAO.CourseFeedbackDAO;
import DAO.CourseSectionDAO;
import DAO.LectureMaterialDAO;
import DAO.NotificationDAO;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Course;
import model.CourseSection;
import model.Notification;
import model.User;

@WebServlet(name = "CourseDetailServlet", urlPatterns = {"/CourseDetail"})
public class CourseDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CourseDAO courseDAO = new CourseDAO();
        CourseEnrollmentDAO ceDAO = new CourseEnrollmentDAO();
        User user = (User) request.getSession().getAttribute("user");
        String courseID = request.getParameter("id");
        boolean hasEnrolled = user == null ? false : ceDAO.isUserEnrolledInCourse(user.getUserID(), Integer.parseInt(courseID));
        Course course = courseDAO.getCourseByID(Integer.parseInt(courseID));
        course.setNumberOfStarRatingList(courseDAO.getStarRatingsCount(courseID));

        Date lastUpdateDate = Date.from(course.getLastUpdate().atZone(ZoneId.systemDefault()).toInstant());
        Date createdDate = Date.from(course.getCreatedDate().atZone(ZoneId.systemDefault()).toInstant());
        List<CourseSection> sectionList = CourseSectionDAO.getCourseSections(course.getCourseID());
        int instructorID = CourseDAO.getInstructor(course.getCreatedBy()).getUserID();

        List<String> sectionDescriptions = CourseSectionDAO.getSectionDescriptionsByCourseID(course.getCourseID());
        int materialNum = LectureMaterialDAO.countMaterialsByCourseID(course.getCourseID());

        boolean courseCompleted = false;
        boolean certificateGenerated = false;

        if (user != null) {
            try {
                // Check if the learner has passed all quizzes
                boolean hasPassedAllQuizzes = courseDAO.hasPassedAllQuizzesInCourse(user.getUserID(), course.getCourseID());

                if (CourseEnrollmentDAO.isCourseCompleted(user.getUserID(), course.getCourseID()) && hasPassedAllQuizzes) {
                    courseCompleted = true;
                    if (!CourseEnrollmentDAO.isCertificateGenerated(user.getUserID(), course.getCourseID())) {
                        CourseEnrollmentDAO.updateCourseCompletionStatus(user.getUserID(), course.getCourseID());

                        // Send completion notification if not already sent or if it's unread
                        NotificationDAO notiDAO = new NotificationDAO();
                        if (!notiDAO.hasUnreadCompletionNotification(user.getUserID(), "CompletedCourse", course.getCourseID())) {
                            Notification notification = new Notification();
                            notification.setUserId(user.getUserID());
                            notification.setMessage("Congratulations! You have completed the course: " + course.getCourseName());
                            notification.setType("CourseCompletion");
                            notification.setTimeStamp(LocalDateTime.now());
                            notification.setTarget("CompletedCourse");
                            notification.setTargetId(course.getCourseID());
                            notification.setIsRead(false);

                            notiDAO.insertNotification(notification);
                        }
                    } else {
                        certificateGenerated = true;
                    }
                }
                request.setAttribute("hasSubmittedFeedback", CourseFeedbackDAO.hasSubmittedFeedback(course.getCourseID(), user.getUserID()));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        request.setAttribute("materialNum", materialNum);
        request.setAttribute("sectionDescriptions", sectionDescriptions);
        request.setAttribute("course", course);
        request.setAttribute("hasEnrolled", hasEnrolled);
        request.setAttribute("sectionList", sectionList);
        request.setAttribute("instructorID", instructorID);
        request.setAttribute("lastUpdateDate", lastUpdateDate);
        request.setAttribute("createdDate", createdDate);
        request.setAttribute("courseCompleted", courseCompleted);
        request.setAttribute("certificateGenerated", certificateGenerated);
        request.getRequestDispatcher("/pages/courseDetails.jsp").forward(request, response);
    }
}
