<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="model.*" %>
<%@ page import="utils.NumberUtils" %>
<%@ page import="DAO.*" %>

<%
    Course currentCourse = (Course) request.getAttribute("currentCourse");
    User user = (User) session.getAttribute("user");
%>

<div class="inprogress-course mb-30">
    <div class="inprogress-course-img">
        <a href="${pageContext.request.contextPath}/CourseDetail?id=<%=currentCourse.getCourseID()%>"><img src="<%= currentCourse.getImageURL()%>" alt="" /></a>
    </div>
    <div class="inprogress-course-text">
        <div style="display: flex" class="inprogress-course-rating">
            <ul style="display: flex">
                <c:set var="rating" value="<%= currentCourse.avgRatingDisplay(1)%>" />
                <c:forEach var="i" begin="1" end="5">
                    <li style="margin-right: 5px">
                        <c:choose>
                            <c:when test="${i <= rating}">
                                <i class="fas fa-star"></i>
                            </c:when>
                            <c:otherwise>
                                <i class="fal fa-star"></i>
                            </c:otherwise>
                        </c:choose>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <h4 class='inprogress-course-title'>
            <a href="${pageContext.request.contextPath}/CourseDetail?id=<%=currentCourse.getCourseID()%>"><%= currentCourse.getCourseName()%></a>
        </h4>
        <div class="inprogress-course-lesson mb-15">
            <span>Completed Lessons :</span>
            <h6><span>
                    <%=LectureProgressDAO.countCompletedLectures(user.getUserID(), currentCourse.getCourseID())%>
                </span> of 
                <span>
                    <%=CourseDAO.getTotalLecturesByCourseID(currentCourse.getCourseID())%>
                </span> lessons</h6>
        </div>
        <div class="rating-row mb-10">
            <div class="progress">
                <div class="progress-bar progress-bar1 wow fadeInLeft" style="width: <%=CourseDAO.calculateCourseCompletionPercentage(user.getUserID(), currentCourse.getCourseID())%>%;" aria-valuenow="<%=CourseDAO.calculateCourseCompletionPercentage(user.getUserID(), currentCourse.getCourseID())%>" aria-valuemin="0" aria-valuemax="100">
                    
                </div>
            </div>
            <div class="progress-tittle">
                <h6><span><%=CourseDAO.calculateCourseCompletionPercentage(user.getUserID(), currentCourse.getCourseID())%>%</span> Complete</h6>
            </div>
        </div>
    </div>
</div>