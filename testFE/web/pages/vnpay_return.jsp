<%@ page contentType="text/html" pageEncoding="UTF-8"%>

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
        <div class="container">
            <div class="header clearfix">
                <h3 class="text-muted">PAYMENT RESULTS</h3>
            </div>
            <div class="table-responsive">
                <div class="form-group">
                    <label>Payment transaction code:</label>
                    <p><%=request.getAttribute("vnp_TxnRef")%></p>
                </div>    
                <div class="form-group">
                    <label>Amount:</label>
                    <p><%=request.getAttribute("vnp_Amount")%></p>
                </div>  
                <div class="form-group">
                    <label>Transaction description: </label>
                    <p><%= request.getAttribute("productDescription")%></p>
                </div> 
                <div class="form-group">
                    <label>Payment error code:</label>
                    <p><%=request.getAttribute("vnp_ResponseCode")%></p>
                </div> 
                <div class="form-group">
                    <label>Transaction code at CTT VNPAY-QR:</label>
                    <p><%=request.getAttribute("vnp_TransactionNo")%></p>
                </div> 
                <div class="form-group">
                    <label>Payment bank code:</label>
                    <p><%=request.getAttribute("vnp_BankCode")%></p>
                </div> 
                <div class="form-group">
                    <label>Payment time:</label>
                    <p><%=request.getAttribute("vnp_PayDate")%></p>
                </div>
                <div class="form-group">
                    <label>Transaction status:</label>
                    <p>
                        <%= request.getAttribute("transactionStatus")%>
                    </p>
                </div> 
            </div>
            <div class="text-center">
                <% if ((boolean) request.getAttribute("isPaymentSuccessful")) { %>
                <form action="${pageContext.request.contextPath}/paymentHandler" method="post">
                    <input type="hidden" name="isPaymentSuccessful" value="true"/>
                    <button type="submit" class="btn btn-primary">Go to Enrolled Courses</button>
                </form>
                <% } else { %>
                <a href="index.jsp" class="btn btn-danger">Go to Homepage</a>
                <% }%>
            </div>
            <footer class="footer">
                <p>&copy; VNPAY 2020</p>
            </footer>
        </div>  
    </body>
</html>
