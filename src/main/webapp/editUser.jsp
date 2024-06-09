<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!--<c:out value = "${usermaster}"/>-->
    <form method="post" action="updateusers">
        Name : <input type="text" name="username" value="${usermaster[0].username}" />
        <br>
     
        Role : <input type="text" name="role" value="${usermaster[0].role}" />
        <br>
        Status : <input type="text" name="status" value="${usermaster[0].status}" />
        <input type="hidden" name="user_id" value="${usermaster[0].user_id}" />
        <br>
        <input type="submit" name="btn" value="update" />
    </form> --%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Update User</title>
    <style>
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            font-weight: bold;
        }
        input[type="text"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>

<body>
<jsp:include page="navigation.jsp" />

    <div class="container">
        <form method="post" action="updateusers">
            <div class="form-group">
                <label for="username">Name:</label>
                <input type="text" id="username" name="username" value="${usermaster[0].username}" />
            </div>
            <div class="form-group">
                <label for="role">Role:</label>
                <input type="text" id="role" name="role" value="${usermaster[0].role}" />
            </div>
            <div class="form-group">
                <label for="status">Status:</label>
                <input type="text" id="status" name="status" value="${usermaster[0].status}" />
                <input type="hidden" name="user_id" value="${usermaster[0].user_id}" />
            </div>
            <div class="form-group">
                <input type="submit" name="btn" value="Update" />
            </div>
        </form>
    </div>
</body>

</html>
