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