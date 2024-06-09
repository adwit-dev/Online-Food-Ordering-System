<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: url('https://as1.ftcdn.net/v2/jpg/05/81/45/70/1000_F_581457057_KFPLtjfGuAzYBC0WeQJBWgJdrqX0kLb0.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Arial', sans-serif;
        }
        form {
            padding: 20px;
            border: 1px solid #ccc;
            background: rgba(255, 255, 255, 0.8);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
            border-radius: 8px;
            width: 300px;
            top: -50px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        label {
            margin-top: 10px;
            display: block;
            color: #666;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            margin-top: 20px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .footer {
            width: 100%;
            padding: 10px 0;
            background-color: rgba(255, 255, 255, 0.8);
            text-align: center;
            position: absolute;
            bottom: 0;
            left: 0;
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
    <form action="/login" method="post">
        <h1>Login</h1>
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        <input type="submit" value="Login">
    </form>
    <div class="road">
        <img src="https://www.pinclipart.com/picdir/big/269-2697303_delivery-png-hd-clipart.png" alt="" class="delivery">
    </div>
    <div class="footer">
        © 2024 BHOJ. All rights reserved.
    </div>
</body>
</html>

