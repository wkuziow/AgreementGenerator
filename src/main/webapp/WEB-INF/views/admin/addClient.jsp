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


<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <form:form autocomplete="on" action="#" method="post" class="form-horizontal"
                       modelAttribute="client">
                <h2>Add Client</h2>
                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="nameId"
                               class="validation-message">Name: </label>
                        <form:input type="text" path="name" id="nameId" placeholder="Name"
                                    class="form-control"/>
                        <form:errors path="name"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="NIPId"
                               class="validation-message">NIP: </label>
                        <form:input type="text" path="NIP" id="NIPId"
                                    placeholder="NIP" class="form-control"/>
                        <form:errors path="NIP"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="REGONId" class="validation-message">REGON: </label>
                        <form:input type="text" path="REGON" placeholder="REGON" id="REGONId"
                                    class="form-control"/>
                        <form:errors path="REGON"/>

                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="accountId" class="validation-message">Account: </label>
                        <form:input type="text" path="account" placeholder="account"
                                    id="accountId"
                                    class="form-control"/>
                        <form:errors path="account"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="contactPersondId" class="validation-message">Contact person: </label>
                        <form:input type="text" path="contactPerson" id="contactPersondId"
                                    placeholder="COntact person" class="form-control"/>
                        <form:errors path="contactPerson"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="emailId" class="validation-message">Email: </label>
                        <form:input type="text" path="email" id="emailId"
                                    placeholder="Email" class="form-control"/>
                        <form:errors path="email"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="phoneId" class="validation-message">Phone: </label>
                        <form:input type="text" path="phone" id="phoneId"
                                    placeholder="Phone" class="form-control"/>
                        <form:errors path="phone"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="streetId" class="validation-message">Street: </label>
                        <form:input type="text" path="street" id="streetId"
                                    placeholder="Street" class="form-control"/>
                        <form:errors path="street"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="blockNumberId" class="validation-message">Block number: </label>
                        <form:input type="text" path="blockNumber" id="blockNumberId"
                                    placeholder="Block number" class="form-control"/>
                        <form:errors path="blockNumber"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="flatNumberId" class="validation-message">Flat number: </label>
                        <form:input type="text" path="flatNumber" id="flatNumberId"
                                    placeholder="Flat number" class="form-control"/>
                        <form:errors path="flatNumber"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="postalCodeId" class="validation-message">Postal code: </label>
                        <form:input type="text" path="postalCode" id="postalCodeId"
                                    placeholder="Postal code" class="form-control"/>
                        <form:errors path="postalCode"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="townId" class="validation-message">Town: </label>
                        <form:input type="text" path="town" id="townId"
                                    placeholder="Town" class="form-control"/>
                        <form:errors path="town"/>
                    </div>
                </div>




                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="isActiveId" class="validation-message">Is Active:</label>
                        <form:radiobuttons path="active" items="${isActiveList}" id="isActiveId" class="form-control"/>
                        <form:errors path="active"/>
                    </div>
                </div>

              <div class="form-group">
                    <div class="col-sm-9">
                        <label for="userId" class="validation-message">User:</label>
                        <form:select path="user.id" items="${listOfUsers}" itemValue="id" itemLabel="Fullname" id="userId" class="form-control"/>
                        <form:errors path="user.id"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <button type="submit" class="btn btn-primary btn-block">Add client</button>
                    </div>
                </div>



            </form:form>
        </div>
    </div>
</div>



<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>

</html>
