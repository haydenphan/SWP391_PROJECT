<%-- 
    Document   : statisticalCourseEnrolled
    Created on : Jul 2, 2024, 9:39:02 AM
    Author     : Thunguyet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course Enrolled Statistics</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f4f4f9;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                color: #333;
            }
            .container {
                background: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
                max-width: 70%;
                width: 100%;
                text-align: center;
            }
            h3 {
                margin-bottom: 20px;
                font-family: Garamond;
            }
            select {
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                margin-bottom: 20px;
            }
            canvas {
                width: 100% !important;
                height: auto !important;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2 style="font-family: Lucida Console">Enrolled Course Statistic</h2>
            <select id="yearSelect" onchange="fetchStatistics()">
                <option value="" disabled selected>Select Year</option>
                <option value="2021">2021</option>
                <option value="2022">2022</option>
                <option value="2023">2023</option>
                <option value="2024">2024</option>
                
                <!-- Add more years as needed -->
            </select>
            <canvas id="course-enrolled"></canvas>
        </div>

        <script type="text/javascript">
            function fetchStatistics() {
                var year = document.getElementById("yearSelect").value;
                var contextPath = '<%= request.getContextPath() %>';
                fetch(contextPath + '/statistical?year=' + year + '&type=enrollment')
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Network response was not ok ' + response.statusText);
                            }
                            return response.json();
                        })
                        .then(data => {
                            console.log('Data fetched:', data);
                            var ctx = document.getElementById("course-enrolled").getContext("2d");
                            new Chart(ctx, {
                                type: "line",
                                data: {
                                    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                                    datasets: [{
                                            label: "Course Enrolled",
                                            data: data,
                                            backgroundColor: "rgb(214, 239, 216, 0.2)",
                                            borderColor: "rgb(83, 131, 146)",
                                            borderWidth: 1
                                        }]
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

            // Fetch statistics for the default selected year on page load
            window.onload = fetchStatistics;
        </script>
    </body>
</html>
