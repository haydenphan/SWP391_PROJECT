/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.CourseEnrollmentDAO;
import DAO.QuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Question;
import model.User;

/**
 *
 * @author tuan6
 */
@WebServlet(name = "AddQuizServlet", urlPatterns = {"/add-quiz-servlet"})
public class AddQuizServlet extends HttpServlet {

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CourseEnrollmentDAO ceDAO = new CourseEnrollmentDAO();

        User user = (User) request.getSession().getAttribute("user");

        request.setAttribute("courseId", request.getParameter("courseId"));
        request.getRequestDispatcher("/pages/createquestion.jsp").forward(request, response);

    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    QuestionDAO qDAO = new QuestionDAO();
    
    // Thu thập các tham số từ request
    String answerA = request.getParameter("answerA");
    String answerB = request.getParameter("answerB");
    String answerC = request.getParameter("answerC");
    String answerD = request.getParameter("answerD");
    String correctAnswer = request.getParameter("correctAnswer");
    int courseId = Integer.parseInt(request.getParameter("courseId"));
    String questionDetail = request.getParameter("question");

    // Tạo danh sách các đối tượng Question
    List<Question> questions = new ArrayList<>();
    
    Question ques = new Question();
    ques.setAnswerA(answerA);
    ques.setAnswerB(answerB);
    ques.setAnswerC(answerC);
    ques.setAnswerD(answerD);
    ques.setCorrectAnswer(correctAnswer);
    ques.setCourseID(courseId);
    ques.setQuestionDetail(questionDetail);
    
    // Thêm đối tượng vào danh sách
    questions.add(ques);

    // Gọi phương thức insertMany
    int[] result = qDAO.insertMany(questions);
    
    // Xử lý kết quả và hiển thị thông báo
    if (result != null && result.length > 0 && result[0] > 0) {
        String mess = "Question inserted successfully!";
        request.setAttribute("message", mess);
    } else {
        String mess = "Question cannot be inserted";
        request.setAttribute("message", mess);
    }
    
    // Chuyển tiếp đến trang createquestion.jsp
    request.getRequestDispatcher("/pages/createquestion.jsp").forward(request, response);
}


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
