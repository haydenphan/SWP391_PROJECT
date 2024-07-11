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
                            <p id="video-description">${sections[0].lectures[0].lectureDescription}</p>
                            <button onclick="loadNextLecture()" type="button" class="btn btn-primary" id="next-lecture-btn">Next Lecture</button>

                            <!-- Comment Section -->
                            <div class="comment-section">
                                <h3>Comments</h3>
                                <div class="comment-form">
                                    <textarea id="comment-text" rows="4" placeholder="Write a comment..."></textarea>
                                    <button type="button" onclick="submitComment()">Submit</button>
                                </div>
                                <div id="comments-list"></div>
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
                                               onclick="loadVideo('${lecture.lectureURL}', '${lecture.lectureName}', '${lecture.lectureDescription}', ${lecture.lectureID})">
                                                View Video
                                            </a>
                                            <br/>

                                            <c:forEach var="material" items="${lecture.lectureMaterials}">
                                                <c:set var="fileExtension" value="${custom:substringAfterLast(material.lectureMaterialUrl, '.')}"/>
                                                <c:set var="fileName" value="${lecture.lectureName}.${fileExtension}"/>
                                                <c:set var="encodedFileName" value="${fn:escapeXml(fileName)}"/>
                                                <c:set var="encodedFileUrl" value="${fn:escapeXml(material.lectureMaterialUrl)}"/>
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

                // Define global variables
                let currentLectureIndex = 0;
                let currentSectionIndex = 0;
                let sections;
                try {
                    sections = JSON.parse('<c:out value="${fn:escapeXml(sections)}"/>');
                } catch (e) {
                    console.error('Error parsing JSON:', e);
                    sections = [];
                }
                let sectionID = sections.length > 0 ? sections[0].sectionID : null;

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

                // Attach event listener to the "Next Lecture" button
                document.getElementById('next-lecture-btn').addEventListener('click', loadNextLecture);

                // Function to load the next lecture
                function loadNextLecture() {
                    console.log('Loading next lecture');
                    if (currentLectureIndex + 1 < sections[currentSectionIndex].lectures.length) {
                        currentLectureIndex++;
                    } else if (currentSectionIndex + 1 < sections.length) {
                        currentSectionIndex++;
                        currentLectureIndex = 0;
                    } else {
                        alert('You have completed the course!');
                        return;
                    }

                    let nextLecture = sections[currentSectionIndex].lectures[currentLectureIndex];
                    loadVideo(nextLecture.lectureURL, nextLecture.lectureName, nextLecture.lectureDescription, nextLecture.lectureID);
                }

                // Function to load video based on selected lecture
                function loadVideo(videoURL, title, description, lectureID) {
                    console.log('Loading video with URL:', videoURL);
                    console.log('Title:', title);
                    if (window.videoElement && window.sourceElement) {
                        window.sourceElement.src = videoURL;
                        window.videoElement.load(); // Reload the video element with the new source

                        document.getElementById('video-title').innerText = title;
                        document.getElementById('video-description').innerText = description;

                        // Record viewing
                        let studentId = ${user.getUserID()};
                        var xhr = new XMLHttpRequest();
                        xhr.open('POST', '${pageContext.request.contextPath}/record-viewing', true);
                        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                        xhr.send('lectureId=' + lectureID + '&studentId=' + studentId);

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
                        element.style.backgroundColor = "#f0f0f0";  // Change background color when expanded
                        console.log('Section expanded');
                    } else {
                        lectures.style.display = "none";
                        toggleIcon.innerText = "+";
                        element.style.backgroundColor = "";  // Reset background color when collapsed
                        console.log('Section collapsed');
                    }
                }

                // Function to submit a comment
                function submitComment() {
                    var commentText = document.getElementById('comment-text').value;
                    if (commentText.trim() !== '') {
                        // Post the new reply to the backend
                        fetch('SectionComments?sectionID=' + sectionID + '&content=' + encodeURIComponent(commentText), {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json' // Ensure the content type is set correctly
                            },
                            body: JSON.stringify({
                                sectionID: sectionID,
                                content: commentText
                            })
                        })
                                .then(response => {
                                    if (!response.ok) {
                                        throw new Error('Failed to submit comment: ' + response.status);
                                    }
                                    return response.json();
                                })
                                .then(comment => {
                                    var commentsList = document.getElementById('comments-list');
                                    var newCommentElement = createCommentElement(comment, 0);
                                    commentsList.insertBefore(newCommentElement, commentsList.firstChild);
                                    document.getElementById('comment-text').value = ''; // Clear the textarea
                                })
                                .catch(error => {
                                    console.error('Error submitting comment:', error);
                                });
                    }
                }
            });
        </script>
        <script src="${pageContext.request.contextPath}/js/sectionComments.js"></script>
    </body>
</html>
