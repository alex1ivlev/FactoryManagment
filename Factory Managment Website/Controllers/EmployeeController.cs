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
        EmployeesBL employeeBL = new EmployeesBL();
        public ActionResult GetEmployeeList()
        {
           var EmployeesData = employeeBL.GetEmployees();
           ViewBag.employees = EmployeesData;
           return View("EmployeesList");
        }

        public ActionResult Edit(int Id)
        {
            var selectedEmp = employeeBL.GetEmployeeForUpdate(Id);

            return View("EditEmployee", selectedEmp);
        }

        [HttpPost]
        public ActionResult Edit(Employee selectedEmp)
        {
            employeeBL.UpdateEmployee(selectedEmp);

            var EmployeesData = employeeBL.GetEmployees();
            ViewBag.employees = EmployeesData;
            return View("EmployeesList");

        }
        
        public ActionResult Search(string searchName)
        {
            employeeBL.SearchEmp(searchName);
            return View("SearchResults");
        }
    }
}