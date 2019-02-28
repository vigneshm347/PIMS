using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace DataAcessLayer
{
    public class UserAuthDAL
    {
        int i = 0;
        string connection = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con;
        public int UserLogin(SqlParameter[] s)
        {
            try
            {
                con = new SqlConnection(connection);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                /*Invoke SP to validate the user and return True or False*/
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_AuthUserInfo";
                cmd.Parameters.AddRange(s);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                i = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                con.Close();

            }
            catch
            {
                Console.WriteLine("Exception");
                con.Close();
            }
            return i;
        }
    }
}
