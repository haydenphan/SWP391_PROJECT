<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Course Completion Statistics</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    <style>
        select {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        canvas {
            width: 90% !important;
            height: auto !important;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 style="font-family: Lucida Console">Completed Course Statistics</h2>
        <select id="yearSelect" onchange="fetchStatistics()">
            <option value="" disabled>Select Year</option>
            <option value="2021">2021</option>
            <option value="2022">2022</option>
            <option value="2023">2023</option>
            <option selected value="2024">2024</option>
            <!-- Add more years as needed -->
        </select>
        <canvas id="course-completed"></canvas>
    </div>

    <script type="text/javascript">
        function fetchStatistics() {
            var year = document.getElementById("yearSelect").value;
            var contextPath = '<%= request.getContextPath()%>';
            fetch(contextPath + '/statistical?year=' + year + '&type=completion')
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok ' + response.statusText);
                    }
                    return response.json();
                })
                .then(data => {
                    console.log('Data fetched:', data);
                    var ctx = document.getElementById("course-completed").getContext("2d");
                    new Chart(ctx, {
                        type: "bar",
                        data: {
                            labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                            datasets: [{
                                label: "Course Completed",
                                data: data,
                                backgroundColor: "rgb(255, 76, 76, 0.2)",
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
