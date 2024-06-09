<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Manage Products</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 20px;
            background: url('https://media.istockphoto.com/id/1304762850/vector/bright-green-textured-frame-background.jpg?s=612x612&w=0&k=20&c=-BFH8_Ac74Iubu0tyIctw3D-HEbfVo65TCHjSGQTaFw=') no-repeat center center fixed;
            background-size: cover;
            color: #333;
            position: relative;
            min-height: 100vh;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
        }
        .product-item {
            background: #fff;
            border: 1px solid #ccc;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }
        img {
            width: 100%; /* Adjusts image size to fit the container */
            height: auto;
            border-radius: 5px;
        }
        .delivery {
            height: 150px; /* set the height of the delivery truck */
            width: auto; /* maintain aspect ratio */
            animation: moveTruck 10s linear infinite;
            position: absolute;
            bottom: 80px; /* position just above the footer */
        }
        @keyframes moveTruck {
            from {
                left: -100px; /* Start off-screen */
            }
            to {
                left: 100%; /* Move across the screen */
            }
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
        form {
            margin-top: 10px;
        }
        input[type="text"], input[type="submit"], textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border-radius: 4px;
        }
        textarea {
            height: 100px; /* Increased textarea height for better input visibility */
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<jsp:include page="navigation.jsp" />

<div class="container">
    <h1>Product Management</h1>
    <c:if test="${sessionScope.user['role'] == 'serviceprovider'}">
        <h2>Add a New Product</h2>
        <form action="/addProduct" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><br>
            <label for="description">Description:</label>
            <textarea id="description" name="description" required></textarea><br>
            <label for="price">Price:</label>
            <input type="text" id="price" name="price" required><br>
            <label for="image_url">Image URL:</label>
            <input type="text" id="image_url" name="image_url" required><br>
            <input type="submit" value="Add Product">
        </form>
    </c:if>
</div>

<h2>Product List</h2>
<div class="products-grid">
    <c:forEach items="${products}" var="product">
        <div class="product-item">
            <img src="${product.image_url}" alt="Product Image">
            <div><strong>Name:</strong> ${product.name}</div>
            <div><strong>Description:</strong> ${product.description}</div>
            <div><strong>Price:</strong> ${product.price}</div>
            <c:if test="${sessionScope.user['role'] == 'serviceprovider'}">
                <form action="/deleteProduct" method="post">
                    <input type="hidden" name="productId" value="${product.product_id}">
                    <input type="submit" value="Delete">
                </form>
            </c:if>
        </div>
    </c:forEach>
</div>
<div class="road">
    <img src="https://www.pinclipart.com/picdir/big/269-2697303_delivery-png-hd-clipart.png" alt="" class="delivery">
</div>
<footer>
    © 2024 Your Company. All rights reserved.
</footer>
</body>
</html> --%>




<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Manage Products</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 20px;
            background: url('https://media.istockphoto.com/id/1304762850/vector/bright-green-textured-frame-background.jpg?s=612x612&w=0&k=20&c=-BFH8_Ac74Iubu0tyIctw3D-HEbfVo65TCHjSGQTaFw=') no-repeat center center fixed;
            background-size: cover;
            color: #333;
            position: relative;
            min-height: 100vh;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin: 20px auto; /* Centering the container */
            width: 90%; /* Resizing the container */
            max-width: 1200px; /* Max width for larger screens */
        }
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 20px; /* Additional space above the product grid */
        }
        .product-item {
            display: flex;
            flex-direction: column;
            justify-content: space-between; /* Ensures spacing is maintained from top to bottom */
            background: #fff;
            border: 1px solid #ccc;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }
        img {
            width: 100%;
            height: auto;
            border-radius: 5px;
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
        form {
            margin-top: 10px;
        }
        input[type="text"], input[type="submit"], textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border-radius: 4px;
        }
        textarea {
            height: 100px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<jsp:include page="navigation.jsp" />

<div class="container">
    <h1>Product Management</h1>
    <c:if test="${sessionScope.user['role'] == 'serviceprovider'}">
        <h2>Add a New Product</h2>
        <form action="/addProduct" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><br>
            <label for="description">Description:</label>
            <textarea id="description" name="description" required></textarea><br>
            <label for="price">Price:</label>
            <input type="text" id="price" name="price" required><br>
            <label for="image_url">Image URL:</label>
            <input type="text" id="image_url" name="image_url" required><br>
            <input type="submit" value="Add Product">
        </form>
    </c:if>
</div>

<h2>Product List</h2>
<div class="products-grid">
    <c:forEach items="${products}" var="product">
        <div class="product-item">
            <img src="${product.image_url}" alt="Product Image">
            <div><strong>Name:</strong> ${product.name}</div>
            <div><strong>Description:</strong> ${product.description}</div>
            <div><strong>Price:</strong> ${product.price}</div>
            <c:if test="${sessionScope.user['role'] == 'serviceprovider'}">
                <form action="/deleteProduct" method="post">
                    <input type="hidden" name="productId" value="${product.product_id}">
                    <input type="submit" value="Delete" style="margin-top: auto;"> <!-- Ensures button sticks to the bottom -->
                </form>
            </c:if>
        </div>
    </c:forEach>
</div>

<footer>
    © 2024 BHOJ. All rights reserved.
</footer>
</body>
</html>
