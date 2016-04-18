using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using prestamos.Models;

namespace prestamos.Controllers
{
    public class ActivosController : Controller
    {
        private Model1Container db = new Model1Container();

        // GET: Activos
        public ActionResult Index()
        {
            return View(db.Activos.ToList());
        }

        // GET: Activos/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Activos activos = db.Activos.Find(id);
            if (activos == null)
            {
                return HttpNotFound();
            }
            return View(activos);
        }

        // GET: Activos/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Activos/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Placa,categoria,Marca,Estado,Prestable")] Activos activos)
        {
            if (ModelState.IsValid)
            {
                db.Activos.Add(activos);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(activos);
        }

        // GET: Activos/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Activos activos = db.Activos.Find(id);
            if (activos == null)
            {
                return HttpNotFound();
            }
            return View(activos);
        }

        // POST: Activos/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Placa,categoria,Marca,Estado,Prestable")] Activos activos)
        {
            if (ModelState.IsValid)
            {
                db.Entry(activos).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(activos);
        }

        // GET: Activos/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Activos activos = db.Activos.Find(id);
            if (activos == null)
            {
                return HttpNotFound();
            }
            return View(activos);
        }

        // POST: Activos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Activos activos = db.Activos.Find(id);
            db.Activos.Remove(activos);
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
