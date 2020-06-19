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


<form:form autocomplete="on" action="#" method="post"
           modelAttribute="transaction">
    <h2>Add transaction</h2>
    <label for="amountId">Amount: </label>
    <form:input type="text" path="amount" id="amountId" placeholder="amount"/>
    <form:errors path="amount"/>


    <label for="currencyId">Currency: </label>
    <form:input type="text" path="currency" id="currencyId"
                placeholder="currency"/>
    <form:errors path="currency"/>

    <label for="dateOfSignId">Date of sign: </label>
    <form:input type="text" path="dateOfSign" placeholder="dateOfSign" id="dateOfSignId"/>
    <form:errors path="dateOfSign"/>

    <label for="isActiveId">Is Active: </label>
    <form:radiobuttons path="active" items="${isActiveList}" placeholder="isActive"
                       id="isActiveId"/>
    <form:errors path="active"/>

    <label for="hasValidDateId">Has Valid Date: </label>
    <form:radiobuttons path="hasValidDate" items="${hasValidDate}" placeholder="hasValidDate"
                       id="hasValidDateId"/>
    <form:errors path="hasValidDate"/>

    <label for="validDateId">Valid date: </label>
    <form:input type="text" path="validDate" placeholder="validDate" id="validDateId"/>
    <form:errors path="validDate"/>

    <label for="collateralsdId">Collaterals: </label>
    <form:textarea path="collaterals" id="collateralsdId"
                   placeholder="collaterals"
                   rows="5" cols="50"/>
    <form:errors path="collaterals"/>

    <label for="administrationFeeId">Administration fee: </label>
    <form:input type="text" path="administrationFee" id="administrationFeeId"
                placeholder="Administration fee"/>
    <form:errors path="administrationFee"/>

    <label for="arrangementFeeId">Arrangement Fee: </label>
    <form:input type="text" path="arrangementFee" id="arrangementFeeId"
                placeholder="Arrangement fee"/>
    <form:errors path="arrangementFee"/>

    <label for="operationalFeeId">Operational fee </label>
    <form:input type="text" path="operationalFee" id="operationalFeeId"
                placeholder="Operational fee"/>
    <form:errors path="operationalFee"/>

    <label for="marginId">Margin: </label>
    <form:input type="text" path="margin" id="marginId"
                placeholder="margin"/>
    <form:errors path="margin"/>

    <label for="referenceRateId">Reference rate: </label>
    <form:select path="referenceRate" items="${referenceRateList}" id="referenceRateId"
                 placeholder="Reference rate"/>
    <form:errors path="referenceRate"/>

    <label for="setUpFeeId">Setup fee: </label>
    <form:input type="text" path="setUpFee" id="setUpFeeId"/>
    <form:errors path="setUpFee"/>

    <label for="repaymentAccountId">Repayment Account: </label>
    <form:input type="text" path="repaymentAccount" id="repaymentAccountId"
                placeholder="repayment Account"/>
    <form:errors path="repaymentAccount"/>

    <button type="submit">Add transaction</button>


</form:form>
<%@include file="/WEB-INF/includes/footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>

</html>
