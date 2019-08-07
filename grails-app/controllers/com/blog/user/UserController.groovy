package com.blog.user

import com.blog.Post
import grails.plugins.springsecurity.Secured
import org.apache.catalina.User

class UserController {
    def springSecurityService
    def userService

    def index() {}

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def profile() {
        def user = springSecurityService.currentUser
        def posts = Post.findByAuthor(springSecurityService.currentUser)
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
        def user = springSecurityService.currentUser
        String password = params.password
        String repassword = params.repass
        if (password.equals(repassword)) {
            userService.edit(params, user)
            redirect action: 'profile'
        } else {
            flash.message = "Passwords don't matched"
            redirect(action: 'editProfile')
        }
    }


}
