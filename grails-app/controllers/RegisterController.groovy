import com.blog.User


class RegisterController {

    def userService

    def index() {
        def user = User.get(params.getLong("id"))
        [user: user]
    }

    def saveUser() {
        def file = request.getFile("avatar")
        byte[] data = file.getBytes()
        def tempUser = new User(
                username: params.username,
                password: params.password,
                accountLocked: false,
                enabled: true,
                accountExpired: false,
                passwordExpired: false,
                fullname: params.fullname,
                avatarPath: null)
        String password = params.password
        String repassword = params.repass
        if (password.equals(repassword)) {
            userService.saveUser(params, data)
            redirect(uri: '/login/auth')
        } else {
            render view: '/register/index', model: [user: tempUser]
            flash.message = "Passwords don't matched"
//            redirect(action: 'index')
        }


    }
}
