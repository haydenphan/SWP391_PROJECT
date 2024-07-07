<%-- 
    Document   : report
    Created on : Jul 5, 2024, 11:36:16 PM
    Author     : quanhd
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>

    <%
    // String userName = (String)request.getAttribute("UserName");
    User user = (User) session.getAttribute("user");
    //int role = (user != null) ? user.getRole() : 0;
    %>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .form-table {
                width: 100%;
                max-width: 600px;
                margin: 0 auto;
                border-collapse: collapse;
            }
            .form-table td {
                padding: 10px;
            }
            .form-table input[type="text"],
            .form-table textarea {
                width: 100%;
                padding: 8px;
                box-sizing: border-box;
            }
            .form-table input[type="file"] {
                padding: 5px;
            }
            .form-table button {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                cursor: pointer;
            }
            .form-table button:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <script src="./dataResponse/sendReport.js"></script>
        <h2 style="text-align:center">Create Report</h2>
        <form action="createQuestion" method="post" enctype="multipart/form-data">
            <table class="form-table">
                <tr>
                    <td>Title:</td>
                    <td><input type="text" id="title" name="title" required></td>
                </tr>
                <tr>
                    <td>Message:</td>
                    <td><textarea id="report" name="message" rows="5" required></textarea></td>
                </tr>
                <c:if test="${user.role != null}">
                    <td colspan="2" style="text-align:center">
                        <button class="btn-sendfeedback" onclick="SendReport()" type="button" >Send Report</button>
                    </td>
                </c:if>
                <c:if test="${user.role == null}">
                    <td> null </td>
                </c:if>
            </table>
        </form>
    </body>
</html>
