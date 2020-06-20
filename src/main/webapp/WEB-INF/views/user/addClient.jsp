<%--
  Created by IntelliJ IDEA.
  User: wojtek
  Date: 08.06.2020
  Time: 22:30
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

    <title>Add Client by User</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/css/style.css"/>">
</head>
<body>
<%@include file="/WEB-INF/includes/header.jsp" %>
<div class="container">
    <div class="d-flex justify-content-center">


        <form:form autocomplete="on" action="#" method="post"
                   modelAttribute="client">
            <h2 class="d-flex justify-content-center">Add Client</h2>

            <div class="form-group row">
                <label for="nameId" class="col-sm-2 col-form-label">Name: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="name" id="nameId" placeholder="Name" class="form-control"/>
                    <form:errors path="name" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="NIPId" class="col-sm-2 col-form-label">NIP: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="NIP" id="NIPId" placeholder="NIP" class="form-control"/>
                    <form:errors path="NIP" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="REGONId" class="col-sm-2 col-form-label">REGON: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="REGON" placeholder="REGON" id="REGONId" class="form-control"/>
                    <form:errors path="REGON" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="accountId" class="col-sm-2 col-form-label">Account: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="account" placeholder="account" id="accountId" class="form-control"/>
                    <form:errors path="account" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="contactPersondId" class="col-sm-2 col-form-label">Contact person: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="contactPerson" id="contactPersondId" placeholder="COntact person"
                                class="form-control"/>
                    <form:errors path="contactPerson" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="emailId" class="col-sm-2 col-form-label">Email: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="email" id="emailId" placeholder="Email" class="form-control"/>
                    <form:errors path="email" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="phoneId" class="col-sm-2 col-form-label">Phone: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="phone" id="phoneId" placeholder="Phone" class="form-control"/>
                    <form:errors path="phone" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="streetId" class="col-sm-2 col-form-label">Street: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="street" id="streetId" placeholder="Street" class="form-control"/>
                    <form:errors path="street" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="blockNumberId" class="col-sm-2 col-form-label">Block number: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="blockNumber" id="blockNumberId" placeholder="Block number"
                                class="form-control"/>
                    <form:errors path="blockNumber" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="flatNumberId" class="col-sm-2 col-form-label">Flat number: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="flatNumber" id="flatNumberId" placeholder="Flat number"
                                class="form-control"/>
                    <form:errors path="flatNumber" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="postalCodeId" class="col-sm-2 col-form-label">Postal code: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="postalCode" id="postalCodeId" placeholder="Postal code"
                                class="form-control"/>
                    <form:errors path="postalCode" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="townId" class="col-sm-2 col-form-label">Town: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="town" id="townId" placeholder="Town" class="form-control"/>
                    <form:errors path="town" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="isActiveId" class="col-sm-2 col-form-label">Is Active:</label>
                <div class="col-sm-10">
                    <form:radiobuttons path="active" items="${isActiveList}" id="isActiveId" class="form-control"/>
                    <form:errors path="active" cssClass="error"/>
                </div>
            </div>

            <button type="submit" class="btn btn-primary btn-block">Add client</button>

        </form:form>
    </div>
</div>
<%@include file="/WEB-INF/includes/footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>

</html>
