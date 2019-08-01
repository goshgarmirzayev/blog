<!DOCTYPE html>
<html>
<head>
    <title>Create New Post</title>
    <g:external dir="css" file="bootstrap.min.css"/>
    <ckeditor:resources/>
</head>

<body>
<g:render template="/header/header"/>
<div class="card" style="margin-top: 70px">
    <g:form action="savePost" id="${params?.id}" class="form-group col col-md-8 mx-auto" >
        <label>Title*</label>
        <input type="text" name="title" class="form-control" value="${post?.title}" required>
        <br>
        <label>Content*</label>
        <ckeditor:editor name="content" height="300" width="100%">
            ${post?.content}
        </ckeditor:editor>
        <br>
        <ckeditor:resources/>

        <input type="submit" value="Save" class="btn btn-primary">
    </g:form>
</div>

</body>
</html>
