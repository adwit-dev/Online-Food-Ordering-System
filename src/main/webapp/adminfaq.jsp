<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="navigation.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin FAQ</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
        }
        h2 {
            color: #333;
            text-align: center;
        }
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse; /* Ensures borders between cells are merged */
        }
        th, td {
            padding: 8px; /* Adds space around text in cells */
            text-align: left; /* Aligns text to the left in cells */
            border-bottom: 1px solid #ddd; /* Adds a light grey bottom border to all cells */
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd; /* Highlights row on mouse-over */
        }
    </style>
</head>
<body>
    <h2>Admin FAQ Management</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Query</th>
            <th>Status</th>
            <th>Date Posted</th>
            <th>Actions</th>
        </tr>
        <%@ include file="queries.jsp" %>
    </table>
</body>
</html>
