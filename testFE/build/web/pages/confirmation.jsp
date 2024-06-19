<%-- 
    Document   : confirmation
    Created on : Jun 17, 2024, 9:42:33 PM
    Author     : Thunguyet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Confirmation</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f8ff;
            font-family: 'Arial', sans-serif;
        }
        .container {
            margin-top: 50px;
            max-width: 600px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .header h1 {
            color: #5C88C4;
        }
        .content {
            text-align: center;
        }
        .content h2 {
            margin-bottom: 20px;
            color: #333;
        }
        .btn-custom {
            background-color: #5C88C4;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 18px;
        }
        .btn-custom:hover {
            background-color: #00aff0;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
            color: #777;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Thank You For Your Order!</h1>
        </div>
        <div class="content">
            <h2>Check your order in Order History</h2>
            <a href="<%= request.getContextPath() %>/pages/home.jsp" class="btn btn-custom">Go to Home</a>
        </div>
        <div class="footer">
            <p>&copy; 2024 Eduman. All rights reserved.</p>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
