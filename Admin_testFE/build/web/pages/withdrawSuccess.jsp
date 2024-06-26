<%-- 
    Document   : withdrawSuccess
    Created on : Jun 26, 2024, 9:03:58 PM
    Author     : Thunguyet
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Withdrawal Success</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background: linear-gradient(to right, #A7E6FF, #FFD0D0);
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
        }
        .center-container {
            text-align: center;
        }
        .btn-custom {
            background-color: #ffffff;
            border: none;
            color: #ff7e5f;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            transition-duration: 0.4s;
            cursor: pointer;
            border-radius: 12px;
        }
        .btn-custom:hover {
            background-color: #ff7e5f;
            color: white;
            border: 2px solid #ffffff;
        }
        .success-icon {
            font-size: 100px;
            color: #ffffff;
        }
    </style>
</head>
<body>
    <div class="center-container">
        <div class="success-icon">
            <i class="fa fa-check-circle"></i>
        </div>
        <h1>Withdrawal Successful!</h1>
        <p>Your transaction has been completed successfully.</p>
        <%
            
            User user = (User) session.getAttribute("user");
            int role = user.getRole();
            String redirectUrl = "";
            if (role == 2) {
                redirectUrl = pageContext.getServletContext().getContextPath() + "/pages/instructor-profile.jsp";
            } else if (role == 3) {
                redirectUrl = pageContext.getServletContext().getContextPath() + "/admin/adminHome.jsp";
            }
        %>
        <a href="<%=redirectUrl%>" class="btn btn-custom mt-3">Back to Home</a>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"></script>
</body>
</html>
