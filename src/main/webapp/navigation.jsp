<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">
            <img src="3.png" alt="Your Brand Logo" style="height: 40px;">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <c:if test="${empty sessionScope.user}">
                    <li class="nav-item"><a class="nav-link" href="/login">Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="/signup">Signup</a></li>
                </c:if>
                <c:if test="${not empty sessionScope.user}">
                    <li class="nav-item"><a class="nav-link" href="/"><i class="fa-solid fa-house"></i> Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="/logout"><i class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
                    <c:choose>
                        <c:when test="${sessionScope.user['role'] == 'admin'}">
                            <li class="nav-item"><a class="nav-link" href="/adminProduct">Admin Product Management</a></li>
                            <li class="nav-item"><a class="nav-link" href="/admindashboard">Admin Dashboard</a></li>
                            <li class="nav-item"><a class="nav-link" href="/adminfaq">Admin faq</a></li>
                            <li class="nav-item"><a class="nav-link" href="/allUsers">All Users</a></li>
                            <li class="nav-item"><a class="nav-link" href="/profile">Profile</a></li>
                            <li class="nav-item"><a class="nav-link" href="/viewProfile">View Profile</a></li>
                            <li class="nav-item"><a class="nav-link" href="/admin">edit about us</a></li>
                        </c:when>
                        <c:when test="${sessionScope.user['role'] == 'serviceprovider'}">
                            <li class="nav-item"><a class="nav-link" href="/serviceProduct">Manage Products</a></li>
                            <li class="nav-item"><a class="nav-link" href="/servicedashboard">Service Dashboard</a></li>
                            <li class="nav-item"><a class="nav-link" href="/profile">Profile</a></li>
                            <li class="nav-item"><a class="nav-link" href="/viewProfile">View Profile</a></li>
                        </c:when>
                        <c:when test="${sessionScope.user['role'] == 'customer'}">
                            <li class="nav-item"><a class="nav-link" href="/userProduct"><i class="fa-solid fa-burger"></i> View Products</a></li>
                            <li class="nav-item">
                                <a class="nav-link" href="/cart">
                                    <i class="fa-solid fa-cart-shopping"></i>
                                    <span class="badge bg-secondary">${fn:length(sessionScope.cart)}</span>
                                    View Cart
                                </a>
                            </li>
                            <li class="nav-item"><a class="nav-link" href="/proceedToCheckout"><i class="fa-solid fa-cash-register"></i> Checkout</a></li>
                            <li class="nav-item"><a class="nav-link" href="/customerdashboard">Customer Dashboard</a></li>
                            <li class="nav-item"><a class="nav-link" href="/customerfaq"><i class="fa-solid fa-clipboard-question"></i> Customer Query</a></li>
                            <li class="nav-item"><a class="nav-link" href="/faq"><i class="fa-solid fa-comment"></i> FAQ</a></li>
                            <li class="nav-item"><a class="nav-link" href="/profile"><i class="fa-solid fa-address-card"></i> Profile</a></li>
                            <li class="nav-item"><a class="nav-link" href="/viewProfile"><i class="fa-solid fa-id-card-clip"></i> View Profile</a></li>
                            <li class="nav-item"><a class="nav-link" href="/about"><i style="font-size:24px" class="fa">&#xf0c0;</i> about us</a></li>
                        </c:when>
                    </c:choose>
                </c:if>
            </ul>
        </div>
    </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script> --%>









<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">

<style>
    /* Ensure the navbar is fixed at the top of the viewport */
    .navbar {
        position: fixed;
        width: 100%;
        z-index: 1050; /* Higher than the default z-index of the navbar to ensure it's on top of other content */
        top: 0;
        left: 0;
    }

    /* Add padding to the body to prevent content from being hidden behind the navbar */
    body {
        padding-top: 80px; /* Adjust based on the actual height of your navbar */
    }
</style>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">
            <img src="3.png" alt="Your Brand Logo" style="height: 40px;">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <c:if test="${empty sessionScope.user}">
                    <li class="nav-item"><a class="nav-link" href="/login">Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="/signup">Signup</a></li>
                </c:if>
                <c:if test="${not empty sessionScope.user}">
                    <li class="nav-item"><a class="nav-link" href="/"><i class="fa-solid fa-house"></i> Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="/logout"><i class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
                    <c:choose>
                        <c:when test="${sessionScope.user['role'] == 'admin'}">
                            <li class="nav-item"><a class="nav-link" href="/adminProduct">Admin Product Management</a></li>
                            <li class="nav-item"><a class="nav-link" href="/adminfaq">Admin faq</a></li>
                            <li class="nav-item"><a class="nav-link" href="/allUsers">All Users</a></li>
                            <li class="nav-item"><a class="nav-link" href="/profile">Profile</a></li>
                            <li class="nav-item"><a class="nav-link" href="/viewProfile">View Profile</a></li>
                            <li class="nav-item"><a class="nav-link" href="/admin">edit about us</a></li>
                        </c:when>
                        <c:when test="${sessionScope.user['role'] == 'serviceprovider'}">
                            <li class="nav-item"><a class="nav-link" href="/serviceProduct">Manage Products</a></li>
                            <li class="nav-item"><a class="nav-link" href="/profile">Profile</a></li>
                            <li class="nav-item"><a class="nav-link" href="/viewProfile">View Profile</a></li>
                        </c:when>
                        <c:when test="${sessionScope.user['role'] == 'customer'}">
                            <li class="nav-item"><a class="nav-link" href="/userProduct"><i class="fa-solid fa-burger"></i> View Products</a></li>
                            <li class="nav-item">
                                <a class="nav-link" href="/cart">
                                    <i class="fa-solid fa-cart-shopping"></i>
                                    <span class="badge bg-secondary">${fn:length(sessionScope.cart)}</span>
                                    View Cart
                                </a>
                            </li>
                            <li class="nav-item"><a class="nav-link" href="/proceedToCheckout"><i class="fa-solid fa-cash-register"></i> Checkout</a></li>
                            <li class="nav-item"><a class="nav-link" href="/customerfaq"><i class="fa-solid fa-clipboard-question"></i> Customer Query</a></li>
                            <li class="nav-item"><a class="nav-link" href="/faq"><i class="fa-solid fa-comment"></i> FAQ</a></li>
                            <li class="nav-item"><a class="nav-link" href="/profile"><i class="fa-solid fa-address-card"></i> Profile</a></li>
                            <li class="nav-item"><a class="nav-link" href="/viewProfile"><i class="fa-solid fa-id-card-clip"></i> View Profile</a></li>
                            <li class="nav-item"><a class="nav-link" href="/about"><i style="font-size:24px" class="fa">&#xf0c0;</i> about us</a></li>
                        </c:when>
                    </c:choose>
                </c:if>
            </ul>
        </div>
    </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script> --%>







<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- Bootstrap CSS and Font Awesome for styling -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">

<style>
    /* Fix the navbar at the top and ensure it does not overlap page content */
    .navbar {
        position: fixed;
        width: 100%;
        z-index: 1050;
        top: 0;
        left: 0;
    }

    /* Adjust body padding to avoid content being hidden behind the navbar */
    body {
        padding-top: 80px;
        background-image: url('4.png'); /* Set a default background */
        background-size: cover; /* Ensure it covers the whole body */
    }
</style>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">
            <img src="3.png" alt="Your Brand Logo" style="height: 40px;">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <!-- Dropdown for changing background image -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Change Background
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item" href="#" onclick="changeBackground('5.png')">Background 1</a></li>
                        <li><a class="dropdown-item" href="#" onclick="changeBackground('6.png')">Background 2</a></li>
                        <li><a class="dropdown-item" href="#" onclick="changeBackground('7.png')">Background 3</a></li>
                    </ul>
                </li>
                <!-- Authentication and user-specific links -->
                <c:if test="${empty sessionScope.user}">
                    <li class="nav-item"><a class="nav-link" href="/login">Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="/signup">Signup</a></li>
                </c:if>
                <c:if test="${not empty sessionScope.user}">
                    <li class="nav-item"><a class="nav-link" href="/"><i class="fa-solid fa-house"></i> Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="/logout"><i class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
                    <c:choose>
                        <c:when test="${sessionScope.user['role'] == 'admin'}">
                            <li class="nav-item"><a class="nav-link" href="/adminProduct"><i class="fa-solid fa-list-check"></i>Admin Product Management</a></li>
                            <li class="nav-item"><a class="nav-link" href="/adminfaq"><i class="fa-solid fa-comment"></i>Admin faq</a></li>
                            <li class="nav-item"><a class="nav-link" href="/analytics"><i class="fa-solid fa-chart-simple"></i> web analitics</a></li>
                            <li class="nav-item"><a class="nav-link" href="/allUsers"><i class="fa-solid fa-users"></i>All Users</a></li>
                            <li class="nav-item"><a class="nav-link" href="/viewProfile"><i class="fa-solid fa-id-card-clip"></i>View Profile</a></li>
                        <li class="nav-item"><a class="nav-link" href="/about"><i class="fa-solid fa-info"></i> about us</a></li>
                        
                        </c:when>
                        <c:when test="${sessionScope.user['role'] == 'serviceprovider'}">
                            <li class="nav-item"><a class="nav-link" href="/serviceProduct"><i class="fa-solid fa-list-check"></i>Manage Products</a></li>
                            
                        
                        <li class="nav-item"><a class="nav-link" href="/orders"><i class="fa-solid fa-diagram-project"></i> order Processing</a></li>
                        <li class="nav-item"><a class="nav-link" href="/admin"><i class="fa-brands fa-quinscape"></i> quiz add question</a></li>
                       
                        <li class="nav-item"><a class="nav-link" href="/viewProfile"><i class="fa-solid fa-id-card-clip"></i>View Profile</a></li>
                        <li class="nav-item"><a class="nav-link" href="/about"><i class="fa-solid fa-info"></i> about us</a></li>

                        </c:when>
                        <c:when test="${sessionScope.user['role'] == 'customer'}">
                            <li class="nav-item"><a class="nav-link" href="/userProduct"><i class="fa-solid fa-burger"></i> View Products</a></li>
                            <li class="nav-item">
                                <a class="nav-link" href="/cart">
                                    <i class="fa-solid fa-cart-shopping"></i>
                                    <span class="badge bg-secondary">${fn:length(sessionScope.cart)}</span>
                                    View Cart
                                </a>
                            </li>
                            <li class="nav-item"><a class="nav-link" href="/proceedToCheckout"><i class="fa-solid fa-cash-register"></i> Checkout</a></li>
                            <li class="nav-item"><a class="nav-link" href="/customerfaq"><i class="fa-solid fa-clipboard-question"></i> Customer Query</a></li>
                            <li class="nav-item"><a class="nav-link" href="/faq"><i class="fa-solid fa-comment"></i> FAQ</a></li>
                            
                            <li class="nav-item"><a class="nav-link" href="/customerorders"><i class="fa-solid fa-cart-arrow-down"></i>my order status</a></li>


                            <li class="nav-item"><a class="nav-link" href="/questions"><i class="fa-solid fa-cart-arrow-down"></i>food quiz</a></li>
<li class="nav-item"><a class="nav-link" href="/viewProfile"><i class="fa-solid fa-id-card-clip"></i> View Profile</a></li>
                            <li class="nav-item"><a class="nav-link" href="/about"><i class="fa-solid fa-info"></i> about us</a></li>
                        </c:when>
                    </c:choose>
                </c:if>
            </ul>
        </div>
    </div>
</nav>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // JavaScript function to change the background image
    function changeBackground(imageFile) {
        document.body.style.backgroundImage = 'url("' + imageFile + '")';
    }
</script> 












