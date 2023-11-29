<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 9/29/2023
  Time: 8:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="product-servlet">Danh sach san pham</a>
<a href="product-servlet?action=showFormCreate">Them moi san pham</a>
<a href="product-servlet?action=showFormDelete">Xoa san phẩm</a>
<a href="product-servlet?action=showFormUpdate">Cap nhap</a>

<form action="/product-servlet?action=update" method="post">
    <table border="1">
        <tr>
            <td>ID</td>
            <td width="100px"><input type="text" name="code" readonly value="${product.code}"></td>
        </tr>
        <tr>
            <td>Tên</td>
            <td width="100px"><input type="text" name="name" value="${product.name}"></td>
        </tr>
        <tr>
            <td>Số lượng</td>
            <td width="100px"><input type="text" name="quantity" value="${product.quantity}"></td>
        </tr>
        <tr>
            <td>Xuất xứ</td>
            <td width="100px"><input type="text" name="madeIn" value="${product.madeIn}"></td>
        </tr>
    </table>
    <input type="submit" value="Cập nhập">
</form>

</body>
</html>
