<%--
  Created by IntelliJ IDEA.
  User: Goshgar
  Date: 8/6/2019
  Time: 4:24 PM
--%>

<%@ page import="com.blog.post.PostController" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Profile</title>
    <g:external dir="css" file="bootstrap.min.css"/>

</head>

<body>
<g:render template="/header/header"/>
<g:render template="/messages/message"/>
<div class="container" style="margin-top: 70px;">
    <div class="col col-md-4 mx-auto col-sm">
        <div class="card">
            <g:if test="${user.avatarPath}">
                <img class="card-img-top img-thumbnail rounded-circle mx-auto" style="height: 150px;width: 150px;"
                     src="${resource(dir: 'images', file: user?.avatarPath)}"/>
            </g:if>
            <g:else>
                <img class="card-img-top img-thumbnail rounded-circle mx-auto" style="height: 150px;width: 150px;"
                     src="${resource(dir: 'images', file: 'avatars/default.jpg')}"/>
            </g:else>

            <div class="card-body">
                <h6>Fullname :${user?.fullname}</h6>
                <h6>Username :${user?.username}</h6>
                <a class="btn btn-primary btn-sm"
                   href="${createLink(controller: 'user', action: 'editProfile')}">Edit Profile</a>
                <button type="button" class="btn btn-danger btn-sm" data-toggle="modal"
                        data-target="#myModal">Delete Account</button>
            </div>
        </div>
    </div>
    <g:render template="/user/loadCurrentUserPost"/>
    <!--Modal Start Here-->
    <div class="modal fade" id="myModal" role="dialog" style="height: 200px;border-radius: 0px">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">

                <div class="modal-body">
                    <p>Please type your username</p>

                    <g:form controller="user" action="delete">
                        <input type="text" name="username" class="form-control">

                        <div class="modal-footer">
                       <input type="submit" value="Delete" class="btn btn-outline-danger btn-sm">
                          <button type="button" class="btn btn-outline-success btn-sm"
                           data-dismiss="modal">Cancel</button></g:form>
                </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

</div>

</div>
</body>
</html>