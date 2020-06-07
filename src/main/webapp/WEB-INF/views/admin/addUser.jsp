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

    <title>Add User</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link href='<c:url value="/css/style.css"/>' rel="stylesheet" type="text/css">
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <form:form autocomplete="off" action="#" method="post" class="form-horizontal"
                       modelAttribute="user">
                <h2>Add user</h2>
                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="firstNameId"
                               class="validation-message">First name: </label>
                        <form:input type="text" path="firstName" id="firstNameId" placeholder="First name"
                                    class="form-control"/>
                        <form:errors path="firstName"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="lastNameId"
                               class="validation-message">Last name: </label>
                        <form:input type="text" path="lastName" id="lastNameId"
                                    placeholder="Last Name" class="form-control"/>
                        <form:errors path="lastName"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="emailId" class="validation-message">Email: </label>
                        <form:input type="text" path="email" placeholder="Email" id="emailId"
                                    class="form-control"/>
                        <form:errors path="email"/>

                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="usernameId" class="validation-message">Username: </label>
                        <form:input type="text" path="username" placeholder="Username" id="usernameId"
                                    class="form-control"/>
                        <form:errors path="username"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="passwordId" class="validation-message">Password: </label>
                        <form:input type="password" path="password" id="passwordId"
                                    placeholder="Password" class="form-control"/>
                        <form:errors path="password"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="enabledId" class="validation-message">Enabled:</label>
                        <form:radiobuttons path="enabled" items="${enabledList}" id="enabledId" class="form-control"/>
                        <form:errors path="enabled"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="roleId" class="validation-message">Role:</label>
                        <form:radiobuttons path="role" items="${roleList}" id="roleId" class="form-control"/>
                        <form:errors path="role"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <button type="submit" class="btn btn-primary btn-block">Add user</button>
                    </div>
                </div>

                <h2><span class="text-success">Udało się</span></h2>

            </form:form>
        </div>
    </div>
</div>

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
