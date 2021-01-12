using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Factory_Managment_Website.Models;         

namespace Factory_Managment_Website.Controllers
{
    public class EmployeeController : Controller
    {
        // GET: Employee
        EmployeeBL employeeBL = new EmployeeBL();
        public ActionResult Index()
        {
           // var EmployeesData = employeeBL.GetEmployees();
            //ViewBag.employees = EmployeesData;
            return View("EmployeesList");
        }

    }
}