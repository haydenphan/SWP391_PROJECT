<%-- 
    Document   : adminCourseDetail
    Created on : Jun 14, 2024, 3:04:29 PM
    Author     : quanhd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="model.*" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/style1.css">
        <link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
        <title>Admin</title>

        <script>
            function copyLink() {
                var linkBox = document.getElementById("linkBox");
                var copyButton = document.getElementById("copyButton");

                // Create a temporary input element
                var tempInput = document.createElement("input");
                tempInput.value = linkBox.textContent;
                document.body.appendChild(tempInput);
                tempInput.select();
                document.execCommand("copy");
                document.body.removeChild(tempInput);

            }
        </script>
    </head>
    <body>
        <h1>Certificate</h1>
        <div class="link-container">
            <div id="linkBox" class="link-box">
                <c:if test="${not empty certificateURLs}">
                    <ul>
                        <c:forEach var="url" items="${certificateURLs}">
                            <li><a href="${url}" target="_blank">${url}</a></li>
                            </c:forEach>
                    </ul>
                </c:if>

                <c:if test="${empty certificateURLs}">
                    <p>No certificates found for this user.</p>
                </c:if>
            </div>
            <button class="copy-button" onclick="copyLink()">Copy Link</button>
        </div>

    </body>
</html>
