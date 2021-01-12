using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Factory_Managment_Website.Models
{
    public class LoginBL
    {
        Factory_Managment_DBEntities1 db = new Factory_Managment_DBEntities1();

        public bool IsAuthenticated(string username, string password)
        {
            var result = db.User_table.Where(x => x.User_name == username && x.Password == password);

            return result.Count() != 0;
        }


    }

}