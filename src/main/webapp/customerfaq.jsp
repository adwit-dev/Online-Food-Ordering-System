
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="navigation.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer FAQ</title>
    <style>
    body {
        font-family: Arial, sans-serif; /* Sets the font for the body */
         /* URL to the background image */  
        background-size: cover; /* Ensures the background covers the entire body */
        background-position: center; /* Centers the background image */
        margin: 40px; /* Adds margin around the content */
    }
    h2 {
        color: #333; /* Dark grey color for headings */
    }
    form {
        background-color: #ffffff; /* White background for the form */
        padding: 20px; /* Padding inside the form */
        border-radius: 8px; /* Rounded corners for the form */
        box-shadow: 0 0 10px rgba(0,0,0,0.1); /* Subtle shadow around the form */
    }
    #mapContainer {
        margin: 20px 0; /* Adds vertical space around the map */
        box-shadow: 0 0 10px rgba(0,0,0,0.1); /* Shadow to match the form */
        border-radius: 8px; /* Rounded corners */
        overflow: hidden; /* Ensures no overflowing content */
    }
    iframe {
        width: 100%; /* Ensures the iframe takes the full width of its container */
        height: 450px; /* Fixed height */
        border: none; /* No border for cleaner integration */
    }
    label, textarea, input {
        display: block; /* Makes each form element block level */
        width: 90%; /* Form elements take up 90% of their container */
        margin: auto; /* Centers the form elements */
    }
    textarea {
        margin-bottom: 10px; /* Adds space below the textarea */
    }
    input[type="submit"] {
        background-color: #4CAF50; /* Green background color for the submit button */
        color: white; /* White text color for the button */
        padding: 10px 20px; /* Padding inside the button */
        border: none; /* Removes the border from the button */
        border-radius: 4px; /* Rounded corners for the button */
        cursor: pointer; /* Pointer cursor on hover */
    }
    input[type="submit"]:hover {
        background-color: #45a049; /* Darker green background on hover */
    }
</style>

</head>
<body>
    <h2>Ask a Question</h2>
    <form action="submitQuestion" method="post">
        <label for="query">Your Question:</label><br>
        <textarea name="query" id="query" rows="4" cols="50"></textarea><br><br>
        <input type="submit" value="Submit">
    </form>

    <!-- Map container -->
    <div id="mapContainer">
        <iframe title="Location Map" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d29967.650910267697!2d85.638211!3d20.135868!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a190a23ce977ca7%3A0xeedfaa0fde47443f!2sSKILL%20DEVELOPMENT%20INSTITUTE%20(SDI)%2C%20BHUBANESWAR!5e0!3m2!1sen!2sin!4v1713423400161!5m2!1sen!2sin" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>

</body>
</html>
