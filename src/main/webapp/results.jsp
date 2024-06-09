<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Results</title>
</head>
<body>
    <h1>Results</h1>
    <p>Your score is: ${score}</p>
    <c:if test="${not empty rewardCode}">
        <p>Congratulations! Your reward code is: ${rewardCode}</p>
    </c:if>
    <a href="/">Try Again</a>
</body>
</html> --%>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Results</title>
    <style>
        body {
            font-family: Arial, sans-serif; /* Provides a clean, sans-serif font */
            background-color: #f4f4f9; /* Light grey background for soft appearance */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Full viewport height */
        }
        .container {
            background-color: white;
            padding: 20px 40px;
            border-radius: 8px; /* Rounded corners */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
            text-align: center;
        }
        h1 {
            color: #333; /* Dark grey color for text */
        }
        p {
            color: #666; /* Medium grey color makes text less harsh */
            margin: 10px 0 20px; /* Spacing for paragraph elements */
        }
        a {
            color: #0061a8; /* A strong blue for links */
            text-decoration: none; /* Removes underline from links */
            font-weight: bold;
        }
        a:hover {
            text-decoration: underline; /* Underline on hover for better interaction */
        }
    </style>
</head>
<body>
<jsp:include page="navigation.jsp" />

    <div class="container">
        <h1>Results</h1>
        <p>Your score is: ${score}</p>
        <c:if test="${not empty rewardCode}">
            <p>Congratulations! Your reward code is: ${rewardCode}</p>
        </c:if>
        <a href="/">Try Again</a>
    </div>
</body>
</html>
