<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.*" %>
<%@ page import="DAO.*" %>
<%
    User user = (User) session.getAttribute("user");
    int instructorId = 0;
    if (user != null) {
        instructorId = user.getUserID();
    } else {
        System.out.println("User is not logged in");
    }
    System.out.println("Instructor ID: " + instructorId);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instructor Income Statistics</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
        <style>
            select {
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                margin-bottom: 20px;
            }
            .chart-container {
                width: 80%;
                margin: 0 auto;
                text-align: center;
            }
            canvas {
                width: 100% !important;
                height: auto !important;
            }
            .container{
                width: 80%;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2 style="font-family: Lucida Console; text-align: center;">Instructor Income Statistics</h2>
            <div style="text-align: center;">
                <select id="yearSelect" onchange="fetchStatistics()">
                    <option value="" disabled>Select Year</option>
                    <option value="2021">2021</option>
                    <option value="2022">2022</option>
                    <option value="2023">2023</option>
                    <option selected value="2024">2024</option>
                </select>
                <select id="courseSelect" onchange="fetchStatistics()">
                    <option value="" disabled selected>Select Course</option>
                </select>
            </div>
            <div class="chart-container">
                <canvas id="instructor-income"></canvas>
            </div>
        </div>

        <script type="text/javascript">
        const instructorId = '<%= instructorId %>';

        function fetchCourses() {
            var contextPath = '<%= request.getContextPath() %>';

            if (!instructorId || instructorId.trim() === "" || instructorId === "0") {
                console.error('Instructor ID is missing or invalid');
                return;
            }

            fetch(contextPath + '/courses?instructorId=' + instructorId)
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok ' + response.statusText);
                        }
                        return response.json();
                    })
                    .then(courses => {
                        console.log('Courses fetched:', courses);
                        if (!Array.isArray(courses)) {
                            throw new Error('Expected an array of courses');
                        }
                        var courseSelect = document.getElementById("courseSelect");
                        courseSelect.innerHTML = '<option value="" disabled selected>Select Course</option>';
                        courses.forEach(course => {
                            var option = document.createElement("option");
                            option.value = course.CourseID;
                            option.text = course.CourseName || 'Unnamed Course'; // Thêm giá trị dự phòng nếu courseName bị undefined
                            courseSelect.appendChild(option);
                        });
                    })
                    .catch(error => console.error('Error fetching courses:', error));
        }

        function fetchStatistics() {
            var year = document.getElementById("yearSelect").value;
            var courseSelect = document.getElementById("courseSelect");
            var courseId = courseSelect.options[courseSelect.selectedIndex].value;
            var contextPath = '<%= request.getContextPath() %>';

            if (!instructorId || instructorId.trim() === "" || !courseId || courseId.trim() === "" || courseId === "undefined") {
                console.error('Instructor ID or Course ID is missing or invalid');
                return;
            }

            fetch(contextPath + '/statistical?year=' + year + '&type=income&courseId=' + courseId + '&instructorId=' + instructorId)
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Network response was not ok ' + response.statusText);
                        }
                        return response.json();
                    })
                    .then(data => {
                        var ctx = document.getElementById("instructor-income").getContext("2d");
                        var labels = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
                        var datasets = [{
                                label: `Course ${courseId}`,
                                data: data,
                                backgroundColor: "rgb(23, 107, 135, 0.3)",
                                borderColor: "rgba(75, 192, 192, 1)",
                                borderWidth: 1
                            }];

                        new Chart(ctx, {
                            type: "bar",
                            data: {
                                labels: labels,
                                datasets: datasets
                            },
                            options: {
                                responsive: true,
                                scales: {
                                    yAxes: [{
                                            ticks: {
                                                beginAtZero: true
                                            }
                                        }]
                                }
                            }
                        });
                    })
                    .catch(error => console.error('Error fetching data:', error));
        }

        window.onload = fetchCourses;
        </script>
    </body>
</html>
