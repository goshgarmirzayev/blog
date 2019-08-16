package com.blog.user

import com.blog.Post
import grails.plugins.springsecurity.Secured

class UserController {
    def springSecurityService
    def userService

    def index() {}

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def profile() {
        def user = springSecurityService.currentUser
        def posts = Post.findAllByAuthor(springSecurityService.currentUser)
        [posts: posts,
         user : user
        ]

    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def _loadCurrentUserPost() {
        def posts = Post.findByAuthor(springSecurityService.currentUser)
        [posts: posts]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def editProfile() {
        def user = springSecurityService.currentUser
        [user: user]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def edit() {
        def file = request.getFile("avatar")
        byte[] data = file.getBytes()
        def user = springSecurityService.currentUser
        String password = params.password
        String repassword = params.repass
        if (password.equals(repassword)) {
            userService.edit(params, user, data)
            redirect action: 'profile'
        } else {
            flash.message = "Passwords don't matched"
            redirect(action: 'editProfile')
        }
    }

    def delete() {
        def user = springSecurityService.currentUser
        println(user.username)
        println(params.username)
        if (user.username.equals(params.username)) {
            redirect uri: "logout/"
            userService.deleteUser(user)
            flash.message = "Your account succesfully delete."
        } else {
            flash.message = "Password is incorrect"
            redirect action: 'profile'
        }
    }


}
