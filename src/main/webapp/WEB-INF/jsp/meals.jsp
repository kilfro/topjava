<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://topjava.javawebinar.ru/functions" %>
<html>
<jsp:include page="fragments/headTag.jsp"/>
<script type="text/javascript" src="resources/js/datatablesUtil.js" defer></script>
<script type="text/javascript" src="resources/js/mealDatatables.js" defer></script>
<body>
<jsp:include page="fragments/bodyHeader.jsp"/>

<section style="margin-left: 10%; margin-top: 5%">
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
</section>
<div class="jumbotron">
    <div class="container">
        <div class="shadow">
            <%--<h3><spring:message code="meals.title"/></h3>--%>
            <h3>Список еды</h3>

            <div class="view-box">
                <a class="btn btn-sm btn-info" onclick="add()">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                </a>

                <table class="table table-striped display" id="datatable">
                    <thead>
                    <tr>
                        <%--<th><spring:message code="users.name"/></th>--%>
                        <th>Время</th>
                        <%--<th><spring:message code="users.email"/></th>--%>
                        <th>Описание</th>
                        <%--<th><spring:message code="users.roles"/></th>--%>
                        <th>Калории</th>
                        <th></th>
                        <th></th>
                    </tr>
                    </thead>
                    <c:forEach items="${meals}" var="meal">
                        <jsp:useBean id="meal" scope="page" type="ru.javawebinar.topjava.to.MealWithExceed"/>
                        <tr class="${meal.exceed ? 'exceeded' : 'normal'}">
                            <td>${fn:formatDateTime(meal.dateTime)}</td>
                            <td>${meal.description}</td>
                            <td>${meal.calories}</td>
                            <td><a class="btn btn-xs btn-primary edit" id="${meal.id}">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            </a></td>
                            <td><a class="btn btn-xs btn-danger delete" id="${meal.id}">
                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                            </a></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>
<jsp:include page="fragments/footer.jsp"/>

<div class="modal fade" id="editRow">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h2 class="modal-title">Добавить еду</h2>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" method="post" id="detailsForm">
                    <input type="text" hidden="hidden" id="id" name="id">

                    <div class="form-group">
                        <label for="datetime" class="control-label col-xs-3">Время</label>

                        <div class="col-xs-9">
                            <%--<input type="text" class="form-control" id="name" name="name" placeholder="<spring:message code="users.name"/>">--%>
                            <input type="datetime-local" class="form-control" id="datetime" name="datetime" placeholder="Время">
                        </div>
                    </div>

                    <div class="form-group">
                        <%--<label for="email" class="control-label col-xs-3"><spring:message code="users.email"/></label>--%>
                        <label for="description" class="control-label col-xs-3">Описание</label>

                        <div class="col-xs-9">
                            <%--<input type="email" class="form-control" id="email" name="email" placeholder="<spring:message code="users.email"/>">--%>
                            <input type="text" class="form-control" id="description" name="description" placeholder="Описание">
                        </div>
                    </div>

                    <div class="form-group">
                        <%--<label for="password" class="control-label col-xs-3"><spring:message code="users.password"/></label>--%>
                        <label for="calories" class="control-label col-xs-3">Калории</label>

                        <div class="col-xs-9">
                            <%--<input type="password" class="form-control" id="password" name="password" placeholder="<spring:message code="users.password"/>">--%>
                            <input type="text" class="form-control" id="calories" name="calories" placeholder="Калории">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-xs-offset-3 col-xs-9">
                            <button type="submit" class="btn btn-primary">
                                <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>