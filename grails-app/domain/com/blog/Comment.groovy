package com.blog

class Comment {
//    User user
//    Post post
    String content
    static belongsTo = [user: User,
                        post: Post]
    static constraints = {
        content nullable: false
    }
}
