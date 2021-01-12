using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Factory_Managment_Website.Models;

 namespace Factory_Managment_Website.Controllers
{
    public class LoginController : Controller
    {
        LoginBL loginBL = new LoginBL();

        // GET: Login
        public ActionResult Index()
        {
            return View("Login");
        }

        [HttpPost]
        public ActionResult GetLoginData(string username, string password)
        {

            bool isAuthenticated = loginBL.IsAuthenticated(username, password);

            if (isAuthenticated == true)
            {
                Session["authenticated"] = true;

                return RedirectToAction("HomePage");
            }
            else
            {
                return RedirectToAction("Index");
            }
        }

        
    }
}


