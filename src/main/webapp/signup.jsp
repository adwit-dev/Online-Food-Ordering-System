<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            background: url('https://as1.ftcdn.net/v2/jpg/07/26/29/10/1000_F_726291073_LVfksob6mn3Iv9q4NY2X5xTmpCQ5vsbX.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #626567;
        }
        form {
            padding: 20px;
            border: 1px solid #ccc;
            background: rgba(255, 255, 255, 0.8);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
        }
        label {
            margin-top: 10px;
            display: block;
            font-size: 16px;
            color: #333;
        }
        input[type="text"], input[type="password"],input[type="email"],[type="tel"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box; /* ensures that padding and border are included in width */
        }
        input[type="radio"] {
            margin-right: 5px;
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            margin-top: 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
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
     <%-- <form action="/signup" method="post">
        <h1>Signup</h1>
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br>
        <label for="email">Email:</label>
<input type="email" id="email" name="email" required><br>

<label for="phone">Phone Number:</label>
<input type="tel" id="phone" name="phone" required pattern="[0-9]{10}" title="Ten digits code"><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>
        <label for="role">Role:</label> --%>
        <%-- <input type="radio" id="admin" name="role" value="admin" required> Admin --%>
        <%-- <input type="radio" id="serviceprovider" name="role" value="serviceprovider" required> Service Provider
        <input type="radio" id="customer" name="role" value="customer" required> Customer<br>
        <input type="submit" value="Signup"> --%>

        <form action="/signup" method="post" id="signupForm">
    <h1>Signup</h1>
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required minlength="3" maxlength="30"><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required minlength="6"><br>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br>

    <label for="phone">Phone Number:</label>
    <input type="tel" id="phone" name="phone" required pattern="[0-9]{10}" title="Enter a 10-digit phone number"><br>

    <label for="role">Role:</label>
    <input type="radio" id="serviceprovider" name="role" value="serviceprovider" required> Service Provider
    <input type="radio" id="customer" name="role" value="customer" required> Customer<br>

    <input type="submit" value="Signup">
</form>

<script>
    document.getElementById('signupForm').onsubmit = function() {
        // Example of additional JavaScript validation if necessary
        var phone = document.getElementById('phone').value;
        if (!/^\d{10}$/.test(phone)) {
            alert('Phone number must be 10 digits.');
            return false;
        }
        return true;
    };
</script>

    </form> 
    <footer>
        © 2024 BHOJ. All rights reserved.
    </footer>
</body>
</html>
