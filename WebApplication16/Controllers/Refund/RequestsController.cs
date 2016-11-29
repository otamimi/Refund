using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.ApplicationServices;
using System.Web.Mvc;
using System.Web.Security;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using WebApplication16.Models;

namespace WebApplication16.Controllers.Refund
{
    public class RequestsController : Controller
    {
        private RefundDbContext db = new RefundDbContext();

        // GET: Requests
        public ActionResult Index()
        {
            var request = db.Request.Include(r => r.BankAccount).Include(r => r.BankAccount1).Include(r => r.Country).Include(r => r.PayRoll).Include(r => r.RequestType);
            return View(request.ToList());
        }

        // GET: Requests/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null) return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var request = db.Request.Find(id);
            if (request == null)
            {
                return HttpNotFound();
            }
            return View(request);
        }

        // GET: Requests/Create
        public ActionResult Create(RequestViewModel model)
        {
            model.Types = db.RequestType;
            model.Countries = db.Country;
            return View(model);
        }

        // POST: Requests/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Citizen, Student")]
        public ActionResult Create([Bind(Include = "TypeId,Amount,Note,CountryId,FromBankAccount,ToBankAccount")] Request request)
        {
            if (ModelState.IsValid)
            {
                var manager = HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
                request.CitizenUserId = User.Identity.GetUserId();

                request.ReferenceNumber = Guid.Empty;
                request.FromBankAccount = null;
                request.ToBankAccount = 0;
                db.Request.Add(request);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.FromBankAccount = new SelectList(db.BankAccount, "Id", "Name", request.FromBankAccount);
            ViewBag.ToBankAccount = new SelectList(db.BankAccount, "Id", "Name", request.ToBankAccount);
            ViewBag.CountryId = new SelectList(db.Country, "Id", "Name", request.CountryId);
            ViewBag.PayrollId = new SelectList(db.PayRoll, "Id", "Id", request.PayrollId);
            ViewBag.TypeId = new SelectList(db.RequestType, "Id", "Name", request.TypeId);
            return View(request);
        }

        // GET: Requests/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Request request = db.Request.Find(id);
            if (request == null)
            {
                return HttpNotFound();
            }
            ViewBag.FromBankAccount = request.BankAccount1.Name;
            ViewBag.ToBankAccount = request.BankAccount?.Name ??  string.Empty;
            ViewBag.CountryId = request.Country.Name;
            ViewBag.PayrollId = request.PayRoll?.Id.ToString() ?? string.Empty;
            ViewBag.TypeId = new SelectList(db.RequestType, "Id", "Name", request.TypeId);
            return View(request);
        }

        // POST: Requests/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Status,PayrollId,Amount,EmployeeUserId,Note,CountryId,FromBankAccount,ToBankAccount")] Request request)
        {
            if (ModelState.IsValid)
            {
                db.Entry(request).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.FromBankAccount = new SelectList(db.BankAccount, "Id", "Name", request.FromBankAccount);
            ViewBag.ToBankAccount = new SelectList(db.BankAccount, "Id", "Name", request.ToBankAccount);
            ViewBag.CountryId = new SelectList(db.Country, "Id", "Name", request.CountryId);
            ViewBag.PayrollId = new SelectList(db.PayRoll, "Id", "Id", request.PayrollId);
            ViewBag.TypeId = new SelectList(db.RequestType, "Id", "Name", request.TypeId);
            return View(request);
        }

        // GET: Requests/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Request request = db.Request.Find(id);
            if (request == null)
            {
                return HttpNotFound();
            }
            return View(request);
        }

        // POST: Requests/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Request request = db.Request.Find(id);
            db.Request.Remove(request);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
