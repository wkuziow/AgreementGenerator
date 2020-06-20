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

    <title>User List for admin</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/css/style.css"/>">
</head>
<body>
<%@include file="/WEB-INF/includes/header.jsp" %>
<div class="container">
    <div class="">
        <div class="table-responsive d-flex justify-content-center">
            <table class="table-sm table-striped table-bordered table-hover">
                <tr>
                    <th>First name</th>
                    <th>Last name</th>
                    <th>email</th>
                    <th>enabled</th>
                    <th>username</th>
                    <th>role</th>
                </tr>
                <c:forEach var="user" items="${allUsersForAdmin}">
                    <tr>
                        <td>${user.firstName}</td>
                        <td>${user.lastName}</td>
                        <td>${user.email}</td>
                        <td>${user.enabled}</td>
                        <td>${user.username}</td>
                        <td>${user.role}</td>

                        <td>
                            <button type="button" class="btn btn-outline-primary">
                                <%--    <a href="/admin/user/delete/${author.id}">Delete</a> --%>
                            <a href="/admin/user/update/${user.id}">Edit</a>
                            </button>
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
