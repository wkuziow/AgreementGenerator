<%--
  Created by IntelliJ IDEA.
  User: wojtek
  Date: 10.06.2020
  Time: 11:09
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

    <title>Transaction list for admin</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/css/style.css"/>">
</head>
<body>
<%@include file="/WEB-INF/includes/header.jsp" %>
<%@include file="/WEB-INF/includes/sidePanel.jsp" %>

    <table>
        <tr>
            <th>ID</th>
            <th>Client</th>
            <th>Amount</th>
            <th>Currency</th>
            <th>Collaterals</th>
            <th>Date of sign</th>
            <th>Is Active</th>
            <th>Is terminated</th>
            <th>Termination date</th>
            <th>Has valid date</th>
            <th>Valid date</th>
            <th>Repayment account</th>
            <th>Reference rate</th>
            <th>Margin</th>
            <th>Fees</th>
        </tr>
        <c:forEach var="transaction" items="${allTransactionsForAdmin}">
            <tr>
                <td>${transaction.id}</td>
                <td>${transaction.client.name}</td>
                <td>${transaction.amount}</td>
                <td>${transaction.currency}</td>
                <td>${transaction.collaterals}</td>
                <td>${transaction.dateOfSign}</td>
                <td>${transaction.active}</td>
                <td>${transaction.terminated}</td>
                <td>${transaction.terminationDate}</td>
                <td>${transaction.hasValidDate}</td>
                <td>${transaction.validDate}</td>
                <td>${transaction.repaymentAccount}</td>
                <td>${transaction.referenceRate}</td>
                <td>${transaction.margin}</td>
                <td>${transaction.fees}</td>
                <td>
                    <a href="/client/${transaction.client.id}/showAgreement/${transaction.id}" target="_blank">Umowa</a>
                </td>
             <%--   <td>
                    <a href="/admin/client/update/${client.id}">Edit</a>
                </td> --%>
            </tr>
        </c:forEach>
    </table>

    <%@include file="/WEB-INF/includes/footer.jsp" %>



<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>

</html>
