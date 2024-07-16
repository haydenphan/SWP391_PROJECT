package controller;

import DAO.ReportDAO;
//import utils.EmailUtils;
import utils.StringExtention;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.json.JsonMapper;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Comment;
import model.Report;
import model.User;

public class ReportManageServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        ObjectMapper objectMapper = new JsonMapper();
        ReportDAO reDao = new ReportDAO();
        String url = "";
        try {
            switch (action) {
                case "reports":
                    // Lấy danh sách feedback của người dùng
                    List<model.Report> reports = reDao.Reports();
                    request.setAttribute("reports", reports);
                    url = "admin/manageReport.jsp";
                    break;
                case "createReport":
                    // Tạo mới report
                    User user = (User) request.getSession().getAttribute("user");
                    String title = request.getParameter("title");
                    String content = request.getParameter("content");

                    String time = StringExtention.GetCurrentDate();
                    Comment newComment = new Comment(false, content, time);
                    ReportDAO Rdao = new ReportDAO();
                    model.Report sendReport = new model.Report(user.getUserID(), time, title, true);
                    Rdao.create(sendReport);
                    Rdao.createComment(newComment, 0);
                    String mess = content +"\nThank for your report we will reply soon ";
                    //EmailUtils.sendEmail(title + " (do not rep this mail)", mess, user.getEmail());
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            request.getRequestDispatcher(url).forward(request, response);
        }

    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Report.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Report.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Report.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Report.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
