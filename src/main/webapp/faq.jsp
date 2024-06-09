<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="navigation.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FAQ</title>
    <style>
        body {
            font-family: Arial, sans-serif; /* Standard web font */
            background-color: #f4f4f4; /* Light grey background for soft appearance */
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center; /* Centers the FAQ header */
            color: #333; /* Darker text color for contrast */
        }
        .accordion {
            background-color: #eee;
            color: #444;
            cursor: pointer;
            padding: 18px;
            width: 100%;
            border: none;
            text-align: left;
            outline: none;
            font-size: 15px;
            transition: 0.4s; /* Smooth transition for expanding/collapsing */
        }

        .active, .accordion:hover {
            background-color: #ccc; /* Slightly darker shade on hover/active */
        }

        .panel {
            padding: 0 18px;
            display: none; /* Initially hidden */
            background-color: white;
            overflow: hidden;
            transition: max-height 0.2s ease-out; /* Transition for the collapsible panel */
        }
    </style>
</head>
<body>
    <h2>FAQs</h2>
    <%@ include file="fetchFaqs.jsp" %>
    <script>
        var acc = document.getElementsByClassName("accordion");
        var current_index = null


        for (let i = 0; i < acc.length; i++) {
            acc[i].addEventListener("click", createAccordionClickHandler(i));
        }
        
        function createAccordionClickHandler(index) {
                    return function() {
                        if (current_index != null && current_index != index){
                            acc[current_index].classList.toggle("active")
                            acc[current_index].nextElementSibling.style.display = "none"
                        }
                        current_index = index
                        this.classList.toggle("active");
                        var panel = this.nextElementSibling;
                        if (panel.style.display === "block") {
                            panel.style.display = "none";
                        } else {
                            panel.style.display = "block";
                        }
                    };
        }

    </script>
</body>
</html> --%>











<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="navigation.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FAQ</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet"> <!-- Font Awesome for icons -->
    <style>
        body {
            font-family: Arial, sans-serif; /* Standard web font */
            background-color: #f4f4f4; /* Light grey background for soft appearance */
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center; /* Centers the FAQ header */
            color: #333; /* Darker text color for contrast */
        }
        .accordion {
            background-color: #eee;
            color: #444;
            cursor: pointer;
            padding: 18px;
            width: 100%;
            border: none;
            text-align: left;
            outline: none;
            font-size: 15px;
            transition: 0.4s; /* Smooth transition for expanding/collapsing */
            position: relative; /* Needed for absolute positioning of the icon */
        }

        .accordion::after {
            content: '\f067'; /* FontAwesome plus icon */
            font-family: 'FontAwesome';
            position: absolute;
            right: 20px;
            transition: transform 0.2s ease-in-out; /* Smooth transform transition */
        }

        .active::after {
            content: '\f068'; /* FontAwesome minus icon */
        }

        .active, .accordion:hover {
            background-color: #ccc; /* Slightly darker shade on hover/active */
        }

        .panel {
            padding: 0 18px;
            display: none; /* Initially hidden */
            background-color: white;
            overflow: hidden;
            transition: max-height 0.2s ease-out; /* Transition for the collapsible panel */
        }
    </style>
</head>
<body>
    <h2>FAQs</h2>
    <%@ include file="fetchFaqs.jsp" %>
    <script>
        var acc = document.getElementsByClassName("accordion");
        var current_index = null

        for (let i = 0; i < acc.length; i++) {
            acc[i].addEventListener("click", createAccordionClickHandler(i));
        }
        
        function createAccordionClickHandler(index) {
                    return function() {
                        if (current_index != null && current_index != index){
                            acc[current_index].classList.toggle("active")
                            acc[current_index].nextElementSibling.style.display = "none"
                        }
                        current_index = index
                        this.classList.toggle("active");
                        var panel = this.nextElementSibling;
                        if (panel.style.display === "block") {
                            panel.style.display = "none";
                        } else {
                            panel.style.display = "block";
                        }
                    };
        }

    </script>
</body>
</html> --%>






<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="navigation.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FAQ</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .accordion {
            background-color: #fff; /* White background */
            color: #333; /* Dark grey text */
            cursor: pointer;
            padding: 16px; /* Adjust padding to match the image */
            width: 100%;
            border: none;
            text-align: left;
            outline: none;
            font-size: 18px; /* Slightly larger font size */
            transition: 0.4s;
            position: relative;
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); /* Subtle shadow */
            margin-bottom: 10px; /* Space between accordion buttons */
        }

        .accordion::after {
            content: '\f107'; /* FontAwesome down arrow */
            font-family: 'FontAwesome';
            color: #333; /* Match text color */
            position: absolute;
            right: 20px;
            transition: transform 0.2s ease-in-out;
        }

        .active::after {
            content: '\f106'; /* FontAwesome up arrow */
            transform: rotate(180deg); /* Rotate the icon */
        }

        .active, .accordion:hover {
            background-color: #e2e2e2; /* Slightly darker shade on hover/active */
        }

        .panel {
            padding: 0 18px;
            background-color: white;
            max-height: 0; /* Initially no height */
            overflow: hidden;
            transition: max-height 0.2s ease-out;
            box-shadow: inset 0 4px 8px 0 rgba(0,0,0,0.2); /* Inner shadow to top */
            border-radius: 0 0 10px 10px; /* Rounded corners for the bottom */
        }
    </style>
</head>
<body>
<br>
<br>
<br>
<br>
    <h2>Frequently Asked Questions</h2>
    <%-- Include server side code to fetch FAQs --%>
    <%@ include file="fetchFaqs.jsp" %>
    <script>
        var acc = document.getElementsByClassName("accordion");
        var current_index = null;

        for (let i = 0; i < acc.length; i++) {
            acc[i].addEventListener("click", createAccordionClickHandler(i));
        }
        
        function createAccordionClickHandler(index) {
            return function() {
                if (current_index !== null && current_index !== index){
                    acc[current_index].classList.toggle("active");
                    var currentPanel = acc[current_index].nextElementSibling;
                    currentPanel.style.maxHeight = null;
                }
                current_index = index;
                this.classList.toggle("active");
                var panel = this.nextElementSibling;
                if (panel.style.maxHeight){
                    panel.style.maxHeight = null;
                } else {
                    panel.style.maxHeight = panel.scrollHeight + "px";
                }
            };
        }
    </script>
</body>
</html>
