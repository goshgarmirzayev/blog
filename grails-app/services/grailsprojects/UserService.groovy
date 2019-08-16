package grailsprojects

import com.blog.Comment
import com.blog.Post
import com.blog.User

import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.Paths


class UserService {


    def saveUser(params, byte[] data) {
        def path = ""
        if (data) {
            path = generateAvatarPath()
        }
        def user = new User(
                username: params.username,
                password: params.password,
                accountLocked: false,
                enabled: true,
                accountExpired: false,
                passwordExpired: false,
                fullname: params.fullname,
                avatarPath: path)
        user.save(flush: true, failOnError: true)
        writeAvatarToFile(path, data)
    }

    def edit(params, User user, byte[] data) {
        user.username = params.username
        user.fullname = params.fullname
        user.password = params.password
        deleteUserAvatar(user.avatarPath)
        user.avatarPath = ""
        if (data) {
            user.avatarPath = generateAvatarPath()
        }

        writeAvatarToFile(user.avatarPath, data)
        user.save(flush: true, failOnError: true)
    }

    def generateAvatarPath() {
        def path = UUID.randomUUID().toString() + ".jpg"
        return path
    }

    def writeAvatarToFile(String path, byte[] data) {
        if (data) {
            File f = new File(path)
            FileOutputStream fos = new FileOutputStream(f)
            fos.write(data)
            fos.close()
            Path move = Files.move(Paths.get(path), Paths.get("web-app/images/" + path))
        }
    }

    def deleteUserAvatar(String path) {
        try {
            Path delete = Files.delete(Paths.get("web-app/images/" + path))
        } catch (IOException e) {
            println("User avatar not found")
        }
    }

    def deleteUser(User user) {

        deleteUserComments(user)
        deleteUserAvatar(user.avatarPath)
        deleteUserPosts(user)
        user.delete(flush: true)



    }

    def deleteUserComments(User user) {
        def comments = Comment.findAllByUser(user)
        for (Comment comment : comments) {
            comment.delete()
        }
    }

    def deleteUserPosts(User user) {
        def posts = Post.findAllByAuthor(user)
        for (Post post : posts) {
            post.delete()
        }
    }

}
