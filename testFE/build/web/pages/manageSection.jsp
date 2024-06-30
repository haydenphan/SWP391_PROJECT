<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="model.*" %>
<%@ page import="utils.NumberUtils" %>
<%@ page import="DAO.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <%-- HEAD --%>
        <%@ include file="../template/head.jsp" %>

        <style>
            body {
                background-color: #f0f8ff;
                font-family: 'Roboto', sans-serif;
            }

            .hero-area {
                background: linear-gradient(135deg, #2467EC, #1b53bb);
                color: white;
                padding: 2rem;
                text-align: center;
                border-radius: 10px;
                margin-bottom: 2rem;
            }

            .section-card {
                border: 1px solid #d3d3d3;
                border-radius: 15px;
                background-color: #fff;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                margin-bottom: 2rem;
                transition: transform 0.3s ease-in-out;
            }

            .section-card:hover {
                transform: translateY(-5px);
            }

            .section-header {
                background: #2467EC;
                color: white;
                border-top-left-radius: 15px;
                border-top-right-radius: 15px;
                padding: 1rem;
                text-align: center;
            }

            .section-title {
                margin-bottom: 0;
                font-size: 1.5rem;
                color: white;
            }

            .section-body {
                padding: 1.5rem;
            }

            .lecture-list {
                list-style: none;
                padding: 0;
            }

            .lecture-item {
                border: 1px solid #d3d3d3;
                border-radius: 10px;
                background-color: #f9f9f9;
                padding: 1rem;
                margin-bottom: 1rem;
                transition: background-color 0.3s ease-in-out;
            }

            .lecture-item:hover {
                background-color: #e9ecef;
            }

            .lecture-title {
                font-size: 1.2rem;
                margin-bottom: 0.5rem;
            }

            .lecture-link {
                color: #2467EC;
                text-decoration: none;
            }

            .lecture-link:hover {
                text-decoration: underline;
            }
        </style>
    </head>

    <body>
        <!-- hero-area -->
        <jsp:include page="../template/heroArea.jsp">
            <jsp:param name="title" value="Section Management" />
        </jsp:include>

        <%
            List<CourseSection> sectionList = (List) request.getAttribute("sectionList");
            User user = (User) session.getAttribute("user");
        %>

        <div style="margin-top: 30px" class="container">
            <div class="row">
                <c:forEach var="section" items="${sectionList}">

                    <div class="col-lg-6">
                        <div class="section-card">
                            <div class="section-header">
                                <h2 class="section-title">Section ${section.sectionOrder}. ${section.sectionName}</h2>
                            </div>
                            <div class="section-body">
                                <ul class="lecture-list">
                                    <c:set var="currentSection" value="${section}" scope="request" />
                                    <jsp:include page="../template/course/courseSectionComponent.jsp" />
                                </ul>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <%-- BACK TO TOP --%>
        <%@ include file="../template/backToTop.jsp" %>

        <!-- JS here -->
        <%@ include file="../template/script.jsp" %>
    </body>

    <body>
        <%-- BACK TO TOP --%>
        <%@ include file="../template/backToTop.jsp" %>

        <!-- JS here -->
        <%@ include file="../template/script.jsp" %>
    </body>
</html>