using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace DataAcessLayer
{
    public class StatisticsDAL
    {
        string connection = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter rd;
        public SqlDataAdapter GetStats()
        {
            try
            {
                con = new SqlConnection(connection);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_AppStats";
                rd = new SqlDataAdapter(cmd);
                con.Close();
            }
            catch
            {
                Console.WriteLine("Exception");
            }
            return rd;
        }

    }
}
