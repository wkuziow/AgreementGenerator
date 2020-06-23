<%--
  Created by IntelliJ IDEA.
  User: wojtek
  Date: 15.06.2020
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        AKCJE
    </a>
    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
        <sec:authorize access="hasRole('ADMIN')">
            <a class="dropdown-item" href="/admin/addClient">Dodaj klienta</a>
            <a class="dropdown-item" href="/admin/allClients">Lista klientów</a>
            <a class="dropdown-item" href="/admin/addUser">Dodaj użytkownika</a>
            <a class="dropdown-item" href="/admin/addAdmin">Dodaj admina</a>
            <a class="dropdown-item" href="/admin/allUsers">Lista użytkowników</a>
            <a class="dropdown-item" href="/admin/allTransactions">Lista transakcji</a>
            <div class="dropdown-divider"></div>
        </sec:authorize>

        <a class="dropdown-item" href="/user/addClient">Dodaj klienta</a>
        <a class="dropdown-item" href="/user/allClients">Moi klienci</a>
        <a class="dropdown-item" href="/user/allTransactions">Moje transakcje</a>
    </div>
</li>