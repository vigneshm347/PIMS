using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace DataAcessLayer
{
    public class UserInfoDAL
    {
        string connection = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter rd;
        SqlDataAdapter rd1;
        public SqlDataAdapter GetInfo(SqlParameter[] s)
        {

            try
            {
                con = new SqlConnection(connection);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_PersonalInfo";
                cmd.Parameters.AddRange(s);
                rd = new SqlDataAdapter(cmd);
                con.Close();
            }
            catch
            {
                con.Close();
            }
            return rd;
            
        }
        public SqlDataAdapter GetPolInfo(SqlParameter[] s)
        {
            con = new SqlConnection(connection);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "usp_PolicyInfo";
            cmd.Parameters.AddRange(s);
            rd1 = new SqlDataAdapter(cmd);
            con.Close();
            return rd1;
        }
    }
}
