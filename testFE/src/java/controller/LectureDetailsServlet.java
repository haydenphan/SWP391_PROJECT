package controller;

import DAO.SectionLectureDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.SectionLecture;

@WebServlet(name = "LectureDetailsServlet", urlPatterns = {"/lecture-details"})
public class LectureDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int lectureID = Integer.parseInt(request.getParameter("lectureID"));
        SectionLecture lecture = SectionLectureDAO.getLectureById(lectureID);
        request.setAttribute("sectionID", lecture.getSectionID());
        request.setAttribute("lecture", lecture);
        RequestDispatcher dis = request.getRequestDispatcher("/pages/lectureDetails.jsp");
        dis.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
