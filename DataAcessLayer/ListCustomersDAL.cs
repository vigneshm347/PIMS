using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;


namespace DataAcessLayer
{
    public class ListCustomersDAL
    {
        string connection = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con;
        /* Data Access Layer method to get the available policy */
        SqlDataAdapter rd;
        public SqlDataAdapter GetCustomersDAL()
        {
            try
            {
                con = new SqlConnection(connection);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_listCustomers";
                //cmd.Parameters.AddRange(s);
                rd = new SqlDataAdapter(cmd);
                con.Close();

            }
            catch
            {
                Console.WriteLine("Exception");
                con.Close();
            }

            return rd;
        }
    }
}
