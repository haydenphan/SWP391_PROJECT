package controller;

import DAO.ReportDAO;
import utils.EmailUtils;
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
import model.Comment;
import model.Report;
import model.User;

public class ReportManageServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        ObjectMapper objectMapper = new JsonMapper();
        String objectJSON = "";
        ReportDAO reDao = new ReportDAO();
        int idReport = 0;
        try {
            switch (action) {
                case "search":
                    idReport = Integer.parseInt(request.getParameter("idReport"));
                    objectJSON = objectMapper.writeValueAsString(reDao.read(idReport));
                    break;
                case "edit":
                    idReport = Integer.parseInt(request.getParameter("idReport"));
                    String repContent = request.getParameter("repContent");
                    Comment commentReply = null;
                    if(request.getParameter("user")== null){
                        commentReply = new Comment(true, repContent, StringExtention.GetCurrentDate());
                        reDao.reply(idReport, false);
                    }else{
                        commentReply = new Comment(false, repContent, StringExtention.GetCurrentDate());
                        reDao.reply(idReport, true);
                    }
                    
                    boolean isSuccess = reDao.createComment(commentReply, idReport);
                    if (!isSuccess) {
                        objectJSON = objectMapper.writeValueAsString("fail");
                        break;
                    }
                    
                    break;
                case "getList":
                    // Lấy danh sách feedback của người dùng
                    List<model.Report> reports = reDao.getList();
                    objectJSON = objectMapper.writeValueAsString(reports);
                    
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
                    EmailUtils.sendEmail(title + " (do not rep this mail)", mess, user.getEmail());
                    break;
                case "getComment":
                    idReport = Integer.parseInt(request.getParameter("idReport"));
                    List<Comment> comments = reDao.getComments(idReport);
                    objectJSON = objectMapper.writeValueAsString(comments);
                    
                    break;
            }
        } catch (Exception e) {
            objectJSON = objectMapper.writeValueAsString("fail");
            e.printStackTrace();
        }finally{
            response.getWriter().write(objectJSON);
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
