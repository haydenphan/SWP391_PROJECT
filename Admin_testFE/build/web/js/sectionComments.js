// Variables for offset and limit
let offset = 0;
const limit = 10; // Number of comments to fetch per request
let sortBy = 'latest';
//const sectionID = document.querySelector('meta[name="sectionID"]').content;
//
//// Function to submit a comment
//function submitComment() {
//    var commentText = document.getElementById('comment-text').value;
//    if (commentText.trim() !== '') {
//        // Post the new reply to the backend
//        fetch('SectionComments?sectionID=' + sectionID + '&content=' + encodeURIComponent(commentText), {
//            method: 'POST',
//            headers: {
//                'Content-Type': 'application/json' // Ensure the content type is set correctly
//            },
//            body: JSON.stringify({
//                sectionID: sectionID,
//                content: commentText
//            })
//        })
//                .then(response => {
//                    if (!response.ok) {
//                        throw new Error('Failed to submit comment: ' + response.status);
//                    }
//                    return response.json();
//                })
//                .then(comment => {
//                    var commentsList = document.getElementById('comments-list');
//                    var newCommentElement = createCommentElement(comment, 0);
//                    commentsList.insertBefore(newCommentElement, commentsList.firstChild);
//                    document.getElementById('comment-text').value = ''; // Clear the textarea
//                })
//                .catch(error => {
//                    console.error('Error submitting comment:', error);
//                });
//    }
//}

// Function to submit a reply
function submitReply(commentId, repliedToUserID, nearCommentId) {
    var replyText = document.querySelector('#reply-form-' + nearCommentId + ' textarea').value;
    if (replyText.trim() !== '') {
        // Post the new reply to the backend
        fetch('SectionComments?sectionID=' + sectionID + '&content=' + encodeURIComponent(replyText)
                + '&parentID=' + commentId + '&repliedToUserID=' + repliedToUserID, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        sectionID: sectionID,
                        content: replyText,
                        parentID: commentId,
                        repliedToUserID: repliedToUserID
                    })
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Failed to submit reply: ' + response.status);
                    }
                    return response.json();
                })
                .then(newReply => {
                    // Add the new reply to the UI
                    var nestedCommentsList = document.getElementById('nested-comments-' + commentId);
                    var newReplyElement = createCommentElement(newReply, 1);
                    nestedCommentsList.insertBefore(newReplyElement, nestedCommentsList.firstChild);
                    document.querySelector('#reply-form-' + commentId + ' textarea').value = ''; // Clear the textarea
                    document.getElementById('reply-form-' + commentId).style.display = 'none'; // Hide the reply form
                    nestedCommentsList.style.display = 'block';
                })
                .catch(error => {
                    console.error('Error submitting reply:', error);
                });
    }
}

function submitEdit(commentID) {
    const editedText = document.getElementById('edit-form-' + commentID).querySelector('textarea').value;
    if (editedText.trim() !== '') {
        // Example of using fetch to send a PUT request to your backend endpoint
        fetch('SectionComments?commentID=' + commentID + '&content=' + encodeURIComponent(editedText) + '&mode=updating', {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                commentID: commentID,
                content: editedText,
                mode: 'updating'
            })
        })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Failed to edit comment: ' + response.status);
                    }
                    return response.json();
                })
                .then(data => {
                    // Optionally update the UI to reflect the edited comment
                    const existingCommentElement = document.getElementById('comment-' + commentID);
                    const updatedCommentElement = createCommentElement(data, data.parentCommentID ? 1 : 0); // Function to create HTML for updated comment
                    existingCommentElement.parentNode.replaceChild(updatedCommentElement, existingCommentElement);
                    // Hide the edit form after submission
                    const editForm = document.getElementById('edit-form-' + commentID);
                    editForm.style.display = 'none';
                })
                .catch(error => {
                    console.error('Error editing comment:', error);
                    // Handle error scenarios as needed
                });
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

// Function to fetch comments
function fetchComments() {
    fetch('SectionComments?position=' + offset + '&offset=' + limit + '&sectionID=' + sectionID + '&sortBy=' + sortBy)
            .then(function (response) {
                return response.json();
            })
            .then(function (data) {
                displayComments(data);
                offset += limit; // Increment offset for next load
            })
            .catch(function (error) {
                console.error('Error fetching comments:', error);
            });
}

// Function to display fetched comments
function displayComments(comments) {
    var commentsList = document.getElementById('comments-list');
    comments.forEach(function (comment) {
        var newComment = createCommentElement(comment, 0);
        commentsList.appendChild(newComment);
    });

    // Show or hide Load More button based on remaining comments
    if (comments.length < limit) {
        document.getElementById('load-more-btn').style.display = 'none';
    } else {
        document.getElementById('load-more-btn').style.display = 'block';
    }
}

// Function to load more comments
function loadMoreComments() {
    fetchComments();
}

// Function to create a comment element
function createCommentElement(comment, type) {
    var commentElement = document.createElement('div');
    commentElement.className = 'comment';
    commentElement.id = 'comment-' + comment.commentID;
    var repliedToUser = comment.repliedToUser ? '@' + comment.repliedToUser.given_name + comment.repliedToUser.family_name + ' ' : '';
    var topCmtID = comment.parentCommentID ? comment.parentCommentID : comment.commentID;
    // Check if viewerID matches comment's UserID for edit button visibility
    const showEditButton = comment.viewerID === comment.userID;
    const likeIcon = comment.likeStatus ? 'fas fa-thumbs-up' : 'far fa-thumbs-up';
    commentElement.innerHTML =
            '<div class="comment-author">' + comment.user.given_name + " " + comment.user.family_name + '</div>' +
            '<div class="comment-text">' + repliedToUser + comment.commentText + '</div>' +
            '<div class="comment-date">Last modified: ' + formatLocalDateTime(comment.commentDate) + '</div>' +
            '<button class="reply-button" onclick="toggleReplyForm(' + comment.commentID + ')">Reply</button>' +
            '<button class="like-button" onclick="likeComment(' + comment.commentID + ')">' +
            '<i class="' + likeIcon + '"></i> <span id="like-count-' + comment.commentID + '">' + comment.likes + '</span></button>' +
            (showEditButton ? '<button class="edit-button" onclick="toggleEditForm(' + comment.commentID + ')">Edit</button>' : '') +
            '<div class="edit-form" id="edit-form-' + comment.commentID + '" style="display: none;">' +
            '<textarea rows="2">' + comment.commentText + '</textarea>' +
            '<button type="button" onclick="submitEdit(' + comment.commentID + ')">Save</button>' +
            '</div>' +
            '<div class="reply-form" id="reply-form-' + comment.commentID + '" style="display: none;">' +
            '<textarea rows="2" placeholder="Write a reply..."></textarea>' +
            '<button type="button" onclick="submitReply(' + topCmtID + ', ' + comment.userID + ', ' + comment.commentID + ')">Submit</button>' +
            '</div>'

    if (type == 0) {
        commentElement.innerHTML += '<div class="nested-comments" id="nested-comments-' + comment.commentID + '" style="display: none;">' +
                '<!-- Nested comments go here -->' +
                '</div>';
        if (comment.totalReplies > 0) {
            commentElement.innerHTML += '<button class="show-replies-button" onclick="toggleReplies(' + comment.commentID + ', ' + comment.totalReplies + ')">' + comment.totalReplies + ' Replies</button>';
        }

    }
    return commentElement;
}
function toggleEditForm(commentID) {
    const editForm = document.getElementById('edit-form-' + commentID);
    if (editForm.style.display === 'none') {
        editForm.style.display = 'block';
    } else {
        editForm.style.display = 'none';
    }
}
// Function to toggle display of replies for a comment
function toggleReplies(commentId, totalReplies) {
    var repliesSection = document.getElementById('nested-comments-' + commentId);
    var showRepliesButton = document.querySelector('#comment-' + commentId + ' .show-replies-button');
    if (repliesSection.style.display === 'none') {
        // Fetch and display replies
        fetchReplies(commentId);
        repliesSection.style.display = 'block';
        showRepliesButton.innerText = 'Hide'
    } else {
        repliesSection.style.display = 'none';
        showRepliesButton.innerText = totalReplies + ' Replies';
    }
}

// Function to fetch replies for a comment
function fetchReplies(commentId) {
    // Example API call to fetch replies for a specific commentId
    fetch('SectionComments?position=' + 0 + '&offset=' + 1000 + '&sectionID=' + sectionID + '&sortBy=' + sortBy + '&parentID=' + commentId)
            .then(function (response) {
                return response.json();
            })
            .then(function (data) {
                displayReplies(commentId, data);
            })
            .catch(function (error) {
                console.error('Error fetching replies for comment ' + commentId + ':', error);
            });
}

// Function to display fetched replies
function displayReplies(commentId, replies) {
    var nestedCommentsList = document.getElementById('nested-comments-' + commentId);
    nestedCommentsList.innerHTML = ''; // Clear existing replies
    replies.forEach(function (reply) {
        var newReply = createCommentElement(reply, 1); // Use same function for replies
        nestedCommentsList.appendChild(newReply);
    });
}

// Function to handle liking a comment
function likeComment(commentId) {
    fetch('SectionComments?commentID=' + commentId + "&mode=liking", {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json'
        }
    })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Failed to like comment: ' + response.status);
                }
                return response.json();
            })
            .then(data => {
                // Update the like icon and count
                const likeButton = document.querySelector('#comment-' + commentId + ' .like-button');
                if (data.liked) {
                    likeButton.innerHTML = '<i class="fas fa-thumbs-up"></i> <span id="like-count-' + commentId + '">' + data.totalLikes + '</span>';
                } else {
                    likeButton.innerHTML = '<i class="far fa-thumbs-up"></i> <span id="like-count-' + commentId + '">' + data.totalLikes + '</span>';
                }
            })
            .catch(error => console.error('Error liking comment:', error));
}

loadMoreComments();
function formatLocalDateTime(datetimeString) {
    // Parse the datetime string into a Date object
    let dateObj = new Date(datetimeString);

    // Define months array for converting month index to name
    let months = ['January', 'February', 'March', 'April', 'May', 'June',
        'July', 'August', 'September', 'October', 'November', 'December'];

    // Get components from the Date object
    let month = months[dateObj.getMonth()]; // Get month name
    let day = dateObj.getDate(); // Get day of the month
    let year = dateObj.getFullYear(); // Get full year
    let hours = dateObj.getHours(); // Get hours
    let minutes = dateObj.getMinutes(); // Get minutes

    // Format hours and minutes to display as 2 digits
    hours = hours < 10 ? '0' + hours : hours;
    minutes = minutes < 10 ? '0' + minutes : minutes;

    // Construct the formatted date string
    let formattedDateTime = month + ' ' + day + ', ' + year + ' at ' + hours + ':' + minutes;

    return formattedDateTime;
}