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
            .reply-button, .like-button, .show-replies-button ,.edit-button{
                margin-top: 5px;
                padding: 5px 10px;
                border: none;
                background-color: transparent; /* Transparent background */
                color: #007bff; /* Blue color for links */
                cursor: pointer;
                font-size: 0.9em;
                text-decoration: underline; /* Underline decoration */
                display: inline; /* Make them inline elements */
            }

            .reply-button:hover, .show-replies-button:hover ,.edit-button:hover{
                text-decoration: underline; /* Underline on hover */
            }
        </style>
    </head>
    <body class="layout-top-nav light-skin theme-primary">
        <%-- HEAD --%>
        <%@ include file="../template/head.jsp" %>
        <div class="wrapper">
            <div class="content-wrapper">
                <div class="course-content">
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
        </script>
        <script src="js/sectionComments.js"></script>
    </body>
</html>
