<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String title = request.getParameter("title");
%>

<!-- hero-area-start -->
<div class="hero-arera course-item-height" data-background="${pageContext.request.contextPath}/img/slider/course-slider.jpg">
    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <div class="hero-course-1-text">
                    <h2><%= title != null ? title : "Default Title" %></h2>
                </div>
                <div class="course-title-breadcrumb">
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item"><span><%= title != null ? title : "Default Title" %></span></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- hero-area-end -->