<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>View Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- CSS styles are embedded here -->
    <style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .profile-container {
        width: 80%;
        background: #f0f0f0;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        margin-bottom: 20px;
    }
    .grid-container {
        width: 80%;
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
        gap: 10px;
        padding: 10px;
    }
    .grid-item {
        background: #fff;
        padding: 10px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .profile-image {
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
    }
    img {
        width: 100px; /* Adjust size as needed */
        height: 100px; /* Adjust to maintain aspect ratio */
        object-fit: cover; /* Ensures the image covers the space without distortion */
    }
    /* Button 29 styles */
    .button-29 {
      align-items: center;
      appearance: none;
      background-image: radial-gradient(100% 100% at 100% 0, #5adaff 0, #5468ff 100%);
      border: 0;
      border-radius: 6px;
      box-shadow: rgba(45, 35, 66, .4) 0 2px 4px,rgba(45, 35, 66, .3) 0 7px 13px -3px,rgba(58, 65, 111, .5) 0 -3px 0 inset;
      box-sizing: border-box;
      color: #fff;
      cursor: pointer;
      display: inline-flex;
      font-family: "JetBrains Mono", monospace;
      height: 48px;
      justify-content: center;
      line-height: 1;
      overflow: hidden;
      padding-left: 16px;
      padding-right: 16px;
      position: relative;
      text-align: left;
      text-decoration: none;
      transition: box-shadow .15s, transform .15s;
      user-select: none;
      -webkit-user-select: none;
      touch-action: manipulation;
      white-space: nowrap;
      will-change: box-shadow, transform;
      font-size: 18px;
    }
    .button-29:focus {
      box-shadow: #3c4fe0 0 0 0 1.5px inset, rgba(45, 35, 66, .4) 0 2px 4px, rgba(45, 35, 66, .3) 0 7px 13px -3px, #3c4fe0 0 -3px 0 inset;
    }
    .button-29:hover {
      box-shadow: rgba(45, 35, 66, .4) 0 4px 8px, rgba(45, 35, 66, .3) 0 7px 13px -3px, #3c4fe0 0 -3px 0 inset;
      transform: translateY(-2px);
    }
    .button-29:active {
      box-shadow: #3c4fe0 0 3px 7px inset;
      transform: translateY(2px);
    }
</style>
</head>
<body>
<jsp:include page="navigation.jsp" />

<div class="profile-image">
    <img src="${profile.image_url}" alt="Profile Image"/>
</div>

<%-- <div class="profile-container">
    <h1>Profile Details</h1>
    <p><strong>User ID:</strong> ${profile.user_id}</p>
    <p><strong>Username:</strong> ${profile.username}</p>
    <!-- Displaying passwords in real applications is a security risk -->
    <p><strong>Role:</strong> ${profile.role}</p>
    <p><strong>Status:</strong> ${profile.status}</p>
    <!-- Add button for editing the profile -->
    <button class="button-29" role="button" onclick="location.href='/profile';">Edit Profile</button>
</div> --%>

<div class="profile-container">
    <h1>Profile Details</h1>
    <p><strong>User ID:</strong> ${profile.user_id}</p>
    <p><strong>Username:</strong> ${profile.username}</p>
    <p><strong>Role:</strong> ${profile.role}</p>
    <p><strong>Status:</strong> ${profile.status}</p>
    <p><strong>Email:</strong> ${profile.email}</p>
    <p><strong>Phone:</strong> ${profile.phone}</p>
    <button class="button-29" role="button" onclick="location.href='/profile';">Edit Profile</button>
</div>


<c:if test="${profile.role == 'serviceprovider'}">
    <h2>Products Posted</h2>
    <div class="grid-container">
        <c:forEach items="${products}" var="product">
            <div class="grid-item">
                <p>${product.name}</p>
                <p>${product.description}</p>
            </div>
        </c:forEach>
    </div>
</c:if>

<c:if test="${profile.role == 'customer'}">
    <h2>Products Bought</h2>
    <div class="grid-container">
        <c:forEach items="${purchases}" var="purchase">
            <div class="grid-item">
                <p>${purchase.product_name}</p>
                <p>Quantity: ${purchase.quantity}</p>
                <p>Purchased on: ${purchase.purchase_date}</p>
            </div>
        </c:forEach>
    </div>
</c:if>

</body>
</html>
