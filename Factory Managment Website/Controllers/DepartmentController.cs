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
        { //reducing the credit from the User Credits
            if (loginBl.ReduceCredit((string) Session["username"]) == false)
            {
                return RedirectToAction("Logout", "HomePage");
            }
            
            departmentBL.UpdateDepartment(selectedDepartment);

            return RedirectToAction("GetDepartmentList");

        }

        public ActionResult Add()
        {
            return View("NewDepartment");
        }
        private LoginBL loginBl = new LoginBL();
        [HttpPost]
        public ActionResult New(Department dept)
        {
            //reducing the credit from the User Credits
            if (loginBl.ReduceCredit((string) Session["username"]) == false)
            {
                return RedirectToAction("Logout", "HomePage");
            }

            departmentBL.AddNewDepartment(dept);

            var DepartmentData = departmentBL.GetDepartmentData();

            ViewBag.departments = DepartmentData;

            return RedirectToAction("GetDepartmentList");
        }

        public ActionResult Delete(int Id)
        {
            //reducing the credit from the User Credits
            if (loginBl.ReduceCredit((string) Session["username"]) == false)
            {
                return RedirectToAction("Logout", "HomePage");
            }
            departmentBL.DeleteDepartment(Id);

            return RedirectToAction("GetDepartmentList");
        }
    }
}