using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using DataAcessLayer;
using EntityLayer;

namespace BusinessLayer
{
    public class ListCustomersBAL
    {
        public SqlDataAdapter GetCustomersBAL(Users u)
        {
            ListCustomersDAL lc = new ListCustomersDAL();
            SqlParameter[] sp = new SqlParameter[1];
            //sp[0] = new SqlParameter("@plan", u.ProductType);
            SqlDataAdapter rd = lc.GetCustomersDAL();
            return rd;
        }
    }
}
