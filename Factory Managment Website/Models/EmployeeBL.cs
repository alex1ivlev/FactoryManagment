using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Factory_Managment_Website.Models
{
    public class EmployeeBL
    {
        Factory_Managment_DBEntities1 db = new Factory_Managment_DBEntities1();

        public List<Employees> GetEmployees() => db.Employee_table.ToList();
    }
}