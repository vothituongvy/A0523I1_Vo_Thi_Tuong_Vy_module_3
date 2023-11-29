<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 9/28/2023
  Time: 10:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Danh sach</title>
    <style>
      a{
          text-decoration: none;
          color: aliceblue;
      }
      button{
          border-radius: 5px;
          background-color: cornflowerblue;
          width: 250px

      }
    </style>
</head>
<body>
<button><a href="product-servlet">Danh sach san pham</a></button><br>
<button><a href="product-servlet?action=showFormCreate">Them moi san pham</a></button><br>
<button><a href="product-servlet?action=showFormDelete">Xoa san phẩm</a></button><br>


    <table border="1" >
        <tr>
            <th>ID</th>
            <th>Tên</th>
            <th>Số lượng</th>
            <th>Xuất xứ</th>
            <th colspan="2">Action</th>
        </tr>
        <c:forEach items="${list}" var="product" varStatus="loop">
            <tr>
                <td>${product.code}</td>
                <td>${product.name}</td>
                <td>${product.quantity}</td>
                <td>${product.madeIn}</td>
                <td><button><a href="product-servlet?action=showFormUpdate&id=${product.code}">Cap nhap</a></button></td>
                <td><button><a href="product-servlet?action=showFormView&id=${product.code}">Xem thông tin</a></button></td>
            </tr>
        </c:forEach>
    </table>
<p>${message}</p>

</body>
</html>
