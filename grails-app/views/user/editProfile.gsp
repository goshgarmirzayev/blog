<%--
  Created by IntelliJ IDEA.
  User: Goshgar
  Date: 7/26/2019
  Time: 3:04 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Edit Profile</title>
    <g:external dir="css" file="bootstrap.min.css"/>
</head>


<body>
<g:render template="/header/header"/>
<g:render template="/messages/message"/>
<div class="container" style="margin-top: 70px;">

    <g:uploadForm class="form-group col col-md-4 mx-auto" controller="user" action="edit">
        <label for="fullname">New Fullname*</label>
        <input name="fullname" type="text" id="fullname" class="form-control" value="${user?.fullname}" required>
        <br/>
        <label for="username">New Username*</label>
        <input name="username" type="text" id="username" class="form-control" required value="${user?.username}">
        <br/>
        <label for="password">New Password*</label>
        <input name="password" type="password" id="password" class="form-control" value="" required>
        <br/>
        <label for="repass">Retype new password*</label>
        <input name="repass" type="password" id="repass" class="form-control" required>
        <br/>
        <input type="file" class="btn btn-dark" name="avatar" accept="image/jpeg,image/png"
               value="${resource(dir: 'images', file: user?.avatarPath)}">
        <br/>
        <br/>

        <input type="submit" class="btn btn-primary">
    </g:uploadForm>

</div>

</body>
</html>