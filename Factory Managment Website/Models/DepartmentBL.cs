using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Factory_Managment_Website.Models
{
    public class DepartmentBL
    {
        Factory_Managment_DBEntities db = new Factory_Managment_DBEntities();
        public List<Department> GetDepartmentData()
        {
            return db.Department.ToList();
        }

        public Department GetDepartmentDataForUpdate(int departmentID)
        {
           return db.Department.Where(x => x.ID == departmentID).FirstOrDefault();

        }

        public void UpdateDepartment(Department department)
        {
            db.Entry(department).State = EntityState.Modified;
            db.SaveChanges();
        }

        public void AddNewDepartment(Department department)
        {
            db.Department.Add(department);
            db.SaveChanges();
        }

        public void DeleteDepartment(int departmentID)
        {
            var d = db.Department.Where(x => x.ID == departmentID).First();
            db.Department.Remove(d);
            db.SaveChanges();
        }
    }
}