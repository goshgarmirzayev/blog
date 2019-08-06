package grailsprojects

import com.blog.Comment
import com.blog.Post

class PostService {

    def static savePost(params, user) {
        def post = Post?.get(params?.getLong('id'))
        if (!post) {
            post = new Post()
        }
        post?.title = params?.title
        post?.content ="<span>"+params?.content+"</span>"
        post?.author = user
        post?.save(flush: true, failOnError: true)
        return post
    }

    def delete(params) {
        deleteAllComments(params.id)
        def post = Post.get(params.id)
        post.delete()

    }

    def deleteAllComments(id) {
        def post = Post.get(id)
        def comments = Comment.findAllByPost(post)
        for (Comment comment : comments) {
            comment.delete()
        }
    }
}
