using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Factory_Managment_Website.Models;

namespace Factory_Managment_Website.Controllers
{
    public class ShiftController : Controller
    {
        // GET: Shift
        ShiftBL shiftBL = new ShiftBL();
        public ActionResult GetShiftList()
        {
            var ShiftData = shiftBL.GetShiftData();
            ViewBag.shifts = ShiftData;
            return View("ShiftList");
        }
    }
}