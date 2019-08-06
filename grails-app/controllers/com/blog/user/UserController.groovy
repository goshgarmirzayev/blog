package com.blog.user

import com.blog.Post
import org.apache.catalina.User

class UserController {
    def springSecurityService
    def userService

    def index() {}

    def _loadCurrentUserPost() {
        def posts = Post.findAllByAuthor(springSecurityService.currentUser)
        [posts: posts]
    }

    def editProfile() {
        def user = springSecurityService.currentUser
        [user: user]
    }

    def edit() {
        def user = springSecurityService.currentUser
        userService.edit(params, user)
    }


}
