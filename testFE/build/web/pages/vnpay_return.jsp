<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="config.VNPayConfig"%>
<%@page import="model.ProductCart"%>
<%@page import="model.Course"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>

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
            // Begin process return from VNPAY
            Map<String, String> fields = new HashMap<>();
            for (Enumeration<String> params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = params.nextElement();
                String fieldValue = request.getParameter(fieldName);
                if (fieldValue != null && fieldValue.length() > 0) {
                    fields.put(fieldName, fieldValue);
                }
            }
            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }

            // Sort the field names
            List<String> fieldNames = new ArrayList<>(fields.keySet());
            Collections.sort(fieldNames);

            // Build the data string to be hashed
            StringBuilder hashData = new StringBuilder();
            for (String fieldName : fieldNames) {
                String fieldValue = fields.get(fieldName);
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    if (hashData.length() > 0) {
                        hashData.append('&');
                    }
                    hashData.append(fieldName).append('=').append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                }
            }

            String signValue = VNPayConfig.hmacSHA512(VNPayConfig.secretKey, hashData.toString());
            // Retrieve product information from session
            HashMap<Integer, ProductCart> cart = (HashMap<Integer, ProductCart>) session.getAttribute("cart");
            StringBuilder productDescription = new StringBuilder();
            if (cart != null && !cart.isEmpty()) {
                for (ProductCart item : cart.values()) {
                    Course course = item.getCourse();
                    productDescription.append(course.getCourseName()).append(" - $").append(course.getPrice()).append("<br>");
                }
            } else {
                productDescription.append("No products found in session.");
            }

            boolean isPaymentSuccessful = false;
            if (signValue.equals(vnp_SecureHash)) {
                if ("00".equals(request.getParameter("vnp_ResponseCode"))) {
                    isPaymentSuccessful = true;
                }
            }
        %>
        <!-- Begin display -->
        <div class="container">
            <div class="header clearfix">
                <h3 class="text-muted">PAYMENT RESULTS</h3>
            </div>
            <div class="table-responsive">
                <div class="form-group">
                    <label>Payment transaction code:</label>
                    <p><%=request.getParameter("vnp_TxnRef")%></p>
                </div>    
                <div class="form-group">
                    <label>Amount:</label>
                    <p><%=request.getParameter("vnp_Amount")%></p>
                </div>  
                <div class="form-group">
                    <label>Transaction description: </label>
                    <p><%= productDescription.toString()%></p>
                </div> 
                <div class="form-group">
                    <label>Payment error code:</label>
                    <p><%=request.getParameter("vnp_ResponseCode")%></p>
                </div> 
                <div class="form-group">
                    <label>Transaction code at CTT VNPAY-QR:</label>
                    <p><%=request.getParameter("vnp_TransactionNo")%></p>
                </div> 
                <div class="form-group">
                    <label>Payment bank code:</label>
                    <p><%=request.getParameter("vnp_BankCode")%></p>
                </div> 
                <div class="form-group">
                    <label>Payment time:</label>
                    <p><%=request.getParameter("vnp_PayDate")%></p>
                </div>
                <div class="form-group">
                    <label>Transaction status:</label>
                    <p>
                        <%= isPaymentSuccessful ? "Completed" : "Failed"%>
                    </p>
                </div> 
            </div>
            <div class="text-center">
                <% if (isPaymentSuccessful) { %>
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
