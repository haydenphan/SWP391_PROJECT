package controller;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;


import DAO.UserDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import utils.PasswordUtils;

/**
 * Servlet implementation class DoiMatKhau
 */
@WebServlet("/doi-mat-khau")
public class ChangePassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ChangePassword() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String matKhauHienTai = request.getParameter("matKhauHienTai");
        String matKhauMoi = request.getParameter("matKhauMoi");
        String matKhauMoiNhapLai = request.getParameter("matKhauMoiNhapLai");

        String baoLoi = "";
        String url = "/doimatkhau.jsp";

        HttpSession session = request.getSession();
        Object obj = session.getAttribute("user");
        User user = null;
        if (obj != null)
            user = (User) obj;

        if (user == null) {
            baoLoi = "Bạn chưa đăng nhập vào hệ thống!";
        } else {
            UserDAO userDAO = new UserDAO();
            try {
                User dbUser = userDAO.getUserByUsername(user.getUserName());

                if (dbUser == null || !PasswordUtils.verifyPassword(matKhauHienTai, dbUser.getStoredSalt(), dbUser.getPasswordHash())) {
                    baoLoi = "Mật khẩu hiện tại không chính xác!";
                } else {
                    if (!matKhauMoi.equals(matKhauMoiNhapLai)) {
                        baoLoi = "Mật khẩu nhập lại không khớp!";
                    } else {
                        byte[] salt = PasswordUtils.generateSalt();
                        String newHashedPassword = PasswordUtils.hashPassword(matKhauMoi, salt);
                        dbUser.setPasswordHash(newHashedPassword);
                        dbUser.setStoredSalt(salt);

                        if (userDAO.updateUser(dbUser)) {
                            baoLoi = "Mật khẩu đã thay đổi thành công!";
                        } else {
                            baoLoi = "Quá trình thay đổi mật khẩu không thành công!";
                        }
                    }
                }
                url = "/pages/home.jsp";
            } catch (Exception e) {
                Logger.getLogger(ChangePassword.class.getName()).log(Level.SEVERE, null, e);
                baoLoi = "Đã xảy ra lỗi trong quá trình thay đổi mật khẩu!";
            }
        }

        request.setAttribute("baoLoi", baoLoi);
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
