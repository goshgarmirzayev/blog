package com.blog

class Comment {
    User user
    Post post
    String content
    static constraints = {
        content nullable: false
    }
}
