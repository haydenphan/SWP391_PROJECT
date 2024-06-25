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
            .comment-section {
                margin-top: 30px;
                border-top: 1px solid #dee2e6;
                padding-top: 20px;
            }
            .comment-form textarea {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid #dee2e6;
                border-radius: 4px;
                resize: vertical;
            }
            .comment-form button {
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                background-color: #007bff;
                color: white;
                cursor: pointer;
            }
            .comment-form button:hover {
                background-color: #0056b3;
            }
            .comment {
                margin-bottom: 20px;
            }
            .comment .comment-author {
                font-weight: bold;
                margin-bottom: 5px;
            }
            .comment .comment-text {
                margin-bottom: 5px;
            }
            .comment .comment-date {
                color: #6c757d;
                font-size: 0.9em;
            }
            .reply-button {
                background: none;
                border: none;
                color: #007bff;
                cursor: pointer;
                padding: 0;
                font-size: 0.9em;
            }
            .reply-button:hover {
                text-decoration: underline;
            }
            .reply-form {
                margin-top: 10px;
                margin-left: 20px;
            }
            .nested-comments {
                margin-left: 20px;
            }
        </style>
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
                                    <!-- Example comments -->
                                    <div class="comment" id="comment-1">
                                        <div class="comment-author">John Doe</div>
                                        <div class="comment-text">This is an example comment.</div>
                                        <div class="comment-date">Posted on June 22, 2024</div>
                                        <button class="reply-button" onclick="toggleReplyForm(1)">Reply</button>
                                        <div class="reply-form" id="reply-form-1" style="display: none;">
                                            <textarea rows="2" placeholder="Write a reply..."></textarea>
                                            <button type="button" onclick="submitReply(1)">Submit</button>
                                        </div>
                                        <div class="nested-comments" id="nested-comments-1">
                                            <!-- Nested comments go here -->
                                        </div>
                                    </div>
                                    <div class="comment" id="comment-2">
                                        <div class="comment-author">Jane Smith</div>
                                        <div class="comment-text">Another example comment.</div>
                                        <div class="comment-date">Posted on June 21, 2024</div>
                                        <button class="reply-button" onclick="toggleReplyForm(2)">Reply</button>
                                        <div class="reply-form" id="reply-form-2" style="display: none;">
                                            <textarea rows="2" placeholder="Write a reply..."></textarea>
                                            <button type="button" onclick="submitReply(2)">Submit</button>
                                        </div>
                                        <div class="nested-comments" id="nested-comments-2">
                                            <!-- Nested comments go here -->
                                        </div>
                                    </div>
                                </div>
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
                    var commentsList = document.getElementById('comments-list');
                    var newComment = document.createElement('div');
                    newComment.className = 'comment';
                    newComment.innerHTML = `
                        <div class="comment-author">You</div>
                        <div class="comment-text">${commentText}</div>
                        <div class="comment-date">Just now</div>
                        <button class="reply-button" onclick="toggleReplyForm(${commentsList.children.length + 1})">Reply</button>
                        <div class="reply-form" id="reply-form-${commentsList.children.length + 1}" style="display: none;">
                            <textarea rows="2" placeholder="Write a reply..."></textarea>
                            <button type="button" onclick="submitReply(${commentsList.children.length + 1})">Submit</button>
                        </div>
                        <div class="nested-comments" id="nested-comments-${commentsList.children.length + 1}">
                            <!-- Nested comments go here -->
                        </div>
                    `;
                    commentsList.insertBefore(newComment, commentsList.firstChild);
                    document.getElementById('comment-text').value = ''; // Clear the textarea
                }
            }

            // Function to toggle the reply form visibility
            function toggleReplyForm(commentId) {
                var replyForm = document.getElementById('reply-form-' + commentId);
                if (replyForm.style.display === 'none' || replyForm.style.display === '') {
                    replyForm.style.display = 'block';
                } else {
                    replyForm.style.display = 'none';
                }
            }

            // Function to submit a reply
            function submitReply(commentId) {
                var replyText = document.querySelector('#reply-form-' + commentId + ' textarea').value;
                if (replyText.trim() !== '') {
                    var nestedCommentsList = document.getElementById('nested-comments-' + commentId);
                    var newReply = document.createElement('div');
                    newReply.className = 'comment';
                    newReply.innerHTML = `
                        <div class="comment-author">You</div>
                        <div class="comment-text">${replyText}</div>
                        <div class="comment-date">Just now</div>
                    `;
                    nestedCommentsList.insertBefore(newReply, nestedCommentsList.firstChild);
                    document.querySelector('#reply-form-' + commentId + ' textarea').value = ''; // Clear the textarea
                    document.getElementById('reply-form-' + commentId).style.display = 'none'; // Hide the reply form
                }
            }
        </script>
    </body>
</html>