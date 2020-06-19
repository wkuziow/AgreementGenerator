
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

    <title>Clientlist for admin</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/css/style.css"/>">
</head>
<body>
<%@include file="/WEB-INF/includes/header.jsp" %>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>NIP</th>
            <th>REGON</th>
            <th>Adres</th>
            <th>Contact info</th>
            <th>Account</th>
            <th>Is Active</th>
            <th>Deleted</th>
            <th>User</th>
        </tr>
        <c:forEach var="client" items="${allClientsForAdmin}">
            <tr>
                <td>${client.id}</td>
                <td>${client.name}</td>
                <td>${client.NIP}</td>
                <td>${client.REGON}</td>
                <td>${client.adress}</td>
                <td>${client.contactInfo}</td>
                <td>${client.account}</td>
                <td>${client.active}</td>
                <td>${client.softDelete}</td>
                <th>${client.user.fullname}</th>
                <td>
                    <a href="/admin/client/update/${client.id}">Edit</a>
                </td>
            </tr>
        </c:forEach>
    </table>

    <%@include file="/WEB-INF/includes/footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>

</html>
