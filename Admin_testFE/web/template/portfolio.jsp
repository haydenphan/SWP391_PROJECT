<%@ page import="DAO.*" %>
<section class="course-area p-relative pt-110 pb-90">
    <div class="course-shape-1">
        <img src="${pageContext.request.contextPath}/img/shape/portfolio-shap-1.png" alt="shape">
    </div>
    <div class="course-shape-2">
        <img src="${pageContext.request.contextPath}/img/shape/portfolio-shap-2.png" alt="shape">
    </div>
    <div class="course-shape-3">
        <img src="${pageContext.request.contextPath}/img/shape/portfolio-shap-3.png" alt="shape">
    </div>
    <div class="container">
        <div class="row">
            <div class="col-xl-5 col-lg-5 f-left">
                <div class="section-title mb-50">
                    <h2>Discover<br> World's Best <span class="down-mark-line">Courses</span></h2>
                </div>
            </div>
            <div class="col-xl-7 col-lg-7">
                <div class="portfolio-button mt-60">
                    <button class="filter-button active" data-filter="*">View All<span class="port-red"><i class="fas fa-map-marker-alt"></i></span></button>
                    <button class="filter-button" data-filter=".c-1">Data Science<span class="port-red"><i class="fas fa-map-marker-alt"></i></span></button>
                    <button class="filter-button" data-filter=".c-2">Development<span class="port-red"><i class="fas fa-map-marker-alt"></i></span></button>
                    <button class="filter-button" data-filter=".c-3">Business<span class="port-red"><i class="fas fa-map-marker-alt"></i></span></button>
                    <button class="filter-button" data-filter=".c-4">Life Styles<span class="port-red"><i class="fas fa-map-marker-alt"></i></span></button>
                </div>
            </div>  
        </div>
        <div class="row grid course-main-items">
            <c:forEach var="course" items="<%=CourseDAO.getCoursesSortedByEnrollment()%>" begin="0" end="5">
                <c:set var="currentCourse" value="${course}" scope="request" />
                <jsp:include page="../template/course/homeCourseComponent.jsp" />
            </c:forEach>
        </div>
    </div>
</section>