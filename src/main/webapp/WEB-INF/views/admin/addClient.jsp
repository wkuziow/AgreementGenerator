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

    <title>Add Client by Admin</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/css/style.css"/>">
</head>
<body>
<%@include file="/WEB-INF/includes/header.jsp" %>


<form:form autocomplete="on" action="#" method="post"
           modelAttribute="client">
    <h2>Add Client</h2>

    <label for="nameId">Name: </label>
    <form:input type="text" path="name" id="nameId" placeholder="Name"/>
    <form:errors path="name" cssClass="error"/>

    <label for="NIPId">NIP: </label>
    <form:input type="text" path="NIP" id="NIPId" placeholder="NIP"/>
    <form:errors path="NIP"/>

    <label for="REGONId">REGON: </label>
    <form:input type="text" path="REGON" placeholder="REGON" id="REGONId"/>
    <form:errors path="REGON"/>

    <label for="accountId">Account: </label>
    <form:input type="text" path="account" placeholder="account" id="accountId"/>
    <form:errors path="account"/>

    <label for="contactPersondId">Contact person: </label>
    <form:input type="text" path="contactPerson" id="contactPersondId"
                placeholder="COntact person"/>
    <form:errors path="contactPerson"/>

    <label for="emailId">Email: </label>
    <form:input type="text" path="email" id="emailId"
                placeholder="Email"/>
    <form:errors path="email"/>

    <label for="phoneId">Phone: </label>
    <form:input type="text" path="phone" id="phoneId"
                placeholder="Phone"/>
    <form:errors path="phone"/>

    <label for="streetId">Street: </label>
    <form:input type="text" path="street" id="streetId"
                placeholder="Street"/>
    <form:errors path="street"/>

    <label for="blockNumberId">Block number: </label>
    <form:input type="text" path="blockNumber" id="blockNumberId"
                placeholder="Block number"/>
    <form:errors path="blockNumber"/>

    <label for="flatNumberId">Flat number: </label>
    <form:input type="text" path="flatNumber" id="flatNumberId"
                placeholder="Flat number"/>
    <form:errors path="flatNumber"/>

    <label for="postalCodeId">Postal code: </label>
    <form:input type="text" path="postalCode" id="postalCodeId"
                placeholder="Postal code"/>
    <form:errors path="postalCode"/>

    <label for="townId">Town: </label>
    <form:input type="text" path="town" id="townId"
                placeholder="Town"/>
    <form:errors path="town"/>

    <label for="isActiveId">Is Active:</label>
    <form:radiobuttons path="active" items="${isActiveList}" id="isActiveId"/>
    <form:errors path="active"/>

    <label for="userId">User:</label>
    <form:select path="user.id" items="${listOfUsers}" itemValue="id" itemLabel="Fullname" id="userId"/>
    <form:errors path="user.id"/>

    <button type="submit">Add client</button>

</form:form>

<%@include file="/WEB-INF/includes/footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>

</html>
