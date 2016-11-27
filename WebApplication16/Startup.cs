using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin;
using Owin;
using WebApplication16.Models;

[assembly: OwinStartup(typeof(WebApplication16.Startup))]
namespace WebApplication16
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
           // CreateRolesandUsers();
        }


        // In this method we will create default User roles and Admin user for login   
        private void CreateRolesandUsers()
        {
            ApplicationDbContext context = new ApplicationDbContext();

            var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
            var userManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));


            // In Startup iam creating first Admin Role and creating a default Admin User    
            if (!roleManager.RoleExists("Admin"))
            {

                // first we create Admin rool   
                var role = new IdentityRole {Name = "Admin"};
                roleManager.Create(role);

                //Here we create a Admin super user who will maintain the website                  

                var user = new ApplicationUser
                {
                    UserName = "osama",
                    Email = "omtamimi@imamu.edu.sa",

                };
                var chkUser = userManager.Create(user, "1qa@WS3ed");

                //Add default User to Role Admin   
                if (chkUser.Succeeded)
                {
                    userManager.AddToRole(user.Id, "Admin");

                }
            }

            // creating Creating citizen role    
            if (!roleManager.RoleExists("Citizen"))
            {
                var role = new IdentityRole {Name = "Citizen"};
                roleManager.Create(role);

            }

            // creating Creating student role    
            if (!roleManager.RoleExists("Student"))
            {
                var role = new IdentityRole { Name = "Student" };
                roleManager.Create(role);

            }

            // creating Creating Manager role    
            if (!roleManager.RoleExists("Role1"))
            {
                var role = new IdentityRole { Name = "Role1" };
                roleManager.Create(role);

            }

            // creating Creating Employee role    
            if (!roleManager.RoleExists("Role2"))
            {
                var role = new IdentityRole { Name = "Role2" };
                roleManager.Create(role);

            }

            // creating Creating Manager role    
            if (!roleManager.RoleExists("Role3"))
            {
                var role = new IdentityRole { Name = "Role3" };
                roleManager.Create(role);

            }


            // creating Creating Manager role    
            if (!roleManager.RoleExists("Role4"))
            {
                var role = new IdentityRole { Name = "Role4" };
                roleManager.Create(role);

            }

        }
    }
}
