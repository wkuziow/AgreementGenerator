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

    <title>Dodaj transakcję dla klienta</title>
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
            <h2 class="d-flex justify-content-center">Dodaj transakcję</h2>


            <div class="input-group mb-3">
                <label for="amountId" class="col-sm-2 col-form-label">Limit: </label>
                <form:input type="number" path="amount" id="amountId" placeholder="Wysokość limitu"
                            class="form-control" required="true"/>
                <form:errors path="amount" cssClass="error"/>
                <div class="input-group-append">
                    <span class="input-group-text">.00</span>
                </div>

            </div>

            <div class="form-group row">
                <label for="currencyId" class="col-sm-2 col-form-label">Waluta: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="currency" id="currencyId"
                                placeholder="waluta" class="form-control" required="true"/>
                    <form:errors path="currency" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="dateOfSignId" class="col-form-label">Data podpisania: </label>
                <div class="col-sm-10">
                    <form:input type="date" path="dateOfSign" placeholder="data podpisania" id="dateOfSignId"
                                class="form-control" required="true"/>
                    <form:errors path="dateOfSign" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="isActiveId" class="col-form-label">Czy aktywny: </label>
                <div class="col-sm-10">
                    <form:radiobuttons path="active" items="${isActiveList}" placeholder="isActive"
                                       id="isActiveId" class="form-control"/>
                    <form:errors path="active" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="hasValidDateId" class="col-form-label">Czy ma datę ważności: </label>
                <div class="col-sm-10">
                    <form:radiobuttons path="hasValidDate" items="${hasValidDate}" placeholder="hasValidDate"
                                       id="hasValidDateId" class="form-control" />
                    <form:errors path="hasValidDate" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="validDateId" class="col-form-label">Data ważności: </label>
                <div class="col-sm-10">
                    <form:input type="date" path="validDate" placeholder="validDate" id="validDateId"
                                class="form-control"/>
                    <form:errors path="validDate" cssClass="error"/>
                </div>
            </div>

            <div class="form-group row">
                <label for="collateralsdId" class="col-sm-2 col-form-label">Zabezpieczenia: </label>
                <div class="col-sm-10">
                    <form:textarea path="collaterals" id="collateralsdId"
                                   placeholder="zabezpieczenia"
                                   rows="5" cols="50" class="form-control" required="true"/>
                    <form:errors path="collaterals" cssClass="error"/>
                </div>
            </div>

            <div class="input-group mb-3">
                <label for="administrationFeeId" class="col-form-label">Prowizja administracyjna [%]: </label>
                <form:input type="number" path="administrationFee" id="administrationFeeId"
                            placeholder="prowizja administracyjna w procentach"
                            class="form-control" step="0.001"/>
                <form:errors path="administrationFee" cssClass="error"/>
                <div class="input-group-append">
                    <span class="input-group-text">%</span>
                </div>
            </div>

            <div class="input-group mb-3">
                <label for="arrangementFeeId" class=" col-form-label">Prowizja aranżacyjna [%]: </label>
                <form:input type="number" path="arrangementFee" id="arrangementFeeId"
                            placeholder="prowizja aranżacyjna w procentach" class="form-control" step="0.001"/>
                <form:errors path="arrangementFee" cssClass="error"/>
                <div class="input-group-append">
                    <span class="input-group-text">%</span>
                </div>
            </div>

            <div class="input-group mb-3">
                <label for="operationalFeeId" class="col-form-label">Prowizja operacyjna [%]: </label>

                <form:input type="text" path="operationalFee" id="operationalFeeId"
                            placeholder="prowizja operacyjna w procentach" class="form-control" step="0.001"/>
                <form:errors path="operationalFee" cssClass="error"/>
                <div class="input-group-append">
                    <span class="input-group-text">%</span>
                </div>

            </div>

            <div class="input-group mb-3">
                <label for="marginId" class="col-form-label">Marźa [%]: </label>

                <form:input type="number" path="margin" id="marginId"
                            placeholder="marża"  class="form-control" step="0.001" required="true"/>
                <form:errors path="margin" cssClass="error"/>
                <div class="input-group-append">
                    <span class="input-group-text">p.p. p.a.</span>
                </div>
            </div>

            <div class="form-group row">
                <label for="referenceRateId" class="col-sm-2 col-form-label">Stawka referencyjna: </label>
                <div class="col-sm-10">
                    <form:select path="referenceRate" items="${referenceRateList}" id="referenceRateId"
                                 placeholder="Stawka referencyjna" class="custom-select"/>
                    <form:errors path="referenceRate" cssClass="error"/>
                </div>
            </div>

            <div class="input-group mb-3">
                <label for="setUpFeeId" class="col-form-label">Prowizja przygotowawcza [%]:  </label>

                    <form:input type="number" path="setUpFee" placeholder="prowizja przygotowawcza w procentach"
                                id="setUpFeeId" class="form-control" step="0.001"/>
                    <form:errors path="setUpFee" cssClass="error"/>
                <div class="input-group-append">
                    <span class="input-group-text">%</span>
                </div>
            </div>

            <div class="form-group row">
                <label for="repaymentAccountId" class="col-sm-2 col-form-label">Rachunek do spłat: </label>
                <div class="col-sm-10">
                    <form:input type="text" path="repaymentAccount" id="repaymentAccountId"
                                placeholder="rachunek do spłat" class="form-control" required="true"/>
                    <form:errors path="repaymentAccount" cssClass="error"/>
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
