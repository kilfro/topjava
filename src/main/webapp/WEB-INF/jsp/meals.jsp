<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://topjava.javawebinar.ru/functions" %>
<html>
<jsp:include page="fragments/headTag.jsp"/>
<body>
<jsp:include page="fragments/bodyHeader.jsp"/>

<section>
    <%--<h3><spring:message code="meals.title"/></h3>--%>
    <h3><Список еды</h3>

    <form method="post" action="meals/filter">
        <dl>
            <%--<dt><spring:message code="meals.startDate"/>:</dt>--%>
            <dt>От даты:</dt>
            <dd><input type="date" name="startDate" value="${param.startDate}"></dd>
        </dl>
        <dl>
            <%--<dt><spring:message code="meals.endDate"/>:</dt>--%>
            <dt>До даты:</dt>
            <dd><input type="date" name="endDate" value="${param.endDate}"></dd>
        </dl>
        <dl>
            <%--<dt><spring:message code="meals.startTime"/>:</dt>--%>
            <dt>От времени:</dt>
            <dd><input type="time" name="startTime" value="${param.startTime}"></dd>
        </dl>
        <dl>
            <%--<dt><spring:message code="meals.endTime"/>:</dt>--%>
            <dt>До времени:</dt>
            <dd><input type="time" name="endTime" value="${param.endTime}"></dd>
        </dl>
        <%--<button type="submit"><spring:message code="meals.filter"/></button>--%>
        <button type="submit">Отфильтровать</button>
    </form>
    <hr>
    <%--<a href="meals/create"><spring:message code="meals.add"/></a>--%>
    <a href="meals/create">Добавить еду</a>
    <hr>
    <table border="1" cellpadding="8" cellspacing="0">
        <thead>
        <tr>
            <%--<th><spring:message code="meals.dateTime"/></th>--%>
            <th>Время</th>
            <%--<th><spring:message code="meals.description"/></th>--%>
            <th>Описание</th>
            <%--<th><spring:message code="meals.calories"/></th>--%>
            <th>Калории</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <c:forEach items="${meals}" var="meal">
            <jsp:useBean id="meal" scope="page" type="ru.javawebinar.topjava.to.MealWithExceed"/>
            <tr class="${meal.exceed ? 'exceeded' : 'normal'}">
                <td>
                        <%--${meal.dateTime.toLocalDate()} ${meal.dateTime.toLocalTime()}--%>
                        <%--<%=TimeUtil.toString(meal.getDateTime())%>--%>
                        ${fn:formatDateTime(meal.dateTime)}
                </td>
                <td>${meal.description}</td>
                <td>${meal.calories}</td>
                <%--<td><a href="meals/update?id=${meal.id}"><spring:message code="common.update"/></a></td>--%>
                <td><a href="meals/update?id=${meal.id}">Обновить</a></td>
                <%--<td><a href="meals/delete?id=${meal.id}"><spring:message code="common.delete"/></a></td>--%>
                <td><a href="meals/delete?id=${meal.id}">Удалить</a></td>
            </tr>
        </c:forEach>
    </table>
</section>
<jsp:include page="fragments/footer.jsp"/>
</body>
</html>