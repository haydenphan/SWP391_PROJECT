<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.*" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <%@ include file="../template/head.jsp" %>
        <style>
            .container {
                margin: 20px auto;
                padding: 20px;
                background: #f9f9f9;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }
            h1 {
                font-size: 2em;
                margin-bottom: 20px;
                color: #333;
            }
            .avatar {
                display: block;
                margin: 0 auto 20px;
                width: 150px;
                height: 150px;
                border-radius: 50%;
                object-fit: cover;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }
            table th, table td {
                padding: 10px;
                border: 1px solid #ddd;
            }
            table th {
                background-color: #f4f4f4;
                font-weight: bold;
            }
            .btn-group {
                display: flex;
                gap: 10px;
            }
            .btn-group button {
                padding: 10px 20px;
                border: none;
                background-color: #007bff;
                color: #fff;
                cursor: pointer;
                border-radius: 4px;
                transition: background-color 0.3s;
            }
            .btn-group button:hover {
                background-color: #0056b3;
            }
            .btn-group button.reject {
                background-color: #dc3545;
            }
            .btn-group button.reject:hover {
                background-color: #c82333;
            }
            .certificate-list {
                margin-top: 20px;
            }
            .certificate-item {
                margin-bottom: 10px;
                padding: 10px;
                background: #fff;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-shadow: 0 1px 2px rgba(0,0,0,0.05);
            }
            .certificate-item a {
                color: #007bff;
                text-decoration: none;
            }
            .certificate-item a:hover {
                text-decoration: underline;
            }
        </style>
        <script>
            var decisionValue = '';

            function setDecision(value) {
                decisionValue = value;
            }

            function confirmAction(event) {
                var message = decisionValue === "approve" ? "Are you sure you want to approve this instructor?" : "Are you sure you want to reject this instructor?";
                if (!confirm(message)) {
                    event.preventDefault();
                }
            }
        </script>
    </head>
    <body>

        <%
            String instructorIdParam = request.getParameter("instructorID");
            User instructor = null;
            InstructorApprovals approval = null;
            if (instructorIdParam != null) {
                int instructorId = Integer.parseInt(instructorIdParam);
                UserDAO uDAO = new UserDAO();
                instructor = uDAO.getUserByID(instructorId);
                request.setAttribute("instructor", instructor);

                InstructorApprovalsDAO approvalsDAO = new InstructorApprovalsDAO();
                int approvalID = approvalsDAO.getApprovalIDByUserID(instructorId);
                approval = InstructorApprovalsDAO.select(approvalID);
            } else {
                instructor = (User) request.getAttribute("instructor");
            }

            if (instructor == null) {
                out.println("Instructor not found.");
                return;
            }
        %>

        <div class="container">
            <h1>Instructor Details</h1>
            <%
                User user = (User) request.getAttribute("instructor");
                InstructorCertificatesDAO dao = new InstructorCertificatesDAO();
                List<InstructorCertificates> certificates = dao.getAllCertificatesByUserID(user.getUserID());
            %>
            <c:if test="${not empty instructor}">
                <img src="${instructor.avatar}" alt="Instructor Avatar" class="avatar">
                <table>
                    <tr>
                        <th>User ID:</th>
                        <td>${instructor.userID}</td>
                    </tr>
                    <tr>
                        <th>Full Name:</th>
                        <td>${instructor.firstName} ${instructor.lastName}</td>
                    </tr>
                    <!-- Add other details as necessary -->
                </table>
                <c:choose>
                    <c:when test="<%=approval == null%>">
                        <p>This user has not submitted a registration form for approval.</p>
                    </c:when>
                    <c:otherwise>
                        <c:if test="<%=approval.getApprovalDate() == null%>">
                            <div class="btn-group">
                                <form action="${pageContext.request.contextPath}/instructor-registration-response" method="post" onsubmit="confirmAction(event)">
                                    <input type="hidden" name="action" value="respond">
                                    <input type="hidden" name="userID" value="${instructor.userID}">
                                    <button type="submit" name="decision" value="approve" onclick="setDecision('approve')">Approve</button>
                                    <button type="submit" name="decision" value="reject" class="reject" onclick="setDecision('reject')">Reject</button>
                                </form>
                            </div>
                        </c:if>
                    </c:otherwise>
                </c:choose>
                <div class="certificate-list">
                    <h2>Certificates</h2>
                    <c:forEach var="certificate" items="<%=certificates%>">
                        <div class="certificate-item">
                            <a href="${certificate.certificateUrl}" target="_blank">${certificate.certificateUrl}</a>
                            <p>Uploaded on: ${certificate.uploadDate}</p>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
        </div>
    </body>
</html>
