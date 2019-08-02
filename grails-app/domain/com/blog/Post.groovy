package com.blog

import java.awt.Image

class Post {
    String title
    String content
    Date dateCreated
    static belongsTo = [author: User]
    static constraints = {
        title nullable: true, blank: true, maxSize: 20
        content nullable: true, blank: true
    }

    static mapping = {
        content type: 'text'
    }

}
