<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MCQ Exam</title>
</head>
<body>
    <h1>MCQ Exam</h1>
    <form action="/submitAnswers" method="POST">
        <div>
            <c:forEach var="question" items="${questions}">
                <div>
                    <p>${question.question}</p>
                    <input type="radio" name="${question.id}" value="1">${question.option1}<br>
                    <input type="radio" name="${question.id}" value="2">${question.option2}<br>
                    <input type="radio" name="${question.id}" value="3">${question.option3}<br>
                    <input type="radio" name="${question.id}" value="4">${question.option4}<br>
                </div>
            </c:forEach>
            <button type="submit">Submit Answers</button>
        </div>
    </form>
</body>
</html> --%>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MCQ Exam</title>
    <!-- Bootstrap CSS for responsive and modern styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding-top: 20px;
        }
        .container {
            max-width: 600px; /* Set a maximum width for the form container */
            margin: auto; /* Center the container */
            padding: 20px; /* Padding inside the container */
            background-color: #f8f9fa; /* Light background color for better readability */
            border-radius: 10px; /* Rounded corners for the container */
            box-shadow: 0 4px 8px rgba(0,0,0,0.1); /* Subtle shadow for 3D effect */
        }
        h1 {
            text-align: center; /* Centering the title */
            margin-bottom: 20px; /* Space below the title */
        }
        .question {
            margin-bottom: 15px; /* Space between each question block */
        }
        .options {
            margin-left: 20px; /* Indent options for better readability */
        }
        button {
            width: 100%; /* Full width button */
            margin-top: 20px; /* Space above the submit button */
        }
    </style>
</head>
<body>
<jsp:include page="navigation.jsp" />

    <div class="container">
        <h1>MCQ Exam</h1>
        <form action="/submitAnswers" method="POST">
            <c:forEach var="question" items="${questions}">
                <div class="question">
                    <p><strong>${question.question}</strong></p>
                    <div class="options">
                        <input type="radio" id="option1_${question.id}" name="${question.id}" value="1">
                        <label for="option1_${question.id}">${question.option1}</label><br>
                        <input type="radio" id="option2_${question.id}" name="${question.id}" value="2">
                        <label for="option2_${question.id}">${question.option2}</label><br>
                        <input type="radio" id="option3_${question.id}" name="${question.id}" value="3">
                        <label for="option3_${question.id}">${question.option3}</label><br>
                        <input type="radio" id="option4_${question.id}" name="${question.id}" value="4">
                        <label for="option4_${question.id}">${question.option4}</label><br>
                    </div>
                </div>
            </c:forEach>
            <button type="submit" class="btn btn-primary">Submit Answers</button>
        </form>
    </div>

    <!-- Bootstrap Bundle with Popper for responsive interactions -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
