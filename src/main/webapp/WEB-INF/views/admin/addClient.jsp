<%--
  Created by IntelliJ IDEA.
  User: wojtek
  Date: 08.06.2020
  Time: 20:42
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

    <title>Dodaj klienta Admin</title>
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
            <h2 class="d-flex justify-content-center">Dodaj klienta</h2>

            <div class="form-group row">
                <label for="nameId" class="col-sm-2 col-form-label">Nazwa: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="name" id="nameId" placeholder="nazwa" required="true"
                                class="form-control"/>
                    <form:errors path="name" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="NIPId" class="col-sm-2 col-form-label">NIP: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="NIP" id="NIPId" placeholder="NIP" class="form-control"
                                required="true"/>
                    <form:errors path="NIP" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="REGONId" class="col-sm-2 col-form-label">REGON: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="REGON" placeholder="REGON" id="REGONId"
                                required="true" class="form-control"/>
                    <form:errors path="REGON" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="accountId" class="col-sm-2 col-form-label">Rachunek: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="account" placeholder="rachunek" id="accountId"
                                required="true" class="form-control"/>
                    <form:errors path="account" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="contactPersondId" class="col-sm-2 col-form-label">Osoba kontaktowa: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="contactPerson" id="contactPersondId"
                                placeholder="osoba kontaktowa"
                                class="form-control"/>
                    <form:errors path="contactPerson" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="emailId" class="col-sm-2 col-form-label">Email: </label>
                <div class="col-sm-10">
                    <form:input type="email" path="email" id="emailId"
                                placeholder="Email" class="form-control"/>
                    <form:errors path="email" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="phoneId" class="col-sm-2 col-form-label">Telefon: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="phone" id="phoneId"
                                placeholder="Telefon" class="form-control"/>
                    <form:errors path="phone" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="streetId" class="col-sm-2 col-form-label">Ulica: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="street" id="streetId"
                                placeholder="ulica" required="true" class="form-control"/>
                    <form:errors path="street" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="blockNumberId" class="col-sm-2 col-form-label">Numer bloku: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="blockNumber" id="blockNumberId"
                                placeholder="numer bloku" required="true" class="form-control"/>
                    <form:errors path="blockNumber" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="flatNumberId" class="col-sm-2 col-form-label">Numer mieszkania: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="flatNumber" id="flatNumberId"
                                placeholder="Numer mieszkania" class="form-control"/>
                    <form:errors path="flatNumber" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="postalCodeId" class="col-sm-2 col-form-label">Kod pocztowy: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="postalCode" id="postalCodeId"
                                placeholder="Kod pocztowy" required="true" class="form-control"/>
                    <form:errors path="postalCode" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="townId" class="col-sm-2 col-form-label">Miasto </label>
                <div class="col-sm-10">
                    <form:input type="text" path="town" id="townId"
                                placeholder="Miasto" required="true" class="form-control"/>
                    <form:errors path="town" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="isActiveId" class="col-sm-2 col-form-label">Aktywny:</label>
                <div class="col-sm-10">
                    <form:radiobuttons path="active" items="${isActiveList}" id="isActiveId" class="form-control"/>
                    <form:errors path="active"  cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="userId" class="col-sm-2 col-form-label">Doradca:</label>
                <div class="col-sm-10">
                    <form:select path="user.id" items="${listOfUsers}" itemValue="id" itemLabel="Fullname" id="userId"
                                 class="custom-select"/>
                    <form:errors path="user.id" cssClass="error"/>
                </div>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Zapisz</button>

        </form:form>
    </div>
</div>
<%@include file="/WEB-INF/includes/footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>

</html>
