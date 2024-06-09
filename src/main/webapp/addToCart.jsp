<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Your Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background: url('https://images.unsplash.com/photo-1495195129352-aeb325a55b65?q=80&w=1776&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') no-repeat center center fixed;
            background-size: cover;
        }
        .cart-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        .cart-item {
            background: white;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .cart-item img {
            width: 100%;
            height: auto;
            border-radius: 5px;
        }
        .cart-footer {
            text-align: center;
            margin-top: 20px;
        }
        footer {
            text-align: center;
            padding: 10px 0;
            background-color: #333;
            color: white;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<jsp:include page="navigation.jsp" />

<h1>Your Cart</h1>
<c:if test="${empty cartProducts}">
    <p>Your cart is empty.</p>
</c:if>
<c:if test="${not empty cartProducts}">
    <div class="cart-grid">

        <c:forEach items="${cartProducts}" var="product">
    <div class="cart-item">
        <img src="${product.image_url}" alt="Product Image">
        <div><strong>Name:</strong> ${product.name}</div>
        <div><strong>Price:</strong> ${product.price}</div>
        <div><strong>Quantity:</strong> ${product.quantity}</div>
        <form action="/addtocart" method="post">
            <input type="hidden" name="productId" value="${product.product_id}">
            <input type="submit" value="Add One More">
        </form>
        <form action="/removeFromCart" method="post">
            <input type="hidden" name="productId" value="${product.product_id}">
            <input type="hidden" name="all" value="false">
            <input type="submit" value="Remove One">
        </form>
        <form action="/removeFromCart" method="post">
            <input type="hidden" name="productId" value="${product.product_id}">
            <input type="hidden" name="all" value="true">
            <input type="submit" value="Remove All">
        </form>
    </div>
</c:forEach>

    </div>
    <div class="cart-footer">
        <form action="/proceedToCheckout" method="get">
            <input type="submit" value="Continue to Checkout">
        </form>
    </div>
</c:if>
<footer>
    © 2024 BHOJ. All rights reserved.
</footer>
</body>
</html>
        <%-- <c:forEach items="${cartProducts}" var="product">
            <div class="cart-item">
                <img src="${product.image_url}" alt="Product Image">
                <div><strong>Name:</strong> ${product.name}</div>
                <div><strong>Price:</strong> ${product.price}</div>
                <form action="/removeFromCart" method="post">
                    <input type="hidden" name="productId" value="${product.product_id}">
                    <input type="submit" value="Remove">
                </form>
            </div>
        </c:forEach> --%>