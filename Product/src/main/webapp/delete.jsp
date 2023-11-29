<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 9/29/2023
  Time: 5:57 PM
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
<form action="/product-servlet?action=delete" method="post">
    <lable>Nhập ID: <input type="text" name="code"></lable>
    <input type="submit" value="Xóa sản phẩm">
</form>
</body>
</html>
