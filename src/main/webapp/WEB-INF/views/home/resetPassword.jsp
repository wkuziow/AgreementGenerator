<%--
  Created by IntelliJ IDEA.
  User: wojtek
  Date: 03.07.2020
  Time: 21:19
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

    <title>Zresetuj hasło</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/css/style.css"/>">
</head>
<body>
<%@include file="/WEB-INF/includes/header.jsp"%>
<div class="container">

    <div class="d-flex justify-content-center ">
        <form method="post" modelAttribute="user">


            <div class="form-group">
                <label for="usernameId" class="col-sm-2 col-form-label">Nazwa użytkownika: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="username" placeholder="Username" id="usernameId"
                                class="form-control" required="true"/>
                    <form:errors path="" cssClass="error"/>
                </div>
            </div>

            <div><input type="submit" value="Zresetuj hasło"/></div>

        </form>

    </div>
</div>
<%@include file="/WEB-INF/includes/footer.jsp"%>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>

</html>
