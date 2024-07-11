<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transaction Statistics</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
        <style>
/*            body {
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
            }*/
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
            <h2 style="font-family: Lucida Console">Revenue Statistic</h2>

            <select id="yearSelect" onchange="fetchStatistics()">
                <option value="" disabled>Select Year</option>
                <option value="2021">2021</option>
                <option value="2022">2022</option>
                <option value="2023">2023</option>
                <option selected value="2024">2024</option>

                <!-- Add more years as needed -->
            </select>
            <canvas id="sale-revenue"></canvas>
        </div>

        <script type="text/javascript">
            function fetchStatistics() {
                var year = document.getElementById("yearSelect").value;
                var contextPath = '<%= request.getContextPath()%>';
                fetch(contextPath + '/statistical?year=' + year + '&type=revenue')
                        .then(response => {
                            if (!response.ok) {
                                throw new Error('Network response was not ok ' + response.statusText);
                            }
                            return response.json();
                        })
                        .then(data => {
                            console.log('Data fetched:', data);
                            var ctx = document.getElementById("sale-revenue").getContext("2d");
                            new Chart(ctx, {
                                type: "line",
                                data: {
                                    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                                    datasets: [{
                                            label: "Revenue",
                                            data: data,
                                            backgroundColor: "rgba(187, 233, 255, 0.2)",
                                            borderColor: "rgb(83, 131, 146)",
                                            borderWidth: 1
                                        }]
                                },
                                options: {
                                    responsive: true,
                                    scales: {
                                        yAxes: [{
                                                ticks: {
                                                    beginAtZero: true,
                                                    callback: function (value, index, values) {
                                                        return '$' + value; // Add $ symbol to the y-axis ticks
                                                    }
                                                }
                                            }]
                                    },
                                    tooltips: {
                                        callbacks: {
                                            label: function (tooltipItem, data) {
                                                return '$' + tooltipItem.yLabel; // Add $ symbol to the tooltip
                                            }
                                        }
                                    },
                                    plugins: {
                                        afterDraw: function (chart) {
                                            var ctx = chart.chart.ctx;
                                            ctx.save();
                                            ctx.font = "12px Arial";
                                            ctx.fillStyle = "rgb(83, 131, 146)";
                                            ctx.textAlign = "center";
                                            ctx.fillText("$", chart.chartArea.left - 20, chart.chartArea.top + 10); // Adjust the position as needed
                                            ctx.restore();
                                        }
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