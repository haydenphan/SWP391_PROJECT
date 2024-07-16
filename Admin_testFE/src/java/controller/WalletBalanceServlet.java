package controller;

import DAO.WalletDAO;
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
import model.Wallet;
import org.cloudinary.json.JSONObject;

@WebServlet(name = "WalletBalanceServlet", urlPatterns = {"/walletBalance"})
public class WalletBalanceServlet extends HttpServlet {

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
            WalletDAO walletDAO = new WalletDAO(connection);
            Wallet wallet = walletDAO.getWalletByUserId(user.getUserID());
            System.out.println(wallet.getBalance());

            JSONObject json = new JSONObject();
            if (wallet != null) {
                json.put("balance", wallet.getBalance());
            }
            response.setContentType("application/json");
            response.getWriter().write(json.toString());
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(WalletBalanceServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "WalletBalance Servlet";
    }
}