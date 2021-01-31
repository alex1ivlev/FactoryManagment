using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Factory_Managment_Website.Models
{
    public class EmployeesBL
    {
        Factory_Managment_DBEntities db = new Factory_Managment_DBEntities();


        public List<Employee> GetEmployees()
        {
            return db.Employee.ToList();
        }
        public Employee Get(int employeeID)
        {
            return db.Employee.Where(x => x.ID == employeeID).FirstOrDefault();

        }

        public void UpdateEmployee(Employee employee)
        {
            db.Entry(employee).State = EntityState.Modified;
            db.SaveChanges();
        }

        public List<Employee> SearchEmp(string searchName)
        {
            return db.Employee.Where(p => p.First_name.Contains(searchName) || p.Last_name.Contains(searchName) ).ToList();
        }
        public void DeleteEmployee(Employee employee)
        {
            db.Entry(employee).State = EntityState.Deleted;
            db.SaveChanges();
        }
        
        public void AddNewShiftToEmployee(Employee_Shift shift)
        {
             db.Employee_Shift.Add(shift);
             db.SaveChanges();
        }

    }



}