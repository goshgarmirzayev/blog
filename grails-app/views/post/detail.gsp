<!DOCTYPE html>
<html>
<head>
    <g:external dir="css" file="bootstrap.min.css"/>
    <title>${post.title}|Medium</title>
</head>

<body>
<g:render template="/header/header"/>
<div class="container" style="
margin-top: 70px">
    <div class=" col-md-10 mx-auto">
        <div class="card">
            <div class="card-body">

                <h3>${post.title}
                    <small>${post?.dateCreated}</small>
                </h3>
                <h4>Written by:${post?.author?.fullname}</h4>

                <p>${post?.content}</p>
                <br>
                <g:if test="${com.blog.PostController.springSecurityService.currentUser == post.author}">

                    <g:link controller="post" action="addPost" id="${post?.id}"
                            class="btn btn-warning btn-sm">Edit</g:link>
                    <button type="button" class="btn btn-danger btn-sm" data-toggle="modal"
                            data-target="#myModal">Delete</button>

                </g:if>

            </div>
        </div>
        <br>
        <sec:ifLoggedIn>
            <h3>Add Comment:</h3>

            <hr>
            <br>
            <g:form controller="post" action="addComment" class="form-group" method="post">
            %{--    <input type="text" name="content" class="form-control">--}%
                <textarea class="form-control" name="content"></textarea>
                <input type="hidden" name="postId" value="${post.id}">
                </br>
                <input type="submit" value="Add Comment" class="btn btn-primary">
            </g:form>

        </sec:ifLoggedIn>


        <h3>Comments:</h3>
        <g:each in="${comments}" var="comment">
            <h6>${comment?.user?.fullname}</h6>

            <p style="margin-left: 20px;">${comment?.content}</p>
            <hr>
        </g:each>
    </div>
</div>

<!-Modal Code Start Here-!>


<!-- Trigger the modal with a button -->


<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog" style="height: 200px;border-radius: 0px">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-body">
                <p>Are you sure?</p>
            </div>

            <div class="modal-footer">
                <g:link controller="post" action="removePost" id="${post?.id}"
                        class="btn btn-outline-danger btn-sm">Yes</g:link>
                <button type="button" class="btn btn-outline-secondary btn-sm" data-dismiss="modal">No</button>
            </div>
        </div>
    </div>
</div>
</div>

</body>
</html>
