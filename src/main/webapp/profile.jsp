<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navigation.jsp" %>
<html>
<head>
    <title>Profile</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    form {
        background: #f4f4f4;
        padding: 20px;
        width: 80%;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        margin-bottom: 20px;
    }
    form label {
        display: block;
        margin-bottom: 10px;
    }
    input[type="text"], input[type="password"] {
        width: 100%;
        padding: 8px;
        margin-top: 5px;
    }
    input[type="submit"] {
        padding: 10px 20px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #0056b3;
    }
    .products-grid {
        width: 80%;
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
        gap: 15px;
    }
    .product-item {
        background: #ffffff;
        padding: 10px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
</style>

</head>
<body>

<h1>User Profile</h1>
<form action="/updateProfile" method="post">
    <label>User ID: <input type="text" name="user_id" value="${profile.user_id}" readonly="readonly"/></label><br/>
    <label>Username: <input type="text" name="username" value="${profile.username}"/></label><br/>
    <label>Password: <input type="password" name="password" value="${profile.password}"/></label><br/>
    <label>Role: <input type="text" name="role" value="${profile.role}" readonly="readonly"/></label><br/>
    <label>Status: <input type="text" name="status" value="${profile.status}"/></label><br/>
    <label>Image URL: <input type="text" name="image_url" value="${profile.image_url}"/></label><br/>
    <input type="submit" value="Update Profile"/>
</form>

<c:if test="${profile.role == 'serviceprovider'}">
    <h2>Products Posted</h2>
    <ul>
        <c:forEach items="${products}" var="product">
            <li>${product.name} - ${product.description}</li>
        </c:forEach>
    </ul>
</c:if>

<c:if test="${profile.role == 'customer'}">
    <h2>Products Bought</h2>
    <ul>
        <c:forEach items="${purchases}" var="purchase">
            <li>${purchase.product_name} - Quantity: ${purchase.quantity} - Purchased on: ${purchase.purchase_date}</li>
        </c:forEach>
    </ul>
</c:if>

</body>
</html>
