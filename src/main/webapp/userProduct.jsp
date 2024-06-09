<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navigation.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Products</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jersey+20+Charted&family=Pacifico&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background: url('https://media.istockphoto.com/id/928002022/vector/cooking-collection-background-salt-pepper-spices-asparagus-mixed-dish-bowl-knife-cut.jpg?s=2048x2048&w=is&k=20&c=eq0PUJKX_gamIj4ZJG2iA3udHRiyA-ywAKi7eFzRpys=') no-repeat center center fixed;
            background-size: cover;
            color: #333;
        }
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            padding: 0;
        }
        .product-item {
            background: white;
            border: 1px solid #ccc;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }
        .product-item img {
            width: 100%;
            height: auto;
            border-radius: 5px;
        }
        .product-name, .product-description, .product-price {
            margin: 10px 0;
        }
        .add-to-cart {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .add-to-cart:hover {
            background-color: #0056b3;
        }
        footer {
            text-align: center;
            padding: 20px 0;
            background-color: #333;
            color: white;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        h1 {
  font-family: "Pacifico", cursive;
  font-weight: 400;
  font-style: normal;
}

    

    </style>
</head>
<body>
<h1>Products Available</h1>
<div class="products-grid">
    <c:forEach items="${products}" var="product">
        <div class="product-item">
            <img src="${product.image_url}" alt="Product Image">
            <div class="product-name">${product.name}</div>
            <div class="product-description">${product.description}</div>
            <div class="product-price">${product.price}</div>
            <form action="/addToCart" method="post">
                <input type="hidden" name="productId" value="${product.product_id}">
                <input type="submit" value="Add to Cart" class="add-to-cart">
            </form>
        </div>
    </c:forEach>
</div>
<footer>
    © 2024 Your Company. All rights reserved.
</footer>
</body>
</html> --%>




 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navigation.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Products</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jersey+20+Charted&family=Pacifico&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background: url('https://images.unsplash.com/photo-1495195129352-aeb325a55b65?q=80&w=1776&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') no-repeat center center fixed;
            background-size: cover;
            color: #333;
        }
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            padding: 0;
        }
        .product-item {
            display: flex;
            flex-direction: column;
            justify-content: space-between; /* Ensures that the add to cart button stays at the bottom */
            background: white;
            border: 1px solid #ccc;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
            height: 100%; /* Ensure full height */
        }
        .product-item img {
            width: 100%;
            height: auto;
            border-radius: 5px;
        }
        .product-name, .product-description, .product-price {
            margin: 10px 0;
        }
        .add-to-cart {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .add-to-cart:hover {
            background-color: #0056b3;
        }
        footer {
            text-align: center;
            padding: 20px 0;
            background-color: #333;
            color: white;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        h1 {
            font-family: "Pacifico", cursive;
            font-weight: 400;
            font-style: normal;
        }

        .product-item img {
    width: 100%; /* Ensures the image takes up all available width */
    height: 200px; /* Fixed height for all images */
    object-fit: cover; /* Ensures the image covers the area without distorting aspect ratio */
    border-radius: 5px;

}
 
.review-item {
    background: #f0f0f0;
    margin: 5px 0;
    padding: 5px;
    border-radius: 3px;
}



    </style>
</head>
<body>
<h1>Products Available</h1>
</br>

<form id="filterForm">
    <input type="text" id="searchKeyword" placeholder="Search products..." onkeyup="filterProducts()">
    <input type="number" id="minPrice" placeholder="Min price" onchange="filterProducts()">
    <input type="number" id="maxPrice" placeholder="Max price" onchange="filterProducts()">
</form>
<div class="products-grid" id="productsGrid">
    <c:forEach items="${products}" var="product">
        <div class="product-item" data-price="${product.price}" data-name="${product.name.toLowerCase()}">
            <img src="${product.image_url}" alt="Product Image">
            <div class="product-name">${product.name}</div>
            <div class="product-description">${product.description}</div>
            <div class="product-price">${product.price}</div>
            






            


        
            <form action="/addToCart" method="post">
                <input type="hidden" name="productId" value="${product.product_id}">
                <input type="submit" value="Add to Cart" class="add-to-cart">
            </form>

<div class="product-reviews">
    <c:choose>
        <c:when test="${not empty product.reviews}">
            <c:forEach var="review" items="${fn:split(product.reviews, '; ')}">
                <div class="review-item">${fn:escapeXml(review)}</div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <div>No reviews yet.</div>
        </c:otherwise>
    </c:choose>
</div>

<form action="/submitReview" method="post">
    <input type="hidden" name="productId" value="${product.product_id}">
    <textarea name="reviewText" required placeholder="Enter your review here..."></textarea>
    <input type="number" name="rating" required min="1" max="5" placeholder="Rating (1-5)">
    <input type="submit" value="Submit Review" class="add-to-cart">
</form>
        </div>
    </c:forEach>
</div>
</br>
</br>
</br>
<footer>
    © 2024 BHOJ. All rights reserved.
</footer>

<script>
function filterProducts() {
    var searchKeyword = document.getElementById('searchKeyword').value.toLowerCase();
    var minPrice = parseFloat(document.getElementById('minPrice').value);
    var maxPrice = parseFloat(document.getElementById('maxPrice').value);
    var products = document.querySelectorAll('.product-item');

    products.forEach(function(product) {
        var price = parseFloat(product.getAttribute('data-price'));
        var name = product.getAttribute('data-name');
        var matchesSearch = name.includes(searchKeyword);
        var matchesPrice = (!isNaN(minPrice) ? price >= minPrice : true) && 
                           (!isNaN(maxPrice) ? price <= maxPrice : true);

        if (matchesSearch && matchesPrice) {
            product.style.display = '';
        } else {
            product.style.display = 'none';
        }
    });
}
</script>

</body>
</html> 
 








