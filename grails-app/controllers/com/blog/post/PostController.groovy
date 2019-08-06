package com.blog.post

import com.blog.Comment
import com.blog.Post
import grails.plugins.springsecurity.Secured
import org.hibernate.QueryException


class PostController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def postService
    static def springSecurityService

    def index() {
        def posts = Post.list()
        [posts: posts]

    }

    def loadCurrentUserPost() {
        def posts = Post.findAllByAuthor(springSecurityService.currentUser)
        [posts: posts]

    }

    def search() {
        try {
            def posts = Post.executeQuery("from com.blog.Post where content like '%" + params.q + "%'")
            println(posts)
            if (posts) {
                render(view: '/post/index', model: [posts: posts])

            } else {
                flash.message = "Post Not Found"
                redirect(action: 'index')
            }
        } catch (QueryException) {
            flash.message = "We cannot search for this keyword"
            redirect(action: 'index')
        }
    }

    def notFound() {

    }

    def detail(Long id) {
        def post = Post.get(id)
        if (!post) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'post.label', default: 'Post'), id])
            redirect action: 'notFound'

        } else {
            def comments = Comment.list();
            for (int i = 0; i < comments.size(); i++) {
                if (comments.get(i).post.id != id) {
                    comments.remove(i)
                }
            }
            [comments: comments,
             post    : post
            ]

        }


    }


    @Secured(['IS_AUTHENTICATED_FULLY'])
    def addPost() {
        def post = Post?.get(params?.getLong('id'))
        [post: post]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def removePost() {
        postService.delete(params)
        flash.message = "Post succesfully deleted"
        redirect(action: 'index')
    }

    def savePost() {
        def user = springSecurityService.currentUser
        def post = postService.savePost(params, user)
        if (post) {
            redirect(action: "detail", id: post.id)
            return
        } else {
            flash.message = message(code: 'default.created.message', args: [message(code: 'post.label', default: 'Post'), post.id])
            redirect(action: "detail", id: post.id)
        }

    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def addComment() {
        Comment comment = new Comment()
        comment.user = springSecurityService.currentUser
        comment.post = Post.get(params.postId)
        comment.content = params.content
        comment.save(flush: true, failOnError: true)
        redirect(uri: '/post/detail/' + params.postId)
    }

}
