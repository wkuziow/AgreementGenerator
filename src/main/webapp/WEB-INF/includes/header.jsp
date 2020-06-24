<%--
  Created by IntelliJ IDEA.
  User: wojtek
  Date: 15.06.2020
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
    <nav class=" navbar navbar-expand-lg ">

        <a class="navbar-brand" href="/">Agreement Generator</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class=" collapse navbar-collapse" id="navbarSupportedContent">

            <ul class="navbar-nav mr-auto d-flex align-items-center">

                <c:choose>
                    <c:when test="${currentUserFullName != -1}">
                        <%@include file="/WEB-INF/main/welcome.jsp" %>
                        <%@include file="/WEB-INF/main/dashboard.jsp" %>
                    </c:when>
                    <c:otherwise>
                        <%@include file="/WEB-INF/main/login.jsp" %>
                    </c:otherwise>
                </c:choose>

                <li class="nav-item">
                    <a class="nav-link" href="/about">O aplikacji</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/contact">Kontakt</a>
                </li>


                <c:choose>
                    <c:when test="${currentUserFullName != -1}">
                        <li class="nav-item">
                            <a class="nav-link disabled" tabindex="-1" aria-disabled="true"
                               href="/register">Rejestracja</a>
                        </li>
                        <%@include file="/WEB-INF/main/logout.jsp" %>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" tabindex="-1" aria-disabled="true"
                               href="/register">Rejestracja</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>


        </div>


    </nav>
</div>
<%--



<nav class="navbar navbar-expand-lg navbar-light ">

    <a class="navbar-brand" href="#">Agreement Generator</a>

    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">

            <c:choose>
                <c:when test="${currentUserFullName != -1}">
                    <%@include file="/WEB-INF/main/welcome.jsp" %>
                    <%@include file="/WEB-INF/main/logout.jsp" %>
                    <%@include file="/WEB-INF/main/dashboard.jsp" %>
                </c:when>
                <c:otherwise>
                    <%@include file="/WEB-INF/main/login.jsp" %>
                </c:otherwise>
            </c:choose>

            <li class="nav-item">
                <a class="nav-link" href="/about">O aplikacji</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/contact">Kontakt</a>
            </li>

            <li class="nav-item">
                <a class="nav-link disabled" tabindex="-1" aria-disabled="true" href="/register">Rejestracja</a>
            </li>

        </ul>

    </div>
</nav>
--%>

