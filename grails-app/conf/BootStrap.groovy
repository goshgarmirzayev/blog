import com.blog.Role
import com.blog.User
import com.blog.UserRole

class BootStrap {

    def init = { servletContext ->
//  def role=new Role(authority:"ADMIN").save(failOnError: true,flush: true)
//   def user=new  User(username: "goshgar",password: "12345",accountLocked: false,enabled:true,accountExpired:false,passwordExpired:false,fullname: "Goshgar Mirzayev").save(failOnError: true,flush: true)
//       new  UserRole(user:user,role:role).create()
    }
    def destroy = {
    }
}
