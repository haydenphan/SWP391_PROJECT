<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="model.*" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<% 
    int id = Integer.parseInt(request.getParameter("courseID"));
    Course rCourse = CourseDAO.getCoursesByID(id);
    
    String requirements = rCourse.getRequirements();
    List<String> requirementList;
    if (requirements.contains(".")) {
        requirementList = Arrays.asList(requirements.split("\\.")); // Split the paragraph into sentences based on "."
    } else if (requirements.contains("\n")) {
        requirementList = Arrays.asList(requirements.split("\\n")); // Split based on new lines if no periods
    } else if (requirements.contains(",")) {
        requirementList = Arrays.asList(requirements.split(",")); // Split based on commas if no periods or new lines
    } else {
        requirementList = Collections.singletonList(requirements); // Treat as a single sentence if no delimiters found
    }
    
    Category category = CourseDAO.getCourseSubCategory(rCourse);
%>

<div class="col-xl-4 col-lg-6 col-md-6">
    <div class="course-wrapper-2 mb-30">
        <div class="student-course-img">
            <img src="${pageContext.request.contextPath}/img/course/course-01.jpg" alt="course-img">
                <!-- <%=rCourse.getBackgroundImage() %> -->
        </div>
        <div class="course-cart">
            <div class="course-info-wrapper">
                <div class="cart-info-body">
                    <span class="category-color category-color-1"><a
                            href="course.html"><%=category.getCategoryName() %></a></span>
                    <a href="${pageContext.request.contextPath}/pages/courseDetails.jsp">
                        <h3>
                            <%=rCourse.getCourseName() %>
                        </h3>
                    </a>
                    <div class="cart-lavel">
                        <h5>Level : <span><%=rCourse.getLevel() %></span></h5>
                        <p>
                            <%=rCourse.getDescription() %>
                        </p>
                    </div>
                    <div class="info-cart-text">
                        <ul>
                            <c:forEach items="<%=requirementList%>" var="requirement">
                                <li><i class="far fa-check"></i> <c:out value="${fn:trim(requirement)}"/></li>
                                </c:forEach>
                        </ul>
                    </div>
                    <div class="course-action">
                        <a href="${pageContext.request.contextPath}/pages/courseDetails.jsp?courseID=<%=rCourse.getCourseID() %>" class="view-details-btn">View Details</a>
                        <button class="wishlist-btn"><i class="flaticon-like"></i></button>
                        <a href="${pageContext.request.contextPath}/pages/courseDetails.jsp?courseID=<%=rCourse.getCourseID() %>" class="c-share-btn"><i
                                class="flaticon-previous"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="student-course-footer">
            <div class="student-course-linkter">
                <div class="course-lessons">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16.471" height="16.471"
                         viewBox="0 0 16.471 16.471">
                        <g id="blackboard-8" transform="translate(-0.008)">
                            <path id="Path_106" data-name="Path 101"
                                  d="M16,1.222H8.726V.483a.483.483,0,1,0-.965,0v.74H.491A.483.483,0,0,0,.008,1.7V13.517A.483.483,0,0,0,.491,14H5.24L4.23,15.748a.483.483,0,1,0,.836.483L6.354,14H7.761v1.99a.483.483,0,0,0,.965,0V14h1.407l1.288,2.231a.483.483,0,1,0,.836-.483L11.247,14H16a.483.483,0,0,0,.483-.483V1.7A.483.483,0,0,0,16,1.222Zm-.483.965v8.905H.973V2.187Zm0,10.847H.973v-.976H15.514Z"
                                  fill="#575757" />
                        </g>
                    </svg>
                    <span class="ms-2">12 Lessons</span>
                </div>
                <div class="portfolio-price">
                    <span><%=rCourse.getPrice() %></span>
                </div>
            </div>
            <div class="student-course-text">
                <h3>
                    <a href="course-details.html">
                        <%=rCourse.getCourseName() %>
                    </a>
                </h3>
            </div>
            <div class="portfolio-user">
                <div class="user-icon">
                    <a href="instructor-profile.html"><i class="fas fa-user"></i>Danial</a>
                </div>
                <div class="course-star">
                    <% for (int i = 1; i <= 5; i++) { %>
                    <ul>
                        <li>
                            <i class="fas fa-star<%= (i <= rCourse.getRatings()) ? "" : " fal" %>"></i>
                        </li>
                    </ul>
                    <% } %>
                    <span>(100 reviews)</span>
                </div>
            </div>
        </div>
    </div>
</div>