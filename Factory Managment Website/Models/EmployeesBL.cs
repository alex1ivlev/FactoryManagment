using System;
using System.Collections.Generic;
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
    }

}