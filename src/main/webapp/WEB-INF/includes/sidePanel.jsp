<%--
  Created by IntelliJ IDEA.
  User: wojtek
  Date: 15.06.2020
  Time: 19:41
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<ul>
    <sec:authorize access="hasRole('ADMIN')">
    <li>
        <a href="/admin/addClient">
            <span>Dodaj klienta</span>
        </a>
    </li>

    <li>
        <a href="/admin/allClients">
            <span>Lista klientów</span>
        </a>
    </li>

    <li>
        <a href="/admin/addUser">
            <span>Dodaj użytkownika</span>
        </a>
    </li>
    <li>
        <a href="/admin/allUsers">
            <span>Lista użytkowników</span>
        </a>
    </li>
    <li>
        <a href="/admin/allTransactions">
            <span>Lista transakcji</span>
        </a>
    </li>
    </sec:authorize>


    <li>
        <a href="/user/addClient">
            <span>Dodaj klienta</span>
        </a>
    </li>

    <li>
        <a href="/user/allClients">
            <span>Moi klienci</span>
        </a>
    </li>

</ul>
