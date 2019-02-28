using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using DataAcessLayer;
using EntityLayer;

namespace BusinessLayer
{
    public class UserAuthBAL
    {
        int i = 0;
        public int UserAuth(Users u)
        {
            SqlParameter[] sp = new SqlParameter[2];
            UserAuthDAL ua = new UserAuthDAL();
            sp[0] = new SqlParameter("@id", u.UserID);
            sp[1] = new SqlParameter("@pass", u.UserPassword);
            /* calls the DAL method */
            i=ua.UserLogin(sp);
            return i;
        }
    }
}
