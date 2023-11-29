<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/2/2023
  Time: 3:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/product-servlet?action=update" method="post">
    <table border="1">
        <tr>
            <td>ID</td>
            <td width="100px"><input type="text" name="code" readonly value="${product.code}"></td>
        </tr>
        <tr>
            <td>Tên</td>
            <td width="100px"><input type="text" name="name" readonly value="${product.name}"></td>
        </tr>
        <tr>
            <td>Số lượng</td>
            <td width="100px"><input type="text" name="quantity" readonly value="${product.quantity}"></td>
        </tr>
        <tr>
            <td>Xuất xứ</td>
            <td width="100px"><input type="text" name="madeIn" readonly value="${product.madeIn}"></td>
        </tr>
    </table>
</form>
</body>
</html>
