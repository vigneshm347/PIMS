using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using EntityLayer;
using DataAcessLayer;
namespace BusinessLayer
{
    public class StatisticsBAL
    {
        public SqlDataAdapter StatsData()
        {
            StatisticsDAL s = new StatisticsDAL();
            /* calls the DAL method */
            SqlDataAdapter rd = s.GetStats();
            return rd;
        }
    }
}
