package com.blog

import grails.plugins.springsecurity.Secured


class PostController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def postService
    static def springSecurityService

    def index() {
        def posts
        if (params.q) {
        }
        def query = params.q
        posts = Post.executeQuery("from com.blog.Post where content like '%" + query + "%'")
        if (posts) {
            [posts: posts]

        } else {
            flash.message = "Post Not found"
            posts = Post.list()
            [posts: posts]
        }
    }


    def detail(Long id) {
        def post = Post.get(id)
        def comments = Comment.list();
        for (int i = 0; i < comments.size(); i++) {
            if (comments.get(i).post.id != id) {
                comments.remove(i)
            }
        }
        println(comments)
        if (!post) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'post.label', default: 'Post'), id])
            redirect(action: "detail")
            return
        }
        [comments: comments,
         post    : post
        ]

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
