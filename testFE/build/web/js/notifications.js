function toggleNotificationPopup() {
    const popup = document.getElementById('notificationPopup');
    popup.classList.toggle('show');
    if (popup.classList.contains('show')) {
        console.log('Fetching notifications...');
        fetchNotifications(14);
    }
}

function toggleLoadAll() {
    console.log('Fetching all notifications...');
    fetchNotifications(56);
    document.getElementById('load-all').style.display = 'none';
}

function fetchNotifications(daysAgo) {
    fetch('notifications?daysAgo=' + daysAgo)
            .then(response => response.json())
            .then(data => {
                console.log('Fetched notifications:', data);
                const popup = document.getElementById('notification-list');
                popup.innerHTML = '';
                data.forEach(notification => {
                    const item = document.createElement('div');
                    item.className = 'notification-item';
                    item.addEventListener('click', () => handleNotificationClick(notification));

                    const icon = document.createElement('i');
                    icon.className = 'notification-icon fa ' + (notification.type === 'success' ? 'fa-check-circle' : notification.type === 'failure' ? 'fa-times-circle' : 'fa-info-circle');

                    const text = document.createElement('div');
                    text.className = 'notification-text';
                    text.textContent = notification.message;

                    const time = document.createElement('div');
                    time.className = 'notification-time';
                    time.textContent = timeAgo(notification.timeStamp);

                    item.appendChild(icon);
                    item.appendChild(text);
                    item.appendChild(time);

                    popup.appendChild(item);
                });
            })
            .catch(error => {
                console.error('Error fetching notifications:', error);
            });
}

function timeAgo(timestamp) {
    const now = new Date();
    const secondsPast = (now.getTime() - new Date(timestamp).getTime()) / 1000;

    if (secondsPast < 60) {
        return 'just now';
    }
    if (secondsPast < 3600) {
        const minutes = Math.floor(secondsPast / 60);
        return minutes + ' minute' + (minutes > 1 ? 's' : '') + ' ago';
    }
    if (secondsPast < 86400) {
        const hours = Math.floor(secondsPast / 3600);
        return hours + ' hour' + (hours > 1 ? 's' : '') + ' ago';
    }
    if (secondsPast < 2592000) { // 30 days
        const days = Math.floor(secondsPast / 86400);
        return days + ' day' + (days > 1 ? 's' : '') + ' ago';
    }
    if (secondsPast < 31536000) { // 365 days
        const months = Math.floor(secondsPast / 2592000);
        return months + ' month' + (months > 1 ? 's' : '') + ' ago';
    }
    const years = Math.floor(secondsPast / 31536000);
    return years + ' year' + (years > 1 ? 's' : '') + ' ago';
}

function handleNotificationClick(notification) {
    console.log('Notification clicked:', notification);
    let url = '';
    let confirmationRequired = false;

    switch (notification.target) {
        case 'Course':
            url = "CourseDetail?id=" + notification.targetId;
            break;
        case 'Message':
            url = "message.jsp?id=" + notification.targetId;
            break;
        case 'PurchaseHistory':
            url = 'purchaseHistory.jsp';
            break;
        case 'Comments':
            url = `comments.jsp?postId=${notification.targetId}`;
            break;
        case 'ApproveCourses':
            url = 'approveCourses.jsp';
            break;
        case 'CompletedCourse':
            url = `user-profile`;
            break;
        case 'EditCourseRequest':
            url = `CourseDetail?id=${notification.targetId}`;
            confirmationRequired = true;
            break;
        case 'CoursePublicationRequest':
            url = 'pending-course-list';
            break;
        case 'PaymentSuccessful':
            url = 'user-profile';
            break;
        case 'CourseRejected':
            url = `course-approval-servlet/request?courseId=${notification.targetId}&instructorId=${notification.userId}`;
            confirmationRequired = true;
            break;
        default:
            console.error('Unknown notification target:', notification.target);
            return;
    }

    if (confirmationRequired) {
        localStorage.setItem('showEditCourseRequestAlert', 'true');
    }

    window.location.href = url;

    // Optionally mark the notification as read by sending a request to the server
    fetch(`markAsRead?notificationId=${notification.id}`, {method: 'POST'})
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    console.log('Notification marked as read');
                } else {
                    console.error('Failed to mark notification as read');
                }
            });
}
