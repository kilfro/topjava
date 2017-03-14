<%--
  Created by IntelliJ IDEA.
  User: kirill
  Date: 14.03.17
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Meals list</title>
</head>
<body>
<table border="1" width="100%" cellpadding="5">
    <tr>
        <th>Date</th>
        <th>Description</th>
        <th>Calories</th>
    </tr>
    <c:forEach items="${list}" var="meal">
        <tr>
        <th>${meal.dateTime}</th>
        <th>${meal.description}</th>
        <th>${meal.calories}</th>
        </tr>
    </c:forEach>
</table>
</body>
</html>
