<%--
  Created by IntelliJ IDEA.
  User: wojtek
  Date: 08.06.2020
  Time: 09:20
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="pl-PL">
<head>

    <title>Lista użytkowników dla Admina</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/css/style.css"/>">
</head>
<body>
<%@include file="/WEB-INF/includes/header.jsp" %>
<div class="container">
    <div class="">
        <div class="">
            <table class="table-sm table-striped table-bordered table-hover">
                <tr>
                    <th>Imię</th>
                    <th>Nazwisko</th>
                    <th>Email</th>
                    <th>Aktywność</th>
                    <th>username</th>
                    <th>Rola</th>
                </tr>
                <c:forEach var="user" items="${allUsersForAdmin}">
                    <tr>
                        <td>${user.firstName}</td>
                        <td>${user.lastName}</td>
                        <td>${user.email}</td>
                        <td>${user.enabled}

                            <c:choose>
                            <c:when test="${user.enabled == 'true'}">
                            <button type="button" class="btn btn-outline-danger">
                                <a href="/admin/${user.id}/disable">Dezaktywuj</a>
                                </c:when>
                                <c:otherwise>
                                <button type="button" class="btn btn-outline-success">
                                    <a href="/admin/${user.id}/enable">Aktywuj</a>
                                    </c:otherwise>
                                    </c:choose>
                                </button>

                        </td>
                        <td>${user.username}</td>
                        <td>${user.role}</td>

                        <td>
                                <%-- <form:form method="post">
                                     <input type="hidden" name="userId" value="${user.id}">
                                     <input type="hidden" name="action" value="update"> --%>
                            <c:choose>
                                <c:when test="${user.role == 'ROLE_ADMIN'}">
                                    <%-- <input type="hidden" name="role" value="admin">
                                    <button type="submit" class="btn btn-outline-primary">
                                        Edycja
                                    </button> --%>
                                    <button type="button" class="btn btn-outline-success">
                                        <a href="/admin/admin/update/${user.id}">Edycja</a>
                                    </button>
                                </c:when>
                                <c:otherwise>
                                    <%--<input type="hidden" name="role" value="user">
                                    <button type="submit" class="btn btn-outline-primary">
                                        Edycja
                                    </button> --%>
                                    <button type="button" class="btn btn-outline-success">
                                        <a href="/admin/user/update/${user.id}">Edycja</a>
                                    </button>
                                </c:otherwise>

                            </c:choose>
                                <%-- </form:form> --%>
                        </td>
                        <td>
                                <%--   <form:form method="post">
                                       <input type="hidden" name="userId" value="${user.id}">
                                       <input type="hidden" name="action" value="resetPassword">    --%>
                            <button type="submit" class="btn btn-outline-primary">
                                <a href="/admin/resetPassword/${user.id}">
                                    Resetuj hasło</a>
                            </button>

                                <%--  </form:form> --%>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

</div>
<%@include file="/WEB-INF/includes/footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>

</html>
