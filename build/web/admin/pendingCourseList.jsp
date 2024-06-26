<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!doctype html>
<html class="no-js" lang="zxx">
    <%
        // String userName = (String)request.getAttribute("UserName");
        User user = (User) session.getAttribute("user");
        int role = (user != null) ? user.getRole() : 0;
    %>

    <head>
        <%-- HEAD --%>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminCSS/css/assets.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminCSS/vendors/calendar/fullcalendar.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminCSS/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminCSS/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminCSS/css/styles.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminCSS/css/dashboard.css">
        <link class="skin" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/adminCSS/css/color/color-1.css">
        <%@ include file="../template/head.jsp" %>

        <script type="text/javascript">
            function confirmApproval(courseID) {
                var confirmation = confirm("Are you sure you want to approve this course?");
                if (confirmation) {
                    document.getElementById("approveForm" + courseID).submit();
                }
            }
            
            function confirmCancel(courseID) {
                var confirmation = confirm("Are you sure you want to cancel this course publication request?");
                if (confirmation) {
                    document.getElementById("cancelForm" + courseID).submit();
                }
            }
        </script>
        
        <style>
            .viewcer:hover {
                text-decoration: underline;
            }
        </style>

    </head>

    <body>

        <%-- PRE LOADER --%>
        <%@ include file="../template/preLoader.jsp" %>

        <%-- SIDE TOGGLE --%>
        <%@ include file="../template/sideToggle.jsp" %>

        <%-- HEADER --%>
        <%@ include file="../template/adminHeader.jsp" %>

        <!--Main container start -->
        <!-- hero-area -->
        <jsp:include page="../template/heroArea.jsp">
            <jsp:param name="title" value="Pending Courses" />
        </jsp:include>

        <main class="ttr-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <!-- Your Profile Views Chart -->
                    <div class="col-lg-12 m-b30">
                        <div class="widget-box">

                            <div class="widget-inner">
                                <c:if test="${courses != null}">
                                    <c:forEach var="course" items="${courses}">
                                        <c:set var="currentCourse" value="${course}" scope="request" />
                                        <jsp:include page="../template/course/pendingCourseComponent.jsp" />
                                    </c:forEach>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <!-- Your Profile Views Chart END-->
                </div>
            </div>
        </main>
        <div class="ttr-overlay"></div>

        <%-- FOOTER --%>
        <%@ include file="../template/footer.jsp" %>

        <%-- BACK TO TOP --%>
        <%@ include file="../template/backToTop.jsp" %>

        <!-- JS here -->
        <%@ include file="../template/script.jsp" %>

        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/vendors/scroll/scrollbar.min.js"></script>
        <script src="assets/vendors/chart/chart.min.js"></script>
        <script src="assets/js/admin.js"></script>
    </body>
</html>