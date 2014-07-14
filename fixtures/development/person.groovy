import monothil.Person
import monothil.Role

def ROLE_EXPERT = Role.findByAuthority(Role.ROLE_EXPERT)
def ROLE_ADMIN = Role.findByAuthority(Role.ROLE_ADMIN)

fixture {
    expert(Person, username: "expert", password: "1234", name: "Export User", email: "expert@example.com", roles: [ROLE_EXPERT])
    admin(Person, username: "admin", password: "1234", name: "Admin User", email: "admin@example.com", roles: [ROLE_ADMIN])
    expertadmin(Person, username: "expertadmin", password: "1234", name: "Export Admin User", email: "expertadmin@example.com", roles: [ROLE_EXPERT, ROLE_ADMIN])
}
