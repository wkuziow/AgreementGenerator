<%--
  Created by IntelliJ IDEA.
  User: wojtek
  Date: 15.06.2020
  Time: 18:18
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<li class="nav-item">
    <a class="nav-link" href="#">Witaj! ${currentUserFullName}</a>
</li>