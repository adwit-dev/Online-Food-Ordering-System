<%-- <%@ page import="java.time.LocalDateTime" %>
<html>
<head>
    <title>Admin Analytics Dashboard</title>
    <!-- Include your CSS and JavaScript libraries here -->
    <!-- For example, you can include Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Include Chart.js for charts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
    <style>
        /* Custom CSS styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        .container {
            max-width: 960px;
            margin: 0 auto;
            padding: 20px;
        }

        h1, h2 {
            color: #343a40;
        }

        .card {
            background-color: #fff;
            border: 1px solid rgba(0, 0, 0, 0.125);
            border-radius: 0.25rem;
            padding: 20px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <h1 class="text-center">Analytics Dashboard</h1>
    <!-- Display current time, can be updated using JavaScript to keep current -->
    <p class="text-center">Current Time: ${currentTime}</p>

    <!-- Display analytics data -->
    <div class="row">
        <div class="col-md-6">
            <h2>User Statistics</h2>
            <p>Total Users: ${totalUsers}</p>
            <p>User Growth Rate: ${growthRate}%</p>
        </div>
        <div class="col-md-6">
            <h2>Service Providers</h2>
            <p>Total Service Providers: ${totalServiceProviders}</p>
        </div>
    </div>

    <div class="row mt-5">
        <div class="col-md-6">
            <h2>Product Statistics</h2>
            <p>Total Products: ${totalProducts}</p>
        </div>
    </div>

    <!-- Graphical representations -->
    <div class="row mt-5">
        <div class="col-md-6">
            <h2>Most Selling Products</h2>
            <canvas id="mostSellingProductChart" width="400" height="200"></canvas>
        </div>
        <div class="col-md-6">
            <h2>Least Selling Products</h2>
            <canvas id="leastSellingProductChart" width="400" height="200"></canvas>
        </div>
    </div>
</div>

<!-- Include your JavaScript to render the charts using the model attributes -->
<script>
    // Data for charts
    var mostSellingProducts = ${mostSellingProducts};
    var leastSellingProducts = ${leastSellingProducts};

    // Render Most Selling Product Chart
    var ctxMostSelling = document.getElementById('mostSellingProductChart').getContext('2d');
    var mostSellingProductChart = new Chart(ctxMostSelling, {
        type: 'bar',
        data: {
            labels: mostSellingProducts.map(product => product.name),
            datasets: [{
                label: 'Quantity Sold',
                data: mostSellingProducts.map(product => product.quantitySold),
                backgroundColor: 'rgba(255, 99, 132, 0.2)',
                borderColor: 'rgba(255, 99, 132, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    // Render Least Selling Product Chart
    var ctxLeastSelling = document.getElementById('leastSellingProductChart').getContext('2d');
    var leastSellingProductChart = new Chart(ctxLeastSelling, {
        type: 'bar',
        data: {
            labels: leastSellingProducts.map(product => product.name),
            datasets: [{
                label: 'Quantity Sold',
                data: leastSellingProducts.map(product => product.quantitySold),
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>

</body>
</html> --%>




<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sales Analytics Dashboard</title>
    <style>
        /* CSS styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .header {
            background-color: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
        }
        .clock {
            font-size: 24px;
            margin-bottom: 20px;
        }
        .calculator {
            width: 200px;
            margin-bottom: 20px;
        }
        .notepad {
            width: 300px;
            height: 200px;
            margin-bottom: 20px;
            resize: none;
            border: 1px solid #ccc;
            padding: 10px;
            font-size: 14px;
        }
        .notepad-controls, .calculator-controls {
            text-align: center;
        }
        .notepad-controls button, .calculator-controls button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }
        .notepad-controls button:hover, .calculator-controls button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Sales Analytics Dashboard</h1>
    </div>
    <div class="container">
        <div class="clock">
            <strong>Current Time:</strong> <span id="clock"></span>
        </div>
        <input type="text" class="calculator" id="calc-display" readonly placeholder="Calculator">
        <div class="calculator-controls">
            <button onclick="appendToDisplay('1')">1</button>
            <button onclick="appendToDisplay('2')">2</button>
            <button onclick="appendToDisplay('3')">3</button>
            <button onclick="appendToDisplay('+')">+</button><br>
            <button onclick="appendToDisplay('4')">4</button>
            <button onclick="appendToDisplay('5')">5</button>
            <button onclick="appendToDisplay('6')">6</button>
            <button onclick="appendToDisplay('-')">-</button><br>
            <button onclick="appendToDisplay('7')">7</button>
            <button onclick="appendToDisplay('8')">8</button>
            <button onclick="appendToDisplay('9')">9</button>
            <button onclick="appendToDisplay('*')">*</button><br>
            <button onclick="appendToDisplay('0')">0</button>
            <button onclick="appendToDisplay('.')">.</button>
            <button onclick="clearDisplay()">C</button>
            <button onclick="calculateResult()">=</button><br>
        </div>
        <textarea class="notepad" id="notepad" placeholder="Notepad"></textarea>
        <div class="notepad-controls">
            <button onclick="clearNotepad()">Clear</button>
            <button onclick="saveNotepad()">Save</button>
        </div>
        <div class="data-chart">
            <!-- Data visualization charts will be displayed here -->
        </div>
    </div>

    <script>
        // JavaScript for clock
        function updateTime() {
            var now = new Date();
            var hours = now.getHours();
            var minutes = now.getMinutes();
            var seconds = now.getSeconds();
            document.getElementById('clock').innerText = hours + ':' + minutes + ':' + seconds;
        }
        updateTime();
        setInterval(updateTime, 1000); // Update time every second

        // JavaScript for calculator
        function appendToDisplay(value) {
            document.getElementById('calc-display').value += value;
        }

        function clearDisplay() {
            document.getElementById('calc-display').value = '';
        }

        function calculateResult() {
            var expression = document.getElementById('calc-display').value;
            try {
                var result = eval(expression);
                document.getElementById('calc-display').value = result;
            } catch (error) {
                alert('Invalid expression');
            }
        }

        // JavaScript for notepad
        function clearNotepad() {
            document.getElementById('notepad').value = '';
        }

        function saveNotepad() {
            var content = document.getElementById('notepad').value;
            // You can send the content to the backend for saving or perform any other action here
            alert('Content saved:\n' + content);
        }
    </script>
</body>
</html> --%>







<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sales Analytics Dashboard</title>
    <style>
        /* CSS styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #333;
            color: #fff;
            padding: 10px 20px;
            font-family: 'Courier New', Courier, monospace;
        }
        .header * {
            font-size: 0.8em;
        }
        .clock {
            margin: 0;
            font-size: 18px;
            color: #ff0;
            font-weight: bold;
        }
        .tools {
            display: flex;
            align-items: center;
        }
        .calculator, .notepad {
            margin-right: 10px;
            font-size: 0.8em;
        }
        .notepad {
            height: 100px;
            width: 150px;
        }
        .calculator {
            width: 120px;
        }
        .notepad-controls button, .calculator-controls button {
            font-size: 0.7em;
            margin: 2px;
        }
        .data-chart {
            margin-top: 20px;
        }
        /* Add additional styles as needed */
    </style>
</head>
<body>
    <div class="header">
        <div class="tools">
            <input type="text" class="calculator" id="calc-display" readonly placeholder="Calc">
            <textarea class="notepad" id="notepad" placeholder="Note"></textarea>
        </div>
        <div class="clock" id="clock"></div>
    </div>
    <div class="container">
        <div class="clock">
            <strong>Current Time:</strong> <span id="clock"></span>
        </div>
        <input type="text" class="calculator" id="calc-display" readonly placeholder="Calculator">
        <div class="calculator-controls">
            <button onclick="appendToDisplay('1')">1</button>
            <button onclick="appendToDisplay('2')">2</button>
            <button onclick="appendToDisplay('3')">3</button>
            <button onclick="appendToDisplay('+')">+</button><br>
            <button onclick="appendToDisplay('4')">4</button>
            <button onclick="appendToDisplay('5')">5</button>
            <button onclick="appendToDisplay('6')">6</button>
            <button onclick="appendToDisplay('-')">-</button><br>
            <button onclick="appendToDisplay('7')">7</button>
            <button onclick="appendToDisplay('8')">8</button>
            <button onclick="appendToDisplay('9')">9</button>
            <button onclick="appendToDisplay('*')">*</button><br>
            <button onclick="appendToDisplay('0')">0</button>
            <button onclick="appendToDisplay('.')">.</button>
            <button onclick="clearDisplay()">C</button>
            <button onclick="calculateResult()">=</button><br>
        </div>
        <textarea class="notepad" id="notepad" placeholder="Notepad"></textarea>
        <div class="notepad-controls">
            <button onclick="clearNotepad()">Clear</button>
            <button onclick="saveNotepad()">Save</button>
        </div>
        <div class="data-chart">
            <!-- Data visualization charts will be displayed here -->
        </div>
    </div>

    <script>
        // JavaScript code remains the same
        // JavaScript for clock
        function updateTime() {
            var now = new Date();
            var hours = now.getHours();
            var minutes = now.getMinutes();
            var seconds = now.getSeconds();
            document.getElementById('clock').innerText = hours + ':' + minutes + ':' + seconds;
        }
        updateTime();
        setInterval(updateTime, 1000); // Update time every second

        // JavaScript for calculator
        function appendToDisplay(value) {
            document.getElementById('calc-display').value += value;
        }

        function clearDisplay() {
            document.getElementById('calc-display').value = '';
        }

        function calculateResult() {
            var expression = document.getElementById('calc-display').value;
            try {
                var result = eval(expression);
                document.getElementById('calc-display').value = result;
            } catch (error) {
                alert('Invalid expression');
            }
        }

        // JavaScript for notepad
        function clearNotepad() {
            document.getElementById('notepad').value = '';
        }

        function saveNotepad() {
            var content = document.getElementById('notepad').value;
            // You can send the content to the backend for saving or perform any other action here
            alert('Content saved:\n' + content);
        }
    </script>
</body>
</html> --%>






