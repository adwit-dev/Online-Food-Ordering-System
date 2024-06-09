<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="navigation.jsp" %>

<html>
<head>
    <title>Your Orders</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            padding: 20px;
        }
        h1 {
            color: #2c3e50;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #3498db;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
    <h1>Your Orders</h1>
    <table>
        <thead>
            <tr>
                <th>Purchase ID</th>
                <th>User ID</th>
                <th>Product ID</th>
                <th>Quantity</th>
                <th>Purchase Date</th>
                <th>Address</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="purchase" items="${purchases}">
                <tr>
                    <td>${purchase.purchase_id}</td>
                    <td>${purchase.user_id}</td>
                    <td>${purchase.product_id}</td>
                    <td>${purchase.quantity}</td>
                    <td>${purchase.purchase_date}</td>
                    <td>${purchase.address}</td>
                    <td>${purchase.status}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
