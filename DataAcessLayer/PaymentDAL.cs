using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DataAcessLayer
{
    public class PaymentDAL
    {
        string connection = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter rd;
        public int RecordPay(SqlParameter[] s)
        {
            int i = 0;
            try
            {
                con = new SqlConnection(connection);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_RecordPayment";
                cmd.Parameters.AddRange(s);
                i = cmd.ExecuteNonQuery();
                con.Close();
            }
            catch
            {
                Console.WriteLine("Exception");
                con.Close();

            }
            return i;

        }
        public SqlDataAdapter GenerateReciept(SqlParameter[] s)
        {
            try
            {
                con = new SqlConnection(connection);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_GenerateReciept";
                cmd.Parameters.AddRange(s);
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
