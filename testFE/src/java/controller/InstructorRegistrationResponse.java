package controller;

import DAO.UserDAO;
import DAO.InstructorApprovalsDAO;
import model.User;
import model.InstructorApprovals;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "InstructorRegistrationResponse", urlPatterns = {"/instructor-registration-response"})
public class InstructorRegistrationResponse extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            if (action.equals("viewDetails")) {
                handleViewDetails(request, response);
            } else if (action.equals("respond")) {
                handleRespond(request, response);
            }
        } else {
            processRequest(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void handleViewDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userID = request.getParameter("instructorID");
        UserDAO userDao = new UserDAO();
        User user = userDao.getUserByID(Integer.parseInt(userID));
        request.setAttribute("instructor", user);
        request.getRequestDispatcher("/admin/viewInstructorProfile.jsp").forward(request, response);
    }

    private void handleRespond(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userID = request.getParameter("userID");
        String decision = request.getParameter("decision");
        InstructorApprovalsDAO approvalsDao = new InstructorApprovalsDAO();
        int approvalID = InstructorApprovalsDAO.getApprovalIDByUserID(Integer.parseInt(userID));
        InstructorApprovals approval = approvalsDao.select(approvalID);

        if (approval != null) {
            if ("approve".equals(decision)) {
                approval.setIsApproved(true);
                approval.setApprovalDate(new java.util.Date());
            } else if ("reject".equals(decision)) {
                approval.setIsApproved(false);
                approval.setApprovalDate(new java.util.Date());
            }
            approvalsDao.update(approval);
        }

        response.sendRedirect("admin/adminHome.jsp");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InstructorRegistrationResponse</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InstructorRegistrationResponse at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
