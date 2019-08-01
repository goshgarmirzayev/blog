<html>
<head>
    <meta name='layout' content='/_header.gsp'/>
    <title><g:message code="springSecurity.login.title"/></title>

</head>

<body>
<g:external dir="css" file="bootstrap.min.css"/>
<g:render template="/header/header"/>


<div class="container">
    <g:if test='${flash.message}'>
        <div class='alert-danger'>${flash.message}</div>
    </g:if>

    <form action='${postUrl}' method='POST' class='form-group mx-auto col-md-4' autocomplete='off'
          style="margin-top: 70px;">
        <label for='username'>Username:</label>
        <input type='text' class='form-control' name='j_username' id='username'/>
        <label for='password'>Password:</label>
        <input type='password' class='form-control' name='j_password' id='password'/>
        <input type='checkbox' class='form-check-input' name="Remember Me" id='remember_me'
               <g:if test='${hasCookie}'>checked='checked'</g:if> style="margin-left: 2px;"/>
        <label for='remember_me' style="margin-left: 16px;">Remembe Me</label>
        <br/>
        <input type='submit' id="submit" value='Log In'
               class="btn btn-primary"/>

    </form>

</div>

<script type='text/javascript'>
    <!--
    (function () {
        document.forms['loginForm'].elements['j_username'].focus();
    })();
    // -->
</script>
</body>
</html>
