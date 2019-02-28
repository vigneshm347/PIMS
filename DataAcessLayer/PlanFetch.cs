using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace DataAcessLayer
{
    public class PlanFetch
    {

        string connection = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con;
        public SqlDataReader GetPlans(SqlParameter[] s)
        {
            con = new SqlConnection(connection);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_ListPlans";
            cmd.Parameters.AddRange(s);
            SqlDataReader rd = cmd.ExecuteReader();
            return rd;
        }
    }
}
