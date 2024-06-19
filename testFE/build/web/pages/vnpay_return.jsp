<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Cart"%>
<%@ page import="model.CartDetails"%>
<%@ page import="model.Course"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>PAYMENT RESULT</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet"/>
        <link href="../css/jumbotron-narrow.css" rel="stylesheet">
        <script src="../js/jquery-1.11.3.min.js"></script>
        <style>
            body {
                background-color: #f0f8ff;
                font-family: 'Arial', sans-serif;
                color: #333;
            }
            .container {
                max-width: 800px;
                margin: 50px auto;
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                padding: 20px;
            }
            .header {
                border-bottom: 2px solid #005C78;
                padding-bottom: 10px;
                margin-bottom: 20px;
            }
            .header h3 {
                color: #005C78;
            }
            .form-group label {
                font-weight: bold;
                color: #005C78;
            }
            .footer {
                text-align: center;
                padding: 10px 0;
                border-top: 1px solid #ccc;
                margin-top: 20px;
                color: #777;
            }
        </style>
    </head>
    <body>
        <%
            // Retrieve product information from session
            Cart cart = (Cart) session.getAttribute("cart");
            StringBuilder productDescription = new StringBuilder();
            if (cart != null && !cart.isEmpty()) {
                for (CartDetails item : cart.getCartDetails()) {
                    Course course = item.getCourse();
                    productDescription.append(course.getCourseName()).append(" - $").append(course.getPrice()).append("<br>");
                }
            } else {
                productDescription.append("No products found in session.");
            }

            // Retrieve parameters from the request
            String vnp_TxnRef = request.getParameter("vnp_TxnRef");
            String vnp_Amount = request.getParameter("vnp_Amount");
            String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
            String vnp_TransactionNo = request.getParameter("vnp_TransactionNo");
            String vnp_BankCode = request.getParameter("vnp_BankCode");
            String vnp_PayDate = request.getParameter("vnp_PayDate");
            String vnp_SecureHash = request.getParameter("vnp_SecureHash");

            String status;
            if ("00".equals(vnp_ResponseCode)) {
                status = "Completed";
            } else {
                status = "Failed";
            }
        %>
        <div class="container">
            <div class="header clearfix">
                <h3 class="text-muted">PAYMENT RESULTS</h3>
            </div>
            <div class="table-responsive">
                <div class="form-group">
                    <label>Payment transaction code:</label>
                    <p><%= vnp_TxnRef %></p>
                </div>    
                <div class="form-group">
                    <label>Amount:</label>
                    <p><%= vnp_Amount %></p>
                </div>  
                <div class="form-group">
                    <label>Transaction description: </label>
                    <p><%= productDescription.toString() %></p>
                </div> 
                <div class="form-group">
                    <label>Payment error code:</label>
                    <p><%= vnp_ResponseCode %></p>
                </div> 
                <div class="form-group">
                    <label>Transaction code at CTT VNPAY-QR:</label>
                    <p><%= vnp_TransactionNo %></p>
                </div> 
                <div class="form-group">
                    <label>Payment bank code:</label>
                    <p><%= vnp_BankCode %></p>
                </div> 
                <div class="form-group">
                    <label>Payment time:</label>
                    <p><%= vnp_PayDate %></p>
                </div> 
                <div class="form-group">
                    <label>Transaction status:</label>
                    <p><%= status %></p>
                </div> 
            </div>
            <form action="${pageContext.request.contextPath}/transactionservlet" method="post">
                <input type="hidden" name="vnp_TxnRef" value="<%= vnp_TxnRef %>">
                <input type="hidden" name="vnp_Amount" value="<%= vnp_Amount %>">
                <input type="hidden" name="vnp_ResponseCode" value="<%= vnp_ResponseCode %>">
                <input type="hidden" name="vnp_TransactionNo" value="<%= vnp_TransactionNo %>">
                <input type="hidden" name="vnp_BankCode" value="<%= vnp_BankCode %>">
                <input type="hidden" name="vnp_PayDate" value="<%= vnp_PayDate %>">
                <input type="hidden" name="status" value="<%= status %>">
                <button type="submit" class="btn btn-primary">Confirm and Save</button>
            </form>
            <footer class="footer">
                <p>&copy; VNPAY 2020</p>
            </footer>
        </div>  
    </body>
</html>
