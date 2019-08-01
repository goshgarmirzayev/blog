<%--
  Created by IntelliJ IDEA.
  User: Goshgar
  Date: 7/26/2019
  Time: 3:04 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register to medium</title>
    <g:external dir="css" file="bootstrap.min.css"/>
</head>


<body>
<g:render template="/header/header"/>
<div class="container" style="margin-top: 70px;">
    <g:if test="${flash?.message}">
        ${flash.message}
    </g:if>
    <g:form class="form-group col col-md-4 mx-auto" controller="register" action="saveUser">
        <label for="fullname">Fullname*</label>
        <input name="fullname" type="text" id="fullname" class="form-control" value="${user?.fullname}" required>
        <br/>
        <label for="username">Username*</label>
        <input name="username" type="text" id="username" class="form-control" required value="${user?.username}">
        <br/>
        <label for="password">Password*</label>
        <input name="password" type="password" id="password" class="form-control" value="${user?.password}" required>
        <br/>
        <label for="repass">Retype Password*</label>
        <input name="repass" type="password" id="repass" class="form-control" required>
        <br/>
        <input type="submit" class="btn btn-primary">
    </g:form>

</div>

</body>
</html>