using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Factory_Managment_Website.Models
{
    public class ShiftBL
    {
        Factory_Managment_DBEntities db = new Factory_Managment_DBEntities();
        public List<Shift> GetShiftData()
        {
            return db.Shift.ToList();
        }

        public void AddNewShift(Shift shift)
        {
            db.Shift.Add(shift);
            db.SaveChanges();
        }
    }
}