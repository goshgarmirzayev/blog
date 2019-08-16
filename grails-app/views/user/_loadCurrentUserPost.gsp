<div class="container">
    <g:if test="${posts}">
        <center><h3>
            Your Posts:
        </h3></center>
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
                                <p>${post?.content?.length() > 300 ?
                                        post?.content?.take(300) + '...' : post?.content}
                                </p>
                            </div>
                            <a href="${createLink(controller: 'post', action: 'detail', id: post?.id)}"
                               class="btn btn-outline-success">More
                            </a>
                        </div>
                    </div>
                </div>
            </div>

        </g:each>
    </g:if>
    <g:else>
        <center>
            <h3 class="mx-auto">You don't have any post</h3>
            <a href="${createLink(controller: 'post', action: 'addPost')}"
               class="btn btn-outline-primary">Create your own post</a>
        </center>
    </g:else>

</div>