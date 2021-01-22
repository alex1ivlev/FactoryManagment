using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Factory_Managment_Website.Models;

namespace Factory_Managment_Website.Controllers
{
    public class DepartmentController : Controller
    {
        // GET: Department
        DepartmentBL departmentBL = new DepartmentBL();
        public ActionResult GetDepartmentList()
        {
            var DepartmentData = departmentBL.GetDepartmentData();
            ViewBag.departments = DepartmentData;
            return View("DepartmentList");
        }

        public ActionResult Edit(int Id)
        {
            var selectedDepartment = departmentBL.GetDepartmentDataForUpdate(Id);

            return View("EditDepartment", selectedDepartment);
        }

        
        [HttpPost]
        public ActionResult Edit(Department selectedDepartment)
        {
            departmentBL.UpdateDepartment(selectedDepartment);

            var DepartmentData = departmentBL.GetDepartmentData();

            ViewBag.departments = DepartmentData;

            return RedirectToAction("GetDepartmentList");

        }
    }
}