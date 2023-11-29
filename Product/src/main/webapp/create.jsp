<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 9/28/2023
  Time: 10:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Điền thông tin sản phẩm mới</title>
</head>
<body>
<%--private String name;--%>
<%--private int quantity;--%>
<%--private String madeIn;--%>
<a href="product-servlet">Danh sach san pham</a>
<a href="product-servlet?action=showFormCreate">Them moi san pham</a>
<a href="product-servlet?action=showFormDelete">Xoa san phẩm</a>
<a href="product-servlet?action=showFormUpdate">Cap nhap</a>
<form action="/product-servlet?action=create" method="post">
    <table border="1">
        <tr>
            <td>ID</td>
            <td width="100px"><input type="text" name="code"></td>
        </tr>
        <tr>
            <td>Tên</td>
            <td width="100px"><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>Số lượng</td>
            <td width="100px"><input type="text" name="quantity"></td>
        </tr>
        <tr>
            <td>Xuất xứ</td>
            <td width="100px"><input type="text" name="madeIn"></td>
        </tr>
    </table>
    <input type="submit" value="Tạo sản phẩm">
</form>

</body>
</html>
