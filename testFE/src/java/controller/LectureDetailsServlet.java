package controller;

import DAO.SectionLectureDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
