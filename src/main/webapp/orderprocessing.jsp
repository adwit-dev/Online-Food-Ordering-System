
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navigation.jsp" %>

<html>
<head>
    <title>Order Processing</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 20px;
        }
        h1 {
            color: #333;
        }
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        input[type="submit"] {
            padding: 5px 10px;
            color: white;
            border: none;
            cursor: pointer;
            margin-right: 5px;
        }
        form {
            display: inline;
        }
        .accept-btn {
            background-color: #4CAF50; /* Green */
        }
        .decline-btn {
            background-color: #f44336; /* Red */
        }
    </style>
</head>
<body>
    <h1>Order Processing</h1>
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
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="order" items="${orders}">
                <tr>
                    <td>${order.purchase_id}</td>
                    <td>${order.user_id}</td>
                    <td>${order.product_id}</td>
                    <td>${order.quantity}</td>
                    <td>${order.purchase_date}</td>
                    <td>${order.address}</td>
                    <td>${order.status}</td>
                    <td>
                        <form action="orders/accept" method="post">
                            <input type="hidden" name="purchase_id" value="${order.purchase_id}" />
                            <input type="submit" value="Accept" class="accept-btn" />
                        </form>
                        <form action="orders/decline" method="post">
                            <input type="hidden" name="purchase_id" value="${order.purchase_id}" />
                            <input type="submit" value="Decline" class="decline-btn" />
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
