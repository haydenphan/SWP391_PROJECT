<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="model.Course" %>
<%@ page import="utils.NumberUtils" %>
<%@ page import="DAO.*" %>

<%
    Course currentCourse = (Course)request.getAttribute("currentCourse");
%>

<div class="card-courses-list admin-courses">
    <div style="width: 30%" class="card-courses-media">
        <img src="<%=currentCourse.getImageURL()%>" alt=""/>
    </div>
    <div class="card-courses-full-dec">
        <div class="card-courses-title">
            <h4>
                <%=currentCourse.getCourseName()%>
            </h4>
        </div>
        <div class="card-courses-list-bx">
            <ul class="card-courses-view">
                <li class="card-courses-user">
                    <div class="card-courses-user-pic">
                        <img src="${CourseDAO.getInstructor(currentCourse.createdBy).getAvatar()}" alt=""/>
                    </div>
                    <div class="card-courses-user-info">
                        <h5>Instructor</h5>
                        <h4>${CourseDAO.getInstructor(currentCourse.createdBy).getFirstName()} ${CourseDAO.getInstructor(currentCourse.createdBy).getLastName()}</h4>
                    </div>
                </li>
                <li class="card-courses-categories">
                    <h5>Categories</h5>
                    <h4>
                        <%=SubcategoryDAO.getCategoryNameBySubId(currentCourse.getSubcategoryID())%>
                    </h4>
                </li>
                <li class="card-courses-review">
                    <h5>Review</h5>
                    <ul class="cours-star">
                        ${currentCourse.avgRatingDisplay(1)}
                    </ul>
                </li>
                <li style="width: 10%" class="card-courses-stats">
                    <a href="#" class="btn button-sm <%= currentCourse.IsPublished() ? "green" : "red"%> radius-xl">
                        <%= currentCourse.IsPublished() ? "Published" : "Pending"%>
                    </a>
                </li>
                <li class="card-courses-price">
                    <h3 class="text-primary">$${currentCourse.price}</h3>
                </li>
            </ul>
        </div>
        <div class="row card-courses-dec">
            <div class="col-md-12">
                <h6 class="m-b10">Course Description</h6>
                <p>
                    ${currentCourse.description}
                </p>	
            </div>
            <div class="col-md-12">
                <a href="#" class="btn blue outline radius-xl ">View details</a>
                <a href="#" class="btn green radius-xl outline">Approve</a>
                <a href="#" class="btn red outline radius-xl ">Cancel</a>
            </div>
        </div>

    </div>
</div>