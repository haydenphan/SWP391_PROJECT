<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>

<%
    Course currentCourse = (Course) request.getAttribute("currentCourse");
    Category category = CategoryDAO.getCategoryBySubcategoryID(currentCourse.getSubcategoryID());
    String categoryClass = category != null ? category.getCategoryClass() : "c-others";
%>

<div class="col-xl-4 col-lg-4 col-md-6 grid-item course-item <%= categoryClass%>">
    <div class="eduman-course-main-wrapper mb-30">
        <div class="course-cart">
            <div class="course-info-wrapper">
                <div class="cart-info-body">
                    <span class="category-color category-color-1">
                        <c:url var="categoryUrl" value="/CourseList">
                            <c:param name="subcategoryID" value="${currentCourse.subcategoryID}"/>
                        </c:url>
                        <a href="${categoryUrl}">
                            <%=SubcategoryDAO.getCategoryNameBySubId(currentCourse.getSubcategoryID()) != null ? SubcategoryDAO.getCategoryNameBySubId(currentCourse.getSubcategoryID()) : "Others"%>
                        </a>
                    </span>
                    <a href="${pageContext.request.contextPath}/CourseDetail?id=${currentCourse.courseID}">
                        <h3>
                            <%=currentCourse.getCourseName()%>
                        </h3>
                    </a>
                    <div class="cart-lavel">
                        <h5>Level : <span><%=LevelDAO.getLevelNameByID(currentCourse.getLevelID())%></span></h5>
                        <p>${currentCourse.description}</p>
                    </div>
                    <div class="info-cart-text">
                        <ul>
                            <c:forEach items="${fn:split(currentCourse.requirements, ',')}" var="requirement">
                                <li><i class="far fa-check"></i> <c:out value="${fn:trim(requirement)}"/></li>
                                </c:forEach>
                        </ul>
                    </div>
                    <div class="course-action">
                        <a href="${pageContext.request.contextPath}/CourseDetail?id=${currentCourse.courseID}" class="view-details-btn">View Details</a>
                        <button class="wishlist-btn"><i class="flaticon-like"></i></button>
                        <a href="${pageContext.request.contextPath}/pages/courseDetails.jsp?courseID=${currentCourse.courseID}" class="c-share-btn"><i class="flaticon-previous"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="eduman-course-thumb w-img">
            <a href="${pageContext.request.contextPath}/CourseDetail?id=${currentCourse.courseID}"><img src="<%=currentCourse.getImageURL()%>" alt="course-img"></a>
        </div>
        <div class="eduman-course-wraper">
            <div class="eduman-course-heading">
                <a href="${pageContext.request.contextPath}/CourseList?subcategoryID=${currentCourse.subcategoryID}" class="course-link-color-1"><%=SubcategoryDAO.getCategoryNameBySubId(currentCourse.getSubcategoryID()) != null ? SubcategoryDAO.getCategoryNameBySubId(currentCourse.getSubcategoryID()) : "Others"%></a>
                <span class="couse-star"><i class="fas fa-star"></i>${currentCourse.avgRatingDisplay(1)}</span>
            </div>
            <div class="eduman-course-text">
                <h3><a href="${pageContext.request.contextPath}/CourseDetail?id=${currentCourse.courseID}">${currentCourse.courseName}</a></h3>
            </div>
            <div class="eduman-course-meta">
                <div class="eduman-course-price">
                    <span class="price-now">$${currentCourse.price}</span>
                </div>
                <div class="eduman-course-tutor">
                    <img src="assets/img/portfilo/course-tutor-01.png" alt="image not found">
                    <a href="${pageContext.request.contextPath}/instructor-profile.jsp?instructorID=${currentCourse.createdBy}"><span>${CourseDAO.getInstructor(currentCourse.createdBy).getFirstName()} ${CourseDAO.getInstructor(currentCourse.createdBy).getLastName()}</span></a>
                </div>
            </div>
        </div>
        <div class="eduman-course-footer">
            <div class="course-lessson-svg">
                <svg xmlns="http://www.w3.org/2000/svg" width="16.471" height="16.471" viewBox="0 0 16.471 16.471">
                <g id="blackboar09" transform="translate(-0.008)">
                <path id="Path_01" data-name="Path 101" d="M16,1.222H8.726V.483a.483.483,0,1,0-.965,0v.74H.491A.483.483,0,0,0,.008,1.7V13.517A.483.483,0,0,0,.491,14H5.24L4.23,15.748a.483.483,0,1,0,.836.483L6.354,14H7.761v1.99a.483.483,0,0,0,.965,0V14h1.407l1.288,2.231a.483.483,0,1,0,.836-.483L11.247,14H16a.483.483,0,0,0,.483-.483V1.7A.483.483,0,0,0,16,1.222Zm-.483.965v8.905H.973V2.187Zm0,10.847H.973v-.976H15.514Z" fill="#575757"/>
                </g>
                </svg>
                <span class="ms-2">12 Lessons</span>
            </div>
            <div class="course-deteals-btn">
                <a href="${pageContext.request.contextPath}/CourseDetail?id=${currentCourse.courseID}"><span class="me-2">View Details</span><i class="far fa-arrow-right"></i></a>
            </div>
        </div>
    </div>
</div>