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

<header>
    <nav>
        <a href="/">
            Agreement <span>Generator</span>
        </a>
        <ul>
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


            <!--   <li class="nav-item ml-4">
                   <a class="nav-link color-header" href="/register">rejestracja</a>
   
               </li> -->

            <li>
                <a href="/about">o aplikacji</a>
            </li>

            <li>
                <a href="/contact">Kontakt</a>
            </li>


        </ul>
    </nav>
</header>
