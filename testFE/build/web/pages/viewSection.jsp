<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://example.com/tags/custom-functions" prefix="custom" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Course Sections and Lectures</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/adminCSS/css/style.css">
        <style>
            .content-wrapper {
                display: flex;
                flex-wrap: wrap;
            }
            .course-content {
                flex: 1;
                padding: 20px;
                border-right: 1px solid #e9ecef;
                padding-right: 0px;
                margin-left: 50px;
            }
            .course-sidebar {
                width: 30%;
                padding: 20px;
                background-color: #f8f9fa;
                overflow-y: auto;
                height: 100vh;
            }
            .section {
                border: 1px solid #dee2e6;
                background-color: #fff;
                padding: 10px;
                margin-bottom: 10px;
            }
            .lecture {
                padding-left: 20px;
            }
            .lecture h6 {
                margin: 0;
            }
            .lecture a {
                color: #007bff;
                text-decoration: none;
            }
            .lecture a:hover {
                text-decoration: underline;
            }
            .section-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                cursor: pointer;
            }
            .section-header h4 {
                margin: 0;
            }
            .section-header .toggle-icon {
                font-size: 1.2em;
            }
            @media (max-width: 768px) {
                .course-sidebar {
                    width: 100%;
                    height: auto;
                }
                .course-content {
                    width: 100%;
                    border-right: none;
                }
            }
            video {
                width: 100%;
                height: auto;
                max-width: 800px;
                max-height: 450px;
                border: 1px solid #dee2e6;
                background-color: #000;
            }
        </style>
    </head>
    <body class="layout-top-nav light-skin theme-primary">
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
                                                <c:set var="fileExtension" value="${custom:substringAfterLast(material.lectureMaterialUrl   , '.')}"/>
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
            // Ensure this runs after the DOM is fully loaded
            document.addEventListener('DOMContentLoaded', function () {
                console.log('DOM fully loaded and parsed');

                // Initialize video elements
                window.videoElement = document.getElementById('course-video');
                window.sourceElement = document.getElementById('video-source');

                if (!window.videoElement || !window.sourceElement) {
                    console.error('Video element or source element not found during initialization');
                }

                // Hide all lecture containers initially
                var lectureContainers = document.querySelectorAll('.lectures');
                lectureContainers.forEach(function (container) {
                    container.style.display = 'none';
                    console.log('Lecture container hidden:', container);
                });
            });

            // Function to load video based on selected lecture
            function loadVideo(videoURL, title) {
                console.log('Loading video with URL:', videoURL);
                console.log('Title:', title);

                if (window.videoElement && window.sourceElement) {
                    window.sourceElement.src = videoURL;
                    window.videoElement.load(); // Reload the video element with the new source

                    document.getElementById('video-title').innerText = title;
                    document.getElementById('video-description').innerText = "Video Description";

                    console.log('Video source updated to:', videoURL);
                } else {
                    console.error('Video element or source element not found');
                }
            }

            // Function to toggle the visibility of lecture sections
            function toggleSection(element) {
                console.log('Toggling section:', element);
                var lectures = element.nextElementSibling;
                var toggleIcon = element.querySelector('.toggle-icon');
                console.log('Lectures:', lectures);
                console.log('Current display style:', window.getComputedStyle(lectures).display);

                if (window.getComputedStyle(lectures).display === "none") {
                    lectures.style.display = "block";
                    toggleIcon.innerText = "-";
                    console.log('Section expanded');
                } else {
                    lectures.style.display = "none";
                    toggleIcon.innerText = "+";
                    console.log('Section collapsed');
                }
            }
        </script>
    </body>
</html>
