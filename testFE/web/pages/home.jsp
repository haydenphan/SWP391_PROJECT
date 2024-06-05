<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
<!doctype html>
<html class="no-js" lang="zxx">


    <head>
        <%-- HEAD --%>
        <%@ include file="../template/head.jsp" %>
    </head>

    <body>

        <%-- PRE LOADER --%>
        <%@ include file="../template/preLoader.jsp" %>

        <%-- SIDE TOGGLE --%>
        <%@ include file="../template/sideToggle.jsp" %>

        <%-- HEADER --%>
        <%@ include file="../template/header.jsp" %>

        <main>
            <!-- BANNER -->
            <%@ include file="../template/homeBanner.jsp" %>

            <!-- TOP CATEGORIES -->
            <%@ include file="../template/categoryArea.jsp" %>
        </main>

        <%-- FOOTER --%>
        <%@ include file="../template/footer.jsp" %>

        <%-- BACK TO TOP --%>
        <%@ include file="../template/backToTop.jsp" %>

        <!-- JS here -->
        <%@ include file="../template/script.jsp" %>
    </body>
</html>