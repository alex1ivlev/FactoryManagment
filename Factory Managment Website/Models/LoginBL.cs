using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;

namespace Factory_Managment_Website.Models
{
    public class LoginBL
    {
        Factory_Managment_DBEntities db = new Factory_Managment_DBEntities();

        public bool IsAuthenticated(string username, string password)
        {
            var query = db.User.Where(x => x.User_name == username && x.Password == password);
            var user = query.First();
            if (user.Timestamp?.ToString("yyyyMMdd") != DateTime.Now.ToString("yyyyMMdd"))
            {
                user.Num_of_actions = 20;
                user.Timestamp = DateTime.Now;
                db.SaveChanges();
            }

            return query.Count() != 0;
            
        }

        public string GetUserFullName(string username)
        { 
           return db.User.Where(n => n.User_name == username).First().Full_name;
           
        }

        public bool ReduceCredit(string username)
        {
            var user = db.User.Where(n => n.User_name == username).First();

            if (user.Num_of_actions == 0)
            {
                return false;
            }

            user.Num_of_actions--;
            db.SaveChanges();
            return true;
        }
    }

}