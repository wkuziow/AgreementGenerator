<%--
  Created by IntelliJ IDEA.
  User: wojtek
  Date: 09.06.2020
  Time: 14:07
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

    <title>Add transaction</title>
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
                       modelAttribute="transaction">
                <h2>Add transaction</h2>
                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="amountId"
                               class="validation-message">Name: </label>
                        <form:input type="text" path="amount" id="amountId" placeholder="amount"
                                    class="form-control"/>
                        <form:errors path="amount"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="currencyd"
                               class="validation-message">Currency: </label>
                        <form:input type="text" path="currency" id="currencyId"
                                    placeholder="currency" class="form-control"/>
                        <form:errors path="currency"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="dateOfSignId" class="validation-message">Date of sign: </label>
                        <form:input type="text" path="dateOfSign" placeholder="dateOfSign" id="dateOfSignId"
                                    class="form-control"/>
                        <form:errors path="dateOfSign"/>

                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="isActiveId" class="validation-message">Is Active: </label>
                        <form:radiobuttons path="active" items="${isActiveList}" placeholder="isActive"
                                           id="isActiveId"
                                           class="form-control"/>
                        <form:errors path="active"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="hasValidDateId" class="validation-message">Has Valid Date: </label>
                        <form:radiobuttons path="hasValidDate" items="${hasValidDate}" placeholder="hasValidDate"
                                           id="hasValidDateId"
                                           class="form-control"/>
                        <form:errors path="hasValidDate"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="validDateId" class="validation-message">Valid date: </label>
                        <form:input type="text" path="validDate" placeholder="validDate" id="validDateId"
                                    class="form-control"/>
                        <form:errors path="validDate"/>

                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="collateralsdId" class="validation-message">Collaterals: </label>
                        <form:textarea path="collaterals" id="collateralsdId"
                                       placeholder="collaterals" class="form-control"
                                       rows="5" cols="50"/>
                        <form:errors path="collaterals"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="administrationFeeId" class="validation-message">Administration fee: </label>
                        <form:input type="text" path="administrationFee" id="administrationFeeId"
                                    placeholder="Administration fee" class="form-control"/>
                        <form:errors path="administrationFee"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="arrangementFeeId" class="validation-message">Arrangement Fee: </label>
                        <form:input type="text" path="arrangementFee" id="arrangementFeeId"
                                    placeholder="Arrangement fee" class="form-control"/>
                        <form:errors path="arrangementFee"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="operationalFeeId" class="validation-message">Operational fee </label>
                        <form:input type="text" path="operationalFee" id="operationalFeeId"
                                    placeholder="Operational fee" class="form-control"/>
                        <form:errors path="operationalFeeId"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="marginId" class="validation-message">Margin: </label>
                        <form:input type="text" path="margin" id="marginId"
                                    placeholder="margin" class="form-control"/>
                        <form:errors path="margin"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-9">
                        <label for="referenceRateId" class="validation-message">Reference rate: </label>
                        <form:select path="referenceRate" items="${referenceRateList}" id="referenceRateId"
                                     placeholder="Reference rate" class="form-control"/>
                        <form:errors path="referenceRate"/>
                    </div>
                </div>


                <div class="form-group">
                    <div class="col-sm-9">
                        <button type="submit" class="btn btn-primary btn-block">Add transaction</button>
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
