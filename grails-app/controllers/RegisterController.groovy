import com.blog.User

class RegisterController {

    def userService

    def index() {
        def user = User.get(params.getLong("id"))
        [user: user]

    }

    def saveUser() {
        userService.saveUser(params)
        redirect(uri: '/login/auth')
    }
}
