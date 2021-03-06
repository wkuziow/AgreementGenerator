<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

    <title>Lista klientów dla admina</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/css/style.css"/>">
</head>
<body>

<%@include file="/WEB-INF/includes/header.jsp" %>
<div class="container">
    <div class="">
        <div class="">
            <table class="table-sm table-striped table-bordered table-hover">
                <thead class="">
                <tr>
                    <th>ID Klienta</th>
                    <th>Nazwa</th>
                    <th>NIP</th>
                    <th>REGON</th>
                    <th>Adres</th>
                    <th>Dane kontaktowe</th>
                    <th>Rachunek</th>
                    <th>Aktywność</th>
                    <th>Usunięty</th>
                    <th>Doradca</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="client" items="${allClientsForAdmin}">
                    <tr>
                        <td>${client.id}</td>
                        <td>${client.name}</td>
                        <td>${client.NIP}</td>
                        <td>${client.REGON}</td>
                        <td>${client.adress}</td>
                        <td>${client.contactInfo}</td>
                        <td>${client.account}</td>
                        <td>${client.active}

                            <c:choose>
                            <c:when test="${client.active == 'true'}">
                            <button type="button" class="btn btn-outline-danger">
                                <a href="/admin/client/${client.id}/disable">Dezaktywuj</a>
                                </c:when>
                                <c:otherwise>
                                <button type="button" class="btn btn-outline-success">
                                    <a href="/admin/client/${client.id}/enable">Aktywuj</a>
                                    </c:otherwise>
                                    </c:choose>
                                </button>

                        </td>
                        <td>${client.softDelete}</td>
                        <th>${client.user.fullname}</th>
                        <td>
                            <button type="button" class="btn btn-outline-primary">
                                <a href="/admin/client/update/${client.id}">Edytuj</a>
                            </button>

                            <button type="button" class="btn btn-outline-warning">
                                <a href="/admin/client/${client.id}/addTransaction">Dodaj transakcję</a>
                            </button>

                            <button type="button" class="btn btn-outline-warning">
                                <a href="/../client/${client.id}/allTransactions">Lista transakcji</a>
                            </button>


                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/includes/footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>

</html>
