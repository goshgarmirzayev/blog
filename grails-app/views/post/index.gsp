<%@ page import="com.blog.User" %>
<!DOCTYPE html>
<html>
<head>

    <g:external dir="css" file="bootstrap.min.css"/>
    %{--    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">--}%
    %{--    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>--}%
    %{--    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>--}%
    <title>Our Blog's post</title>
</head>

<body>
<g:render template="/header/header"/>
<g:render template="/messages/message"/>
<g:each in="${posts}" var="post">
    <div class="container" style="margin-top: 70px;margin-bottom: 70px;">
        <div class="col col-md-6 mx-auto">
            <div class="card">
                <div class="card-body">
                    <h3>${post?.title}
                        <small>${post?.dateCreated.dateTimeString}</small>
                    </h3>
                    <h4>Writer:${post?.author?.fullname}</h4>

                    <div class="content">
                        <p>${post?.content?.length() > 100 ?
                                post?.content?.take(100) + '...' : post?.content}
                        </p>
                    </div>
                    <a href="${createLink(action: 'detail', id: post?.id)}"
                       class="btn btn-outline-success">More
                    </a>
                </div>
            </div>
        </div>
    </div>

</g:each>

</body>
</html>
