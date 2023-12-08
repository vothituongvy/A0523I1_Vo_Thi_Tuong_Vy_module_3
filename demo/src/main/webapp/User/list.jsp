<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div align="center">
    <h1>User Management</h1>
    <h2>
        <a href="/users?action=create">Add New User</a>
    </h2>
    <caption><h2>List of Users</h2></caption>
</div>
<div align="center">

    <table border="1" cellpadding="5">
        <tr>
            <form method="get" action="/users">
                <label>Product Country:</label>
                <input type="text" name="countryName">
                <input type="submit" value="Search">
                <input type="hidden" name="action" value="search">
            </form>
        </tr>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${users}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/users?action=edit&id=${user.id}">Edit

                    </a>
                    <a href="/users?action=delete&id=${user.id}" >Delete
                    </a>
                    <a href="/users?action=sapXep">Sort</a>
                </td>
            </tr>
        </c:forEach>
    </table>

</div>
</body>
</html>