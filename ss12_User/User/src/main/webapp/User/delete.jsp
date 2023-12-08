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
        <a href="users?action=list">Back to list</a>
    </h2>
</div>
<div align="center">
    <form method="post" action="/users">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Delete User</h2>
            </caption>
            <tr>
                <th>User Name:</th>
                <td>
                    <input type="text" name="name" id="name" readonly value="${user.getName()}" size="45"/>
                </td>
            </tr>
            <tr>
                <th>User Email:</th>
                <td>
                    <input type="text" name="email" id="email" readonly value="${user.getEmail()}" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Country:</th>
                <td>
                    <input type="text" name="country" id="country" readonly value="${user.getCountry()}" size="45"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Delete"/>
                </td>
            </tr>
            <input type="hidden" name="action" value="delete">
            <input type="hidden" name="id" value="${user.getId()}">
        </table>

    </form>
</div>
</body>
</html>