<html>
<head>
    <title>Order Success</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jersey+20+Charted&family=Pacifico&family=Shadows+Into+Light&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 20px;
            background: url('https://images.unsplash.com/photo-1495195129352-aeb325a55b65?q=80&w=1776&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') no-repeat center center fixed;
            background-size: cover;
            color: #333;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
        h1, p {
            font-family: "Shadows Into Light", cursive;
            font-weight: 400;
            font-style: normal;
        }
        h1 {
            color: #4CAF50;
            margin-bottom: 20px;
            font-size: 100px; /* Double the default size of approximately 32px */
        }
        p {
            font-size: 40px; /* Double the default size of approximately 16px */
            color: #555;
            max-width: 6000px;
        }
        footer {
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px 0;
        }
    </style>
</head>
<body>
<jsp:include page="navigation.jsp" />

    <h1>Order Placed Successfully!</h1>
    <p>Your order has been successfully placed. Thank you for shopping with us!</p>

<footer>
    © 2024 BHOJ. All rights reserved.
</footer>
</body>
</html>
