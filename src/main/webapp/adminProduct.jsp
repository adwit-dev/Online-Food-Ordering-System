<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin Product Management</title>
</head>
<body>
<jsp:include page="navigation.jsp" />
        Welcome, <% out.print(session.getAttribute("username")); %>

<h1>Admin Product Management</h1>
<table border="1">
    <tr>
        <th>Product ID</th>
        <th>Provider ID</th>
        <th>Name</th>
        <th>Description</th>
        <th>Price</th>
        <th>Image</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${products}" var="product">
        <tr>
            <td>${product.product_id}</td>
            <td>${product.provider_id}</td>
            <td>${product.name}</td>
            <td>${product.description}</td>
            <td>${product.price}</td>
            <td><img src="${product.image_url}" alt="Product Image" height="100"></td>
            <td>
                <form action="/deleteAdminProduct" method="post">
                    <input type="hidden" name="productId" value="${product.product_id}" />
                    <input type="submit" value="Delete" />
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
