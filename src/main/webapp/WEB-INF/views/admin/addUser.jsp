<%--
  Created by IntelliJ IDEA.
  User: wojtek
  Date: 07.06.2020
  Time: 09:29
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>

<html>
<head>

    <title>Dodaj użytkownika</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link href='<c:url value="/css/style.css"/>' rel="stylesheet" type="text/css">
</head>
<body>
<%@include file="/WEB-INF/includes/header.jsp" %>
<div class="container">
    <div class="d-flex justify-content-center">
        <form:form autocomplete="off" action="#" method="post"
                   modelAttribute="user">
            <h2 class="d-flex justify-content-center">Dodaj użytkownika</h2>


            <div class="form-group row">
                <label for="firstNameId" class="col-sm-2 col-form-label">Imię: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="firstName" id="firstNameId" placeholder="First name"
                                class="form-control" required="true"/>
                    <form:errors path="firstName" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="lastNameId" class="col-sm-2 col-form-label">Nazwisko: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="lastName" id="lastNameId"
                                placeholder="Last Name" class="form-control" required="true"/>
                    <form:errors path="lastName" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="emailId" class="col-sm-2 col-form-label">Email: </label>
                <div class="col-sm-10">
                    <form:input type="email" path="email" placeholder="Email" id="emailId" class="form-control"
                                required="true"/>
                    <form:errors path="email" cssClass="error"/>
                </div>
            </div>

            <div class="form-group">
                <label for="usernameId" class="col-sm-2 col-form-label">Nazwa użytkownika: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="username" placeholder="Username" id="usernameId"
                                class="form-control" required="true"/>
                    <form:errors path="username" cssClass="error"/>
                </div>
            </div>

            <div class="form-group">
                <label for="passwordId" class="col-sm-2 col-form-label">Hasło: </label>
                <div class="col-sm-10">
                    <form:input type="password" path="password" id="passwordId"
                                placeholder="Password" class="form-control" required="true"/>
                    <form:errors path="password" cssClass="error"/>
                </div>
            </div>

            <div class="form-check form-check-inline">
                <label for="enabledId" class="form-check-label">Aktywność:</label>
                <div class="">
                    <form:radiobuttons path="enabled" items="${enabledList}" id="enabledId" class="form-control"/>
                    <form:errors path="enabled" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="roleId" class="">Rola:</label>
                <div class="">
                    <form:radiobuttons path="role" items="${roleList}" id="roleId" class="form-control"/>
                    <form:errors path="role" cssClass="error"/>
                </div>
            </div>

            <button type="submit" class="btn btn-primary btn-block">Add user</button>

        </form:form>
    </div>
</div>
<%@include file="/WEB-INF/includes/footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
</body>

</html>
