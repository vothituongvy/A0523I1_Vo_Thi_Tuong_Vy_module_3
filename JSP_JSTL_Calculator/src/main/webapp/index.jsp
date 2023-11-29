<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form method="post" action="/calculator-servlet">
    <table>
        <tr>
            <td>First operand:</td>
            <td><input name="number1" type="text"/></td>
        </tr>
        <tr>
            <td>Operator:</td>
            <td>
                <select name="number">
                    <option value="+">Add</option>
                    <option value="-">Sub</option>
                    <option value="*">Mul</option>
                    <option value="/">Div</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Second operand:</td>
            <td><input name="number2" type="text"/></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Calculate"/></td>
        </tr>
    </table>
</form>
</body>
</html>