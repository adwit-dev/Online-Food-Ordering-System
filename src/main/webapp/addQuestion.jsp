<%-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Question</title>
</head>
<body>
    <h1>Add a New Question</h1>
    <form action="/addQuestion" method="POST">
        <div>
            <label>Question:</label>
            <input type="text" name="question" required>
        </div>
        <div>
            <label>Option 1:</label>
            <input type="text" name="option1" required>
        </div>
        <div>
            <label>Option 2:</label>
            <input type="text" name="option2" required>
        </div>
        <div>
            <label>Option 3:</label>
            <input type="text" name="option3" required>
        </div>
        <div>
            <label>Option 4:</label>
            <input type="text" name="option4" required>
        </div>
        <div>
            <label>Correct Answer (1-4):</label>
            <input type="number" name="answer" min="1" max="4" required>
        </div>
        <button type="submit">Add Question</button>
    </form>
</body>
</html> --%>





<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Question</title>
    <!-- Bootstrap CSS for responsive and modern styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Additional custom styling */
        .container {
            max-width: 600px; /* Limiting the maximum width of the form container */
            margin-top: 20px; /* Adding space at the top */
        }
        label {
            margin-bottom: 0.5rem; /* Space between label and input */
        }
        input, button {
            width: 100%; /* Full width of the form elements */
            margin-bottom: 1rem; /* Space between form fields */
        }
        h1 {
            text-align: center; /* Centering the title */
            margin-bottom: 2rem; /* Space below the title */
        }
    </style>
</head>
<body>
<jsp:include page="navigation.jsp" />

    <div class="container">
        <h1>Add a New Question</h1>
        <form action="/addQuestion" method="POST">
            <div class="mb-3">
                <label for="question" class="form-label">Question:</label>
                <input type="text" class="form-control" id="question" name="question" required>
            </div>
            <div class="mb-3">
                <label for="option1" class="form-label">Option 1:</label>
                <input type="text" class="form-control" id="option1" name="option1" required>
            </div>
            <div class="mb-3">
                <label for="option2" class="form-label">Option 2:</label>
                <input type="text" class="form-control" id="option2" name="option2" required>
            </div>
            <div class="mb-3">
                <label for="option3" class="form-label">Option 3:</label>
                <input type="text" class="form-control" id="option3" name="option3" required>
            </div>
            <div class="mb-3">
                <label for="option4" class="form-label">Option 4:</label>
                <input type="text" class="form-control" id="option4" name="option4" required>
            </div>
            <div class="mb-3">
                <label for="answer" class="form-label">Correct Answer (1-4):</label>
                <input type="number" class="form-control" id="answer" name="answer" min="1" max="4" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Question</button>
        </form>
    </div>

    <!-- Bootstrap Bundle with Popper for responsive interactions -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
