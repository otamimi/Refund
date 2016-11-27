using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebApplication16.Models;

namespace WebApplication16.Controllers.Refund
{
    public class PayRollsController : Controller
    {
        private RefundDbContext db = new RefundDbContext();

        // GET: PayRolls
        public ActionResult Index()
        {
            var payRoll = db.PayRoll.Include(p => p.PayrollType);
            return View(payRoll.ToList());
        }

        // GET: PayRolls/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PayRoll payRoll = db.PayRoll.Find(id);
            if (payRoll == null)
            {
                return HttpNotFound();
            }
            return View(payRoll);
        }

        // GET: PayRolls/Create
        public ActionResult Create()
        {
            ViewBag.TypeId = new SelectList(db.PayrollType, "Id", "Name");
            return View();
        }

        // POST: PayRolls/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,EmployeeId,AuditorId,TypeId")] PayRoll payRoll)
        {
            if (ModelState.IsValid)
            {
                db.PayRoll.Add(payRoll);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.TypeId = new SelectList(db.PayrollType, "Id", "Name", payRoll.TypeId);
            return View(payRoll);
        }

        // GET: PayRolls/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PayRoll payRoll = db.PayRoll.Find(id);
            if (payRoll == null)
            {
                return HttpNotFound();
            }
            ViewBag.TypeId = new SelectList(db.PayrollType, "Id", "Name", payRoll.TypeId);
            return View(payRoll);
        }

        // POST: PayRolls/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,EmployeeId,AuditorId,TypeId")] PayRoll payRoll)
        {
            if (ModelState.IsValid)
            {
                db.Entry(payRoll).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TypeId = new SelectList(db.PayrollType, "Id", "Name", payRoll.TypeId);
            return View(payRoll);
        }

        // GET: PayRolls/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PayRoll payRoll = db.PayRoll.Find(id);
            if (payRoll == null)
            {
                return HttpNotFound();
            }
            return View(payRoll);
        }

        // POST: PayRolls/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PayRoll payRoll = db.PayRoll.Find(id);
            db.PayRoll.Remove(payRoll);
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
