using System;
using System.Data.Entity.Migrations;
using System.Linq;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using WebApplication16.Models;

namespace WebApplication16.Migrations
{
    internal sealed class Configuration : DbMigrationsConfiguration<ApplicationDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(ApplicationDbContext context)
        {
            #region seed users and roles

            var store = new UserStore<ApplicationUser>(context);
            var manager = new UserManager<ApplicationUser>(store);

            var rolesnames = new[] {"Admin", "Citizen", "Student", "Role1", "Role2", "Role3", "Role4"};
            foreach (var rolename in rolesnames)
                context.Roles.AddOrUpdate(role => role.Name,
                    new IdentityRole(rolename));

            var usersnames = new[] {"Shahrani", "Riyadh", "Saleh", "student1", "citizen1"};

            foreach (var username in usersnames)
            {
                var idnumber = Guid.NewGuid().ToString();
                var user = new ApplicationUser
                {
                    UserName = username.ToLower(),
                    EmailConfirmed = false,
                    GivenName = "NoNameAvaiable.SeedData",
                    IdNumber = idnumber.Substring(0, 12),
                    PhoneNumber = "3213216546"
                };
                if (!context.Users.Any(u => u.UserName == username.ToLower()))
                    manager.Create(user, "123123");
            }

            #endregion
            
            #region seed request required data

            var refundscontext = new RefundDbContext();

            #region country

            if (!refundscontext.Country.Any(country => country.Name.ToLower() == "KSA"))
                refundscontext.Country.Add(new Country {Name = "KSA"});

            #endregion

            #region request types

            if (!refundscontext.RequestType.Any(type => type.Name == "Refund"))
                refundscontext.RequestType.Add(new RequestType {Name = "Refund", Description = "seedData"});
            if (!refundscontext.RequestType.Any(type => type.Name == "MisDeposit"))
                refundscontext.RequestType.Add(new RequestType {Name = "MisDeposit", Description = "seedData"});

            #endregion

           

            #region Required documents

            if (!refundscontext.RequiredDocument.Any(doc => doc.Name == "PhotoID"))
                refundscontext.RequiredDocument.Add(new RequiredDocument {Name = "PhotoID", Description = "seedData"});
            if (!refundscontext.RequiredDocument.Any(doc => doc.Name == "Reciept"))
                refundscontext.RequiredDocument.Add(new RequiredDocument {Name = "Reciept", Description = "seedData"});
            if (!refundscontext.RequiredDocument.Any(doc => doc.Name == "DeathCertificate"))
                refundscontext.RequiredDocument.Add(new RequiredDocument
                {
                    Name = "DeathCertificate",
                    Description = "seedData"
                });
            if (!refundscontext.RequiredDocument.Any(doc => doc.Name == "procuration"))
                refundscontext.RequiredDocument.Add(new RequiredDocument
                {
                    Name = "procuration",
                    Description = "seedData"
                });
            if (!refundscontext.RequiredDocument.Any(doc => doc.Name == "procuration"))
                refundscontext.RequiredDocument.Add(new RequiredDocument
                {
                    Name = "procuration",
                    Description = "seedData"
                });

            #endregion

            #region bank and bankaccount

            var bank = new Bank {Name = "SeedBank", Local = true};
            if (!refundscontext.Bank.Any())
            {
                refundscontext.Bank.Add(bank);
                refundscontext.BankAccount.Add(new BankAccount
                {
                    Name = "SeedBankAccount",
                    BankId = bank.Id,
                    IBAN = "SEEDIBAN"
                });
            }

            #endregion
            refundscontext.SaveChanges();
            #region request

            var citizen = context.Users.First(c => c.UserName.ToLower() == "citizen1");
            var employee = context.Users.First(c => c.UserName.ToLower() == "riyadh");
            var request = new Request
            {
                Amount = 999,
                ToBankAccount = refundscontext.BankAccount.First().Id,
                CitizenUserId = citizen.Id,
                CountryId = refundscontext.Country.First().Id,
                EmployeeUserId = employee.Id,
                ReferenceNumber = Guid.NewGuid(),
                Status =   RequestStatus.New,
                TypeId = refundscontext.RequestType.Single(t => t.Name == "refund").Id

            };

            refundscontext.Request.Add(request);
            #endregion

            refundscontext.SaveChanges();

            #endregion

            //var adminuser = new ApplicationUser {UserName = "admin"};
            //manager.Create(adminuser, "0t2m1m1");
            //manager.AddToRole(adminuser.Id, "Admin");
        }
    }
}