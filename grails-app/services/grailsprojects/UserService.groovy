package grailsprojects

import com.blog.Role
import com.blog.User
import com.blog.UserRole

class UserService {

    def springSecurityService

    def saveUser(params) {
        byte[] avatar = params.avatar

        FileWriter fr = new FileWriter(new File("images/" + params.avatar))

        fr.write(avatar)
        fr.close()
        def user = new User(
                username: params.username,
                password: params.password,
                accountLocked: false,
                enabled: true,
                accountExpired: false,
                passwordExpired: false,
                fullname: params.fullname,
                avatarPath: "images/ssl")
        user.save(flush: true, failOnError: true)

    }

    def edit(params, User user) {
        user.username = params.username
        user.fullname = params.fullname
        user.password = params.password
        user.save(flush: true, failOnError: true)
    }
}
