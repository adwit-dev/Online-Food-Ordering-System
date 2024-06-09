 <%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Proceed to Checkout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background: url('https://images.unsplash.com/photo-1495195129352-aeb325a55b65?q=80&w=1776&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') no-repeat center center fixed;
            background-size: cover;
            color: #333;
        }
        table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
        }
        th, td {
            text-align: left;
            padding: 8px;
            border: 1px solid #ddd;
            background: #fff;
        }
        img {
            width: 100px; /* Fixed width, adjust if needed */
            height: auto;
        }
        p {
            font-size: 18px;
            margin-top: 20px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
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
    </style>
</head>
<body>
<jsp:include page="navigation.jsp" />

<h1>Checkout</h1>
<table>
    <tr>
        <th>Name</th>
        <th>Price</th>
        <th>Image</th>
    </tr>
    <c:forEach items="${cartProducts}" var="product">
        <tr>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td><img src="${product.image_url}" alt="Product Image"></td>
        </tr>
    </c:forEach>
</table>
<p>Total: ${total}</p>
<form action="/checkout" method="post">
    <input type="submit" value="Confirm Purchase">
</form>
<footer>
    © 2024 Your Company. All rights reserved.
</footer>
</body>
</html>

 --%>



<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Proceed to Checkout</title>
    <style>
        /* Existing styles remain unchanged */

 body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background: url('https://images.unsplash.com/photo-1495195129352-aeb325a55b65?q=80&w=1776&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') no-repeat center center fixed;
            background-size: cover;
            color: #333;
        }
        table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
        }
        th, td {
            text-align: left;
            padding: 8px;
            border: 1px solid #ddd;
            background: #fff;
        }
        img {
            width: 100px; /* Fixed width, adjust if needed */
            height: auto;
        }
        p {
            font-size: 18px;
            margin-top: 20px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
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
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA7BeDpQFFk1MXUOKx-FZsah6TCH4raq_g&callback=initMap&libraries=&v=weekly" async></script>
    <script>
        function getLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition, showError);
            } else { 
                alert("Geolocation is not supported by this browser.");
            }
        }

        function showPosition(position) {
            var lat = position.coords.latitude;
            var lon = position.coords.longitude;
            var latlng = new google.maps.LatLng(lat, lon);
            var geocoder = new google.maps.Geocoder();
            
            geocoder.geocode({'latLng': latlng}, function(results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    if (results[0]) {
                        document.getElementById('yourAddress').value = results[0].formatted_address;
                    } else {
                        alert('No results found');
                    }
                } else {
                    alert('Geocoder failed due to: ' + status);
                }
            });
        }

        function showError(error) {
            switch(error.code) {
                case error.PERMISSION_DENIED:
                    alert("User denied the request for Geolocation.");
                    break;
                case error.POSITION_UNAVAILABLE:
                    alert("Location information is unavailable.");
                    break;
                case error.TIMEOUT:
                    alert("The request to get user location timed out.");
                    break;
                case error.UNKNOWN_ERROR:
                    alert("An unknown error occurred.");
                    break;
            }
        }
    </script>
</head>
<body onload="getLocation();">
    <jsp:include page="navigation.jsp" />
    <h1>Checkout</h1>
    <!-- Existing table and total calculation -->
<table>
    <tr>
        <th>Name</th>
        <th>Price</th>
        <th>Image</th>
    </tr>
    <c:forEach items="${cartProducts}" var="product">
        <tr>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td><img src="${product.image_url}" alt="Product Image"></td>
        </tr>
    </c:forEach>
</table>
    <form action="/checkout" method="post">
        <label for="yourAddress">Your Address:</label>
        <input type="text" id="yourAddress" name="address">
        <input type="submit" value="Confirm Purchase">
    </form>
    <footer>
        © 2024 Your Company. All rights reserved.
    </footer>
</body>
</html> --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Proceed to Checkout</title>
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background: url('https://images.unsplash.com/photo-1495195129352-aeb325a55b65?q=80&w=1776&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90oy1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') no-repeat center center fixed;
            background-size: cover;
            color: #333;
        }
        table, #mapid {
            width: 100%;
            margin-bottom: 20px;
        }
        #mapid { height: 250px; }
        th, td {
            text-align: left;
            padding: 8px;
            border: 1px solid #ddd;
            background: #fff;
        }
        img {
            width: 100px; 
            height: auto;
        }
        p {
            font-size: 18px;
            margin-top: 20px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
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
    </style>
    <script>
        function getLocation() {
            var map = L.map('mapid').setView([0, 0], 1); // Default view

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                maxZoom: 19,
                attribution: '© OpenStreetMap'
            }).addTo(map);

            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position) {
                    var latlng = [position.coords.latitude, position.coords.longitude];
                    map.setView(latlng, 13); // Zoom to user location
                    L.marker(latlng).addTo(map)
                        .bindPopup('You are here').openPopup();

                    // Reverse Geocoding
                    fetch(`https://nominatim.openstreetmap.org/reverse?format=json&lat=${position.coords.latitude}&lon=${position.coords.longitude}`)
                        .then(response => response.json())
                        .then(data => {
                            console.log(data);
                            document.getElementById('yourAddress').value = data.display_name;
                        })
                        .catch(error => console.error('Error fetching address:', error));
                }, function(error) {
                    console.error('Geolocation error:', error);
                });
            } else {
                alert("Geolocation is not supported by this browser.");
            }
        }

    </script>
</head>
<body onload="getLocation();">
    <jsp:include page="navigation.jsp" />
    <h1>Checkout</h1>
    <div id="mapid"></div>
    <table>
        <tr>
            <th>Name</th>
            <th>Price</th>
            <th>Image</th>
        </tr>
        <c:forEach items="${cartProducts}" var="product">
            <tr>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td><img src="${product.image_url}" alt="Product Image"></td>
            </tr>
        </c:forEach>
    </table>

<form id="rewardCodeForm">
        <label for="rewardCode">Reward Code:</label>
        <input type="text" id="rewardCode" name="rewardCode">
        <input type="button" value="Apply" onclick="applyRewardCode()">
    </form>

 <p id="total">Total: ${total}</p>    
    <%-- <p>Total: ${total}</p> --%>
    <form action="/checkout" method="post">
        <label for="yourAddress">Your Address:</label>
        <input type="text" id="yourAddress" name="address">
      
        <input type="submit" value="Confirm Purchase">
    </form>

    <footer>
        © 2024 BHOJ. All rights reserved.
    </footer>


    <script>
        function applyRewardCode() {
            var rewardCode = document.getElementById('rewardCode').value;
            fetch('/applyRewardCode', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                    // Add this to pass CSRF token if you have CSRF protection enabled
                    'X-CSRF-TOKEN': /* the CSRF token */
                },
                body: 'rewardCode=' + encodeURIComponent(rewardCode)
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Reward code application failed.');
                }
                return response.text();
            })
            .then(discountedTotal => {
                document.getElementById('total').textContent = 'Total: ' + discountedTotal;
                alert('Discount applied!');
            })
            .catch(error => {
                console.error('Error:', error);
                alert(error.message);
            });
        }

        // To prevent the actual submission of the form when the Apply button is clicked
        document.getElementById('rewardCodeForm').addEventListener('submit', function(event) {
            event.preventDefault();
            applyRewardCode();
        });
    </script>
</body>
</html>

