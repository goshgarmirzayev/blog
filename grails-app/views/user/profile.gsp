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
<div class="container" style="margin-top: 70px;">
    <div class="col col-md-4 mx-auto col-sm">
        <div class="card">
            <g:if test="${user.avatarPath}">
                <img class="card-img-top img-thumbnail rounded-circle mx-auto" style="height: 150px;width: 150px;"
                     src="${resource(dir: 'images', file: user?.avatarPath)}"/>
            </g:if>
            <g:else>
                <img class="card-img-top img-thumbnail rounded-circle mx-auto" style="height: 150px;width: 150px;"
                     src="${resource(dir: 'images', file: 'default.jpg')}"/>
            </g:else>

            <div class="card-body">
                <h6>Fullname :${user.fullname}</h6>
                <h6>Username :${user.username}</h6>
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
                    <p>Please type your password!</p>
                </div>

                <g:form action="delete">
                    <div class="modal-content">
                        <input type="password" name="password" class="btn">
                    </div>

                    <div class="modal-footer">
                        <g:link controller="post" action="removePost" id="${user?.id}"
                                class="btn btn-outline-danger btn-sm">Yes</g:link>
                        <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">No</button>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>
</div>

</div>

</div>
</body>
</html>