using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DataAcessLayer
{
    public class AddPolicyDetailDAL
    {
        string connection = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter rd;
        public int insert_policy(SqlParameter[] s)
        {
            try
            {
                con = new SqlConnection(connection);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_AddPolicy";
                cmd.Parameters.AddRange(s);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch
            {
                Console.WriteLine("Exception");
                con.Close();
            }
            return 0;
        }
    }
}
