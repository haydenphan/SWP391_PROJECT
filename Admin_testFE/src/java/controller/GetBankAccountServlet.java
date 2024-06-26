package controller;

import DAO.BankAccountDAO;
import DAO.JDBC;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;
import model.BankAccount;
import org.cloudinary.json.JSONObject;

@WebServlet(name = "GetBankAccountServlet", urlPatterns = {"/getBankAccount"})
public class GetBankAccountServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/dang-nhap");
            return;
        }

        try (Connection connection = JDBC.getConnectionWithSqlJdbc()) {
            BankAccountDAO bankAccountDAO = new BankAccountDAO(connection);
            BankAccount bankAccount = bankAccountDAO.getBankAccountByUserId(user.getUserID());

            JSONObject json = new JSONObject();
            if (bankAccount != null) {
                json.put("accountNumber", bankAccount.getAccountNumber());
                json.put("bankName", bankAccount.getBankName());
            }
            response.setContentType("application/json");
            response.getWriter().write(json.toString());
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(GetBankAccountServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "GetBankAccount Servlet";
    }
}
