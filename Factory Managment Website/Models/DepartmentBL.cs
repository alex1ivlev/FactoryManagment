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
    }
}