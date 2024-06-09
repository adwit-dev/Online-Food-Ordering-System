<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="navigation.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Analytics Dashboard</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- Add additional libraries if needed for advanced interaction -->
     <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: #f4f7f6;
            color: #333;
        }
        .container {
            width: 95%;
            margin: 20px auto;
        }
        h1 {
            text-align: center;
            margin-bottom: 40px;
        }
        h2 {
            margin-top: 20px;
            border-bottom: 1px solid #eee;
            padding-bottom: 5px;
        }
        canvas {
            background: #fff;
            border: 1px solid #ddd;
            box-shadow: 0px 0px 10px #aaa;
        }
        .chart-container {
            margin-bottom: 30px;
        }
        p.total-customers {
            text-align: center;
            font-size: 20px;
            background: #fff;
            border: 1px solid #ddd;
            padding: 10px;
            box-shadow: 0px 0px 10px #aaa;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Analytics Dashboard</h1>
        
        <div class="chart-container">
            <h2>Queries Analytics</h2>
            <canvas id="queriesChart"></canvas>
        </div>

        <div class="chart-container">
            <h2>Products by Providers</h2>
            <canvas id="productsChart"></canvas>
        </div>

        <div class="chart-container">
            <h2>User Purchases</h2>
            <canvas id="purchasesChart"></canvas>
        </div>

        <div class="chart-container">
            <h2>Total Users</h2>
            <p class="total-customers">Total number of users: <strong>${totalCustomers}</strong></p>
        </div>
    <script>
        // Queries Chart
        var queriesCtx = document.getElementById('queriesChart').getContext('2d');
        var queriesChart = new Chart(queriesCtx, {
            type: 'bar',
            data: {
                labels: [ 'Deleted','Answered'],
                datasets: [{
                    label: 'Count',
                    data: [${queryStats[0].count}, ${queryStats[1].count}], // Be sure to match the order of your statuses
                    backgroundColor: ['rgba(75, 192, 192, 0.2)', 'rgba(255, 99, 132, 0.2)']
                }]
            }
        });

        // Products Chart
        var productsCtx = document.getElementById('productsChart').getContext('2d');
        var providerLabels = [];
        var providerData = [];
        <c:forEach items="${productStats}" var="entry">
            providerLabels.push("${entry.provider_id}");
            providerData.push(${entry.count});
        </c:forEach>
        var productsChart = new Chart(productsCtx, {
            type: 'bar',
            data: {
                labels: providerLabels,
                datasets: [{
                    label: 'Number of Products',
                    data: providerData,
                    backgroundColor: 'rgba(54, 162, 235, 0.2)'
                }]
            }
        });

        // Purchases Chart
        var purchasesCtx = document.getElementById('purchasesChart').getContext('2d');
        var userLabels = [];
        var spentData = [];
        var quantityData = [];
        <c:forEach items="${purchaseStats}" var="entry">
            userLabels.push("${entry.user_id}");
            spentData.push(${entry.totalSpent});
            quantityData.push(${entry.totalQuantity});
        </c:forEach>
        var purchasesChart = new Chart(purchasesCtx, {
            type: 'bar',
            data: {
                labels: userLabels,
                datasets: [
                    {
                        label: 'Total Spent',
                        data: spentData,
                        backgroundColor: 'rgba(255, 206, 86, 0.2)'
                    },
                    {
                        label: 'Total Quantity',
                        data: quantityData,
                        backgroundColor: 'rgba(153, 102, 255, 0.2)'
                    }
                ]
            }
        });

        
    </script>
</body>
</html>
