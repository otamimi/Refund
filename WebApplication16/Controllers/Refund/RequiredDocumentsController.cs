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
    public class RequiredDocumentsController : Controller
    {
        private RefundDbContext db = new RefundDbContext();

        // GET: RequiredDocuments
        public ActionResult Index()
        {
            return View(db.RequiredDocument.ToList());
        }

        // GET: RequiredDocuments/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RequiredDocument requiredDocument = db.RequiredDocument.Find(id);
            if (requiredDocument == null)
            {
                return HttpNotFound();
            }
            return View(requiredDocument);
        }

        // GET: RequiredDocuments/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: RequiredDocuments/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Description")] RequiredDocument requiredDocument)
        {
            if (ModelState.IsValid)
            {
                db.RequiredDocument.Add(requiredDocument);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(requiredDocument);
        }

        // GET: RequiredDocuments/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RequiredDocument requiredDocument = db.RequiredDocument.Find(id);
            if (requiredDocument == null)
            {
                return HttpNotFound();
            }
            return View(requiredDocument);
        }

        // POST: RequiredDocuments/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Description")] RequiredDocument requiredDocument)
        {
            if (ModelState.IsValid)
            {
                db.Entry(requiredDocument).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(requiredDocument);
        }

        // GET: RequiredDocuments/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RequiredDocument requiredDocument = db.RequiredDocument.Find(id);
            if (requiredDocument == null)
            {
                return HttpNotFound();
            }
            return View(requiredDocument);
        }

        // POST: RequiredDocuments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RequiredDocument requiredDocument = db.RequiredDocument.Find(id);
            db.RequiredDocument.Remove(requiredDocument);
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
