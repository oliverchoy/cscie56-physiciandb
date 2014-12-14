import com.harvard.cscie56.Role
import com.harvard.cscie56.User
import com.harvard.cscie56.UserRole


class BootStrap {

    def init = { servletContext ->

        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

        def testUser = new User(username: 'me', password: 'password')
        testUser.save(flush: true)

        def adminUser = new User(username: 'admin', password: 'admin123')
        adminUser.save(flush: true)

        UserRole.create testUser, userRole, true
        UserRole.create adminUser, adminRole, true

        assert User.count() == 2
        assert Role.count() == 2
        assert UserRole.count() == 2
    }
    def destroy = {
    }
}
