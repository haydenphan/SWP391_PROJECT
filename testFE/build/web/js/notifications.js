function toggleNotificationPopup() {
    const popup = document.getElementById('notificationPopup');
    popup.classList.toggle('show');
    if (popup.classList.contains('show')) {
        fetchNotifications(14);
    }
}

function toggleLoadAll() {
    fetchNotifications(56);
    document.getElementById('load-all').style.display = 'none';
}

function fetchNotifications(daysAgo) {
    fetch('notifications?daysAgo=' + daysAgo)
            .then(response => response.json())
            .then(data => {
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
            });
}
function timeAgo(timestamp) {
    var now = new Date();
    var secondsPast = (now.getTime() - new Date(timestamp).getTime()) / 1000;

    if (secondsPast < 60) {
        return 'just now';
    }
    if (secondsPast < 3600) {
        var minutes = Math.floor(secondsPast / 60);
        return minutes + ' minute' + (minutes > 1 ? 's' : '') + ' ago';
    }
    if (secondsPast < 86400) {
        var hours = Math.floor(secondsPast / 3600);
        return hours + ' hour' + (hours > 1 ? 's' : '') + ' ago';
    }
    if (secondsPast < 2592000) { // 30 days
        var days = Math.floor(secondsPast / 86400);
        return days + ' day' + (days > 1 ? 's' : '') + ' ago';
    }
    if (secondsPast < 31536000) { // 365 days
        var months = Math.floor(secondsPast / 2592000);
        return months + ' month' + (months > 1 ? 's' : '') + ' ago';
    }
    var years = Math.floor(secondsPast / 31536000);
    return years + ' year' + (years > 1 ? 's' : '') + ' ago';
}
function handleNotificationClick(notification) {
    // Build the URL dynamically based on the notification's target and targetId
    let url = '';
    switch (notification.target) {
        case 'Message':
            url = "CourseDetail?id="+notification.targetId;
            break;
        case 'purchaseHistory':
            url = 'purchaseHistory.jsp';
            break;
        case 'comments':
            url = `comments.jsp?postId=${notification.targetId}`;
            break;
        case 'approveCourses':
            url = 'approveCourses.jsp';
            break;
            // Add more cases as needed
        default:
            console.error('Unknown notification target:', notification.target);
            return;
    }

    // Navigate to the URL
    window.location.href = url;

    // Optionally mark the notification as read by sending a request to the server
//    fetch(`markAsRead?notificationId=${notification.id}`, {method: 'POST'})
//            .then(response => response.json())
//            .then(data => {
//                if (data.success) {
//                    // Optionally, update the UI to reflect the read status
//                    console.log('Notification marked as read');
//                } else {
//                    console.error('Failed to mark notification as read');
//                }
//            });
}



