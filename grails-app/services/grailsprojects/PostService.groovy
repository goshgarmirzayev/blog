package grailsprojects

import com.blog.Post

class PostService {

    def static savePost(params, user) {
        def post = Post?.get(params?.getLong('id'))
        if (!post) {
            post = new Post()
        }
        post?.title = params?.title
        post?.content = params?.content
        post?.author = user
        post?.save(flush: true, failOnError: true)
        return post
    }

    def delete(params) {
        def post = Post.get(params.id)
        post.delete()

    }

}
