package controller;

import DAO.BankAccountDAO;
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
import model.BankAccount;

@WebServlet(name = "WithdrawServlet", urlPatterns = {"/withdraw"})
public class WithdrawServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/dang-nhap");
            return;
        }

        String amountStr = request.getParameter("amount");
        String accountNumber = request.getParameter("accountNumber");
        String bankName = request.getParameter("bankName");

        if (amountStr == null || amountStr.isEmpty() || accountNumber == null || accountNumber.isEmpty() || bankName == null || bankName.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "All fields are required");
            return;
        }

        try {
            double amount = Double.parseDouble(amountStr);
            try (Connection connection = JDBC.getConnectionWithSqlJdbc()) {
                WalletDAO walletDAO = new WalletDAO(connection);
                Wallet wallet = walletDAO.getWalletByUserId(user.getUserID());

                if (wallet != null) {
                    if (wallet.getBalance() >= amount) {
                        BankAccountDAO bankAccountDAO = new BankAccountDAO(connection);
                        BankAccount bankAccount = new BankAccount();
                        bankAccount.setUserID(user.getUserID());
                        bankAccount.setAccountNumber(accountNumber);
                        bankAccount.setBankName(bankName);
                        bankAccount.setAmount(amount);

                        try {
                            bankAccountDAO.addOrUpdateBankAccount(bankAccount);
                            wallet.setBalance(wallet.getBalance() - amount);
                            walletDAO.updateWallet(wallet);
                        } catch (SQLException e) {
                            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Account number mismatch");
                            return;
                        }

                        String roleParam = user.getRole() == 2 ? "Instructor" : user.getRole() == 3 ? "Admin" : "Unknown";
                        response.sendRedirect(request.getContextPath() + "/pages/withdrawSuccess.jsp?role=" + roleParam);
                    } else {
                        response.getWriter().write("Insufficient balance");
                    }
                } else {
                    response.getWriter().write("Wallet not found");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing withdrawal");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid amount format");
        }
    }

    @Override
    public String getServletInfo() {
        return "Withdrawal Servlet";
    }
}
