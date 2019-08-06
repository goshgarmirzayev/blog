function prepare() {
    document.getElementById("posts").style.display = "none";
    document.getElementById("users").style.display = "none";

}

function loadUsers() {
    var actionDiv = document.getElementById("action")
    document.getElementById("users").style.display = "block";
    document.getElementById("posts").style.display = "none";
    actionDiv.appendChild(document.getElementById('users'))
}

function loadPosts() {
    var actionDiv = document.getElementById("action")
    document.getElementById("posts").style.display = "block";
    document.getElementById("users").style.display = "none";

    actionDiv.appendChild(document.getElementById('posts'))
}