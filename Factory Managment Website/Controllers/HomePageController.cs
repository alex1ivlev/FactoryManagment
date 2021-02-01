using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Factory_Managment_Website.Models;

namespace Factory_Managment_Website.Controllers
{
    public class HomePageController : Controller
    {
        // GET: HomePage
        private LoginBL loginBl = new LoginBL();
        public ActionResult Index()
        {
            ViewBag.FullName = loginBl.GetUserFullName((string) Session["username"]);
            Session["fullname"] = ViewBag.FullName;
            return View();
        }

        public ActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index", "Login");
        }
    }
}