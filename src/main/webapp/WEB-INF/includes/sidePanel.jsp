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
    <li>
        <a href="/admin/addClient">
            <span>Dodaj klienta</span>
        </a>
    </li>
    <li>
        <a href="/app/schedules">
            <span>Plany</span>
        </a>
    </li>
    <li>
        <a href="/app/editUserData">
            <span>Edytuj dane</span>
        </a>
    </li>
    <li>
        <a href="/app/editPassword">
            <span>Zmień hasło</span>
        </a>
    </li>
    <li>
        <a href="/app/supAdmUser">
            <span>Użytkownicy</span>
        </a>
    </li>
</ul>
