<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title> Product Discount Calculator</title>
</head>
<body>
<form method="post" action="/discount-servlet">
  <h1>Product Discount</h1>
  <div>
    <label>Product Description: </label>
    <input type="text" name="product">
  </div>
  <div>
    <label>List Price: </label>
    <input type="text" name="price">
  </div>
  <div>
    <label>Discount Percent: </label>
    <input type="text" name="percent">
  </div>
  <button>Calculate Discount</button>
</form>
</body>
</html>