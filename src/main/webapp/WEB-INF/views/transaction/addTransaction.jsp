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

<%@include file="/WEB-INF/includes/header.jsp" %>
<div class="container">
    <div class="d-flex justify-content-center">

        <form:form autocomplete="on" action="#" method="post"
                   modelAttribute="transaction">
            <h2 class="d-flex justify-content-center">Add transaction</h2>

            <div class="form-group row">
                <label for="amountId" class="col-sm-2 col-form-label">Amount: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="amount" id="amountId" placeholder="amount" class="form-control"/>
                    <form:errors path="amount" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="currencyId" class="col-sm-2 col-form-label">Currency: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="currency" id="currencyId"
                                placeholder="currency" class="form-control"/>
                    <form:errors path="currency" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="dateOfSignId" class="col-sm-2 col-form-label">Date of sign: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="dateOfSign" placeholder="dateOfSign" id="dateOfSignId"
                                class="form-control"/>
                    <form:errors path="dateOfSign" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="isActiveId" class="col-sm-2 col-form-label">Is Active: </label>
                <div class="col-sm-10">
                    <form:radiobuttons path="active" items="${isActiveList}" placeholder="isActive"
                                       id="isActiveId" class="form-control"/>
                    <form:errors path="active" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="hasValidDateId" class="col-sm-2 col-form-label">Has Valid Date: </label>
                <div class="col-sm-10">
                    <form:radiobuttons path="hasValidDate" items="${hasValidDate}" placeholder="hasValidDate"
                                       id="hasValidDateId" class="form-control"/>
                    <form:errors path="hasValidDate" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="validDateId" class="col-sm-2 col-form-label">Valid date: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="validDate" placeholder="validDate" id="validDateId"
                                class="form-control"/>
                    <form:errors path="validDate" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="collateralsdId" class="col-sm-2 col-form-label">Collaterals: </label>
                <div class="col-sm-10">
                    <form:textarea path="collaterals" id="collateralsdId"
                                   placeholder="collaterals"
                                   rows="5" cols="50" class="form-control"/>
                    <form:errors path="collaterals" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="administrationFeeId" class="col-sm-2 col-form-label">Administration fee: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="administrationFee" id="administrationFeeId"
                                placeholder="Administration fee" class="form-control"/>
                    <form:errors path="administrationFee" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="arrangementFeeId" class="col-sm-2 col-form-label">Arrangement Fee: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="arrangementFee" id="arrangementFeeId"
                                placeholder="Arrangement fee" class="form-control"/>
                    <form:errors path="arrangementFee" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="operationalFeeId" class="col-sm-2 col-form-label">Operational fee </label>
                <div class="col-sm-10">
                    <form:input type="text" path="operationalFee" id="operationalFeeId"
                                placeholder="Operational fee" class="form-control"/>
                    <form:errors path="operationalFee" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="marginId" class="col-sm-2 col-form-label">Margin: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="margin" id="marginId"
                                placeholder="margin" class="form-control"/>
                    <form:errors path="margin" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="referenceRateId" class="col-sm-2 col-form-label">Reference rate: </label>
                <div class="col-sm-10">
                    <form:select path="referenceRate" items="${referenceRateList}" id="referenceRateId"
                                 placeholder="Reference rate" class="custom-select"/>
                    <form:errors path="referenceRate" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="setUpFeeId" class="col-sm-2 col-form-label">Setup fee: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="setUpFee" id="setUpFeeId" class="form-control"/>
                    <form:errors path="setUpFee" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="repaymentAccountId" class="col-sm-2 col-form-label">Repayment Account: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="repaymentAccount" id="repaymentAccountId"
                                placeholder="repayment Account" class="form-control"/>
                    <form:errors path="repaymentAccount" cssClass="error"/>
                </div>
            </div>

            <button type="submit" class="btn btn-primary btn-block">Add transaction</button>


        </form:form>
    </div>
</div>
<%@include file="/WEB-INF/includes/footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>

</html>
