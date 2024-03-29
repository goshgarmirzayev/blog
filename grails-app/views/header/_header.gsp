<g:external dir="css" file="bootstrap.min.css"/>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>


<body>
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href="${createLink(controller: 'home', action: 'home')}">Navbar</a>
    <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarCollapse"
            aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="navbar-collapse collapse" id="navbarCollapse">

        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="${createLink(controller: 'home', action: 'home')}">Home</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="${createLink(controller: 'post', action: 'index')}">Blog</a>
            </li>
            <sec:ifLoggedIn>
                <li class="nav-item active">
                    <a class="nav-link" href="${createLink(controller: 'post', action: 'addPost')}">Add post</a>
                </li>
            </sec:ifLoggedIn>
            <li class="nav-item active">
                <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="#">Contact</a>
            </li>
            <sec:ifNotLoggedIn>
                <li class="nav-item-active">
                    <a class="nav-link" href="${createLink(controller: 'login', action: 'index')}">Sign in</a>
                </li>
                <li class="nav-item-active">
                    <a class="nav-link" href="${createLink(controller: 'register', action: 'index')}">Sign Up</a>
                </li>
            </sec:ifNotLoggedIn>

            <sec:ifLoggedIn>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        Profile Options
                    </a>

                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item"
                           href="${createLink(controller: 'user', action: 'profile')}">View Profile</a>
                        <a class="dropdown-item" href="${createLink(controller: 'logout', action: 'index')}">Logout</a>
                    </div>
                </li>
            </sec:ifLoggedIn>

        </ul>

        <g:form class="form-inline mt-2 mt-md-0" role="search" method="GET" controller="post" action="search">
            <input class="form-control mr-sm-2" type="search" name="q" placeholder="Search" aria-label="Search"
                   required="">
            <input class="btn btn-outline-success my-2 my-sm-0" type="submit" value="Search"/>
        </g:form>
    </div>

</nav>
</body>
