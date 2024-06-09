<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>All Users</title>
        
            
    </head>

    <body>


        Welcome, <% out.print(session.getAttribute("username")); %>
            <hr />

            <table id="example" cellspacing="0" width="100%">


                <thead>

                    <tr>
                        <th>user Name</th>
                        <th>user_id</th>
                        <th>Role</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>

                </thead>
                <tbody>

                    <c:forEach var="user" items="${usermaster}">
                        <tr>
                            <td>${user.username}</td>
                            <td>${user.user_id}</td>
                            <!-- <td>${user.password}</td> -->
                            <td>${user.role}</td>

                            <td>${user.status}</td>

                            <td>

                                <form method="post" action="manageusers">
                                    <input type="hidden" name="user_id" value="${user.user_id}" />

                                    <input type="submit" name="btn" value="edit">
                                    <input type="submit" name="btn" value="delete">

                                </form>

                            </td>
                        </tr>
                    </c:forEach>


                </tbody>
            </table> --%>




            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>All Users</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse; /* Ensures that the border is neat */
        }
        th, td {
            border: 1px solid black; /* Adds border to the cells */
            padding: 8px; /* Adds space inside the cells */
            text-align: left; /* Aligns text to the left */
        }
        th {
            background-color: #f2f2f2; /* Light grey background for the header */
        }
    </style>






</head>

<body>
<jsp:include page="navigation.jsp" />
    Welcome, <% out.print(session.getAttribute("username")); %>
    <hr />

    

    
  <table id="example">
        <thead>
            <tr>
                <th>User Name</th>
                <th>User ID</th>
                <th>Role</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${usermaster}">
                <tr>
                    <td>${user.username}</td>
                    <td>${user.user_id}</td>
                    <td>${user.role}</td>
                    <td>${user.status}</td>
                    <td>
                        <form method="post" action="manageusers">
                            <input type="hidden" name="user_id" value="${user.user_id}" />
                            <input type="submit" name="btn" value="edit">
                            <input type="submit" name="btn" value="delete">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

  


</body>
</html>
