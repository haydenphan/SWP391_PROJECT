<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://example.com/tags/custom-functions" prefix="custom" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html style="height: auto" lang="en">
    <head>
        <%-- HEAD --%>
        <%@ include file="../template/head.jsp" %>
        <meta charset="UTF-8">
        <title>Course Sections and Lectures</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/adminCSS/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/viewSection.css">
    </head>
    <body class="layout-top-nav light-skin theme-primary">
        <%-- HEAD --%>
        <%@ include file="../template/head.jsp" %>
        <div class="wrapper">
            <div class="content-wrapper">
                <div class="course-content">
                    <c:choose>
                        <c:when test="${not empty sections and not empty sections[0].lectures}">
                            <h2 id="video-title">${sections[0].lectures[0].lectureName}</h2>
                            <video id="course-video" controls>
                                <source id="video-source" src="${sections[0].lectures[0].lectureURL}" type="video/mp4">
                                Your browser does not support the video tag.
                            </video>
                            <p id="video-description">Video Description</p>
                            <button type="button" class="btn btn-primary">Next Lecture</button>

                            <!-- Comment Section -->
                            <div class="comment-section">
                                <h3>Comments</h3>
                                <div class="comment-form">
                                    <textarea id="comment-text" rows="4" placeholder="Write a comment..."></textarea>
                                    <button type="button" onclick="submitComment()">Submit</button>
                                </div>
                                <div id="comments-list">

                                </div>
                                <button id="load-more-btn" onclick="loadMoreComments()">Load More</button>
                            </div>

                        </c:when>
                        <c:otherwise>
                            <h2>No lectures available</h2>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="course-sidebar">
                    <h3>Content</h3>
                    <c:forEach var="section" items="${sections}">
                        <div class="section">
                            <div class="section-header" onclick="toggleSection(this)">
                                <h4>${section.sectionName}</h4>
                                <span class="toggle-icon">+</span>
                            </div>
                            <div class="lectures">
                                <c:forEach var="lecture" items="${section.lectures}">
                                    <div class="lecture">
                                        <h6>${lecture.lectureName}</h6>
                                        <div>
                                            <a href="javascript:void(0)" 
                                               onclick="loadVideo('${lecture.lectureURL}', '${lecture.lectureName}')">
                                                View Video
                                            </a>
                                            <br/>

                                            <c:forEach var="material" items="${lecture.lectureMaterials}">
                                                <c:set var="fileExtension" value="${custom:substringAfterLast(material.lectureMaterialUrl, '.')}"/>
                                                <c:set var="fileName" value="${lecture.lectureName}.${fileExtension}"/>
                                                <c:set var="encodedFileName" value="${fn:escapeXml(fileName)}"/>
                                                <c:set var="encodedFileUrl" value="${fn:escapeXml(lecture.lectureURL)}"/>
                                                <a href="${pageContext.request.contextPath}/download?fileUrl=${encodedFileUrl}&fileName=${encodedFileName}">
                                                    Download Materials
                                                </a>
                                                <br/>
                                            </c:forEach>

                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        
        <script>
            let sectionID = ${sections[0].sectionID};
        </script>
        <script src="${pageContext.request.contextPath}/js/viewSection.js"></script>
        <script src="${pageContext.request.contextPath}/js/sectionComments.js"></script>
    </body>
</html>