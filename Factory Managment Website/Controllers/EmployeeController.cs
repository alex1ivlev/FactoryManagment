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
        DepartmentBL departmentBL = new DepartmentBL();
        private LoginBL loginBl = new LoginBL();
        public ActionResult Edit(int Id)
        {
            var selectedEmp = employeeBL.Get(Id);

            ViewBag.departments = new SelectList( departmentBL.GetDepartmentData(),"ID","Name");

            return View("EditEmployee", selectedEmp);
        }

        [HttpPost]
        public ActionResult Edit(Employee selectedEmp)
        {
            //reducing the credit from the User Credits
            if (loginBl.ReduceCredit((string) Session["username"]) == false)
            {
                return RedirectToAction("Logout", "HomePage");
            }
            
            employeeBL.UpdateEmployee(selectedEmp);

            return RedirectToAction("GetEmployeeList");
        }

        [HttpPost]
        public ActionResult Search(string searchName)
        {
            //reducing the credit from the User Credits
            if (loginBl.ReduceCredit((string) Session["username"]) == false)
            {
                return RedirectToAction("Logout", "HomePage");
            }

            var EmployeesData = employeeBL.SearchEmp(searchName);
            ViewBag.employees = EmployeesData;
            return View("EmployeesList");
        }
        
        public ActionResult Delete(int Id)
        {
            var selectedEmp = employeeBL.Get(Id);

            return View("DeleteEmployee", selectedEmp);
        }
        [HttpPost]
        public ActionResult Delete(Employee selectedEmp)
        {
            //reducing the credit from the User Credits
            if (loginBl.ReduceCredit((string) Session["username"]) == false)
            {
                return RedirectToAction("Logout", "HomePage");
            }

            employeeBL.DeleteEmployee(selectedEmp);

            return RedirectToAction("GetEmployeeList");
        }

        private ShiftBL shiftBL = new ShiftBL();
        public ActionResult AddShiftToEmployee(int Id)
        {
            ViewBag.shifts = new SelectList(shiftBL.GetShiftData(), "ID", "ID");
            Employee_Shift model = new Employee_Shift();
            model.Employee_ID = Id;
            return View("AddNewShift", model);
        }

        [HttpPost]
        public ActionResult AddShiftToEmployee(Employee_Shift employeeShift)
        {
            //reducing the credit from the User Credits
            if (loginBl.ReduceCredit((string) Session["username"]) == false)
            {
                return RedirectToAction("Logout", "HomePage");
            }

            employeeBL.AddNewShiftToEmployee(employeeShift);
            return RedirectToAction("GetEmployeeList");
        }
        
    }
    }
