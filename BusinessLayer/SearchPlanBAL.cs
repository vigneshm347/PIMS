using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAcessLayer;
using EntityLayer;
using System.Data;
using System.Data.SqlClient;

namespace BusinessLayer
{
    public class PlansBusiness
    {
        public SqlDataAdapter GetPlansBAL(Users u)
        {
            PlansDataAccess pda = new PlansDataAccess();
            SqlParameter[] sp = new SqlParameter[1];
            sp[0] = new SqlParameter("@plan", u.ProductType);
            SqlDataAdapter rd = pda.GetPlansDAL(sp);
            return rd;
        }
    }
}
