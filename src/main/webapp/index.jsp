<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Our Store</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
            background: url('https://wallpapers.com/images/high/aesthetic-spices-of-indian-food-volb5o34o2ezem2k.webp') no-repeat center center fixed; /* Replace with your image URL */
            background-size: cover; /* Cover the entire page */
        }
        .container {
            min-height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: #ffffff; /* Ensure text is readable on potentially complex backgrounds */
         <%-- background: rgba(0, 0, 0, 0.5);  --%>
            padding: 20px;
            border-radius: 8px;
        }
        .footer {
            margin-top: auto;
            padding: 20px;
            background-color: #f0f0f0;
            width: 100%;
            text-align: center;
        }
        .road {
            position: absolute;
            width: 100%;
            bottom: 50px; /* Position just above the footer */
            overflow: hidden;
        }
        .delivery {
            position: relative;
            animation: slide 10s linear infinite;
            display: block;
            width: 350px;
            height: 200px;
        }
        @keyframes slide {
            0% { left: -350px; }
            100% { left: 100%; }
        }
        a {
            margin: 10px;
            text-decoration: none;
            color: #007bff;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to BHOJ !</h1>
        <c:if test="${not empty sessionScope.user}">
            <p>Welcome, ${sessionScope.user['username']}! You are logged as ${sessionScope.user['role']}</p>
            <div>
                <a href="/logout" class="btn btn-primary">Logout</a>
                <c:choose>
                    <c:when test="${sessionScope.user['role'] == 'admin'}">
                        <a href="/adminProduct" class="btn btn-secondary">Manage Products (Admin)</a>
                    </c:when>
                    <c:when test="${sessionScope.user['role'] == 'serviceprovider'}">
                        <a href="/serviceProduct" class="btn btn-secondary">Manage Your Products</a>
                    </c:when>
                    <c:when test="${sessionScope.user['role'] == 'customer'}">
                        <a href="/userProduct" class="btn btn-secondary">View Products</a>
                    </c:when>
                </c:choose>
            </div>
        </c:if>
        <c:if test="${empty sessionScope.user}">
            <div>
                <a href="/login" class="btn btn-success">Login</a>
                <a href="/signup" class="btn btn-info">Signup</a>
            </div>
        </c:if>
    </div>
    <div class="road">
        <img src="https://www.pinclipart.com/picdir/big/269-2697303_delivery-png-hd-clipart.png" alt="" class="delivery">
    </div>
    <div class="footer">
        <p>© 2024 BHOJ. All rights reserved.</p>
    </div>
</body>
</html>
