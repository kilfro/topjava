<%--
  Created by IntelliJ IDEA.
  User: kirill
  Date: 14.03.17
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://example.com/functions" %>

<html>
<head>
    <title>Meals list</title>
</head>
<body>
<table border="1" cellpadding="5">
    <tr>
        <th>Date</th>
        <th>Description</th>
        <th>Calories</th>
    </tr>
    <c:forEach items="${list}" var="meal">
        <tr style="color: darkgreen">

        <c:if test="${meal.exceed}">
            <tr style="color: red">
        </c:if>

        <th>${f:matches(meal.dateTime, 'dd.MM.yyyy HH:mm')}</th>
        <th>${meal.description}</th>
        <th>${meal.calories}</th>
        </tr>
    </c:forEach>
</table>
</body>
</html>
