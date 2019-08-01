package grailsprojects

import com.blog.Role
import com.blog.User
import com.blog.UserRole

class UserService {

    def saveUser(params) {
        def user = new User(
                username: params.username,
                password: params.password,
                accountLocked: false,
                enabled: true,
                accountExpired: false,
                passwordExpired: false,
                fullname: params.fullname)

        user.save(flush: true, failOnError: true)

    }
}
