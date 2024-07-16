<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="model.Course" %>
<%@ page import="utils.NumberUtils" %>
<%@ page import="DAO.*" %>

<%
    Course currentCourse = (Course) request.getAttribute("currentCourse");
%>

<div class="col-xl-4 col-lg-6 col-md-6">
    <div class="course-wrapper-2 mb-30">
        <div class="student-course-img">
            <img src="<%=currentCourse.getImageURL()%>" alt="course-img">
        </div>  
        <div class="course-cart">
            <div class="course-info-wrapper">
                <div class="cart-info-body">
                    <span class="category-color category-color-1">
                        <c:url var="categoryUrl" value="/CourseList">
                            <c:param name="category" value="${fn:escapeXml(SubcategoryDAO.getCategoryNameBySubId(currentCourse.getSubcategoryID()) != null ? SubcategoryDAO.getCategoryNameBySubId(currentCourse.getSubcategoryID()) : 'Others')}"/>
                        </c:url>
                        <a href="${categoryUrl}">
                            ${fn:escapeXml(SubcategoryDAO.getCategoryNameBySubId(currentCourse.getSubcategoryID()) != null ? SubcategoryDAO.getCategoryNameBySubId(currentCourse.getSubcategoryID()) : 'Others')}
                        </a>
                    </span>

                    <h3>
                        ${fn:escapeXml(currentCourse.getCourseName())}
                    </h3>

                    <div class="cart-level">
                        <h5>Level : 
                            <span>
                                ${fn:escapeXml(LevelDAO.getLevelNameByID(currentCourse.getLevelID()))}
                            </span>
                        </h5>
                        <p>${fn:escapeXml(currentCourse.getDescription())}</p>
                    </div>
                    <div class="info-cart-text">
                        <ul>
                            <c:forEach items="${fn:split(currentCourse.getRequirements(), ',')}" var="requirement">
                                <li><i class="far fa-check"></i> ${fn:escapeXml(fn:trim(requirement))}</li>
                                </c:forEach>
                        </ul>
                    </div>
                    <div class="course-action">
                        <a href="${pageContext.request.contextPath}/CourseDetail?id=${currentCourse.getCourseID()}" class="view-details-btn">View Details</a>
                        <button class="wishlist-btn"><i class="flaticon-like"></i></button>
                        <a href="#" class="c-share-btn"><i class="flaticon-previous"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="student-course-footer">
            <div class="student-course-linker">
                <div class="course-lessons">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16.471" height="16.471" viewBox="0 0 16.471 16.471">
                        <g id="blackboard-8" transform="translate(-0.008)">
                            <path id="Path_106" data-name="Path 101" d="M16,1.222H8.726V.483a.483.483,0,1,0-.965,0v.74H.491A.483.483,0,0,0,.008,1.7V13.517A.483.483,0,0,0,.491,14H5.24L4.23,15.748a.483.483,0,1,0,.836.483L6.354,14H7.761v1.99a.483.483,0,0,0,.965,0V14h1.407l1.288,2.231a.483.483,0,1,0,.836-.483L11.247,14H16a.483.483,0,0,0,.483-.483V1.7A.483.483,0,0,0,16,1.222Zm-.483.965v8.905H.973V2.187Zm0,10.847H.973v-.976H15.514Z" fill="#575757" />
                        </g>
                    </svg>
                    <span class="ms-2">12 Lessons</span>
                </div>
                <div class="portfolio-price">
                    <span>$${currentCourse.getPrice()}</span>
                </div>
            </div>
            <div class="student-course-text">
                <h3>
                    <a href="course-details.html">${fn:escapeXml(currentCourse.getCourseName())}</a>
                </h3>
            </div>
            <div class="portfolio-user">
                <div class="user-icon">
                    <a href="instructor-profile.html"><i class="fas fa-user"></i> ${fn:escapeXml(CourseDAO.getInstructor(currentCourse.getCreatedBy()).getFirstName())} ${fn:escapeXml(CourseDAO.getInstructor(currentCourse.getCreatedBy()).getLastName())}</a>
                </div>
                <div class="course-icon">
                    (${currentCourse.avgRatingDisplay(1)})
                    <i class="fas fa-star"></i>
                </div>
            </div>
        </div>
    </div>
</div>