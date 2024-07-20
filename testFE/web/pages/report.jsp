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
        User user = (User) session.getAttribute("user");
    %>

    <head>
        <%-- Include the head content --%>
        <%@ include file="../template/head.jsp" %>
    </head>
    <body>
        <div class="container mt-5">
            <h2 class="text-center mb-4">Send Report</h2>
            <form id="reportForm" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="title">Title:</label>
                    <input type="text" class="form-control" id="title" name="title" required>
                </div>
                <div class="form-group">
                    <label for="report">Message:</label>
                    <textarea class="form-control" id="report" name="content" rows="5" required></textarea>
                </div>
                <c:if test="${user.role != null}">
                    <div class="text-center mt-3">
                        <button class="btn btn-primary" type="button" onclick="sendReport(${user.role})">Send Report</button>
                    </div>
                </c:if>
            </form>
        </div>
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
        <script>
                            function sendReport(userRole) {
                                var title = $("#title").val();
                                var content = $("#report").val();

                                $.ajax({
                                    url: "${pageContext.request.contextPath}/ReportManage",
                                    method: "POST",
                                    data: {
                                        title: title,
                                        content: content,
                                        action: "createReport"
                                    },
                                    success: function (data) {
                                        alert("Report sent successfully.");
                                        $("#reportForm")[0].reset(); // Reset the form after successful submission
                                        window.location.href = "${pageContext.request.contextPath}/home?role=" + userRole;
                                    },
                                    error: function (xhr, status, error) {
                                        alert("Failed to send the report: " + xhr.responseText);
                                    }
                                });
                            }
        </script>
    </body>
</html>
