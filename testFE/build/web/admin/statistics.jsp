<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>
<%@ page import="java.util.List" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <%-- HEAD --%>
        <style>
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0, 0, 0, 0.4);
                padding-top: 60px;
            }
            .modal-content {
                background-color: #fefefe;
                margin: 5% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
            }
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            .close:hover, .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
        </style>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/adminCSS/css/vendors_css.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/adminCSS/css/horizontal-menu.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/adminCSS/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/adminCSS/css/skin_color.css">
        <%@ include file="../template/head.jsp" %>
        <script src="<c:url value='/js/notifications.js'/>"></script>
        <link rel="stylesheet" href="<c:url value='/css/notifications.css'/>">
    </head>
    <body class="layout-top-nav light-skin theme-primary fixed">
        <%-- PRE LOADER --%>
        <%@ include file="../template/preLoader.jsp" %>
        <%-- SIDE TOGGLE --%>
        <%@ include file="../template/sideToggle.jsp" %>
        <%-- HEADER --%>
        <%@ include file="../template/adminHeader.jsp" %>
        <div class="wrapper">
            <div class="content-wrapper">
                <div class="container-full">
                    <%-- Dynamically include statistics content based on the parameter --%>
                    <c:choose>
                        <c:when test="${param.statistics == 'transaction'}">
                            <%@ include file="statisticalTransaction.jsp" %>
                        </c:when>
                        <c:when test="${param.statistics == 'enrollment'}">
                            <%@ include file="statisticalCourseEnrolled.jsp" %>
                        </c:when>
                        <c:when test="${param.statistics == 'completion'}">
                            <%@ include file="statisticalCourseCompleted.jsp" %>
                        </c:when>
                        <c:when test="${param.statistics == 'usercount'}">
                            <%@ include file="statisticalUserCount.jsp" %>
                        </c:when>
                        <c:otherwise>
                            <p>Please select a statistics category from the menu.</p>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <div style="height: 200px"></div>
        <%-- BACK TO TOP --%>
        <%@ include file="../template/backToTop.jsp" %>
        <!-- JS here -->
        <%@ include file="../template/script.jsp" %>
        <script type="text/javascript">
            var contextPath = '<%= request.getContextPath()%>';
        </script>
        <script src="${pageContext.request.contextPath}/adminCSS/js/adminWallet.js"></script>
    </body>
</html>