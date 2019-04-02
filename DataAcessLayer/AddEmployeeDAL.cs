using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace DataAcessLayer
{
    public class AddEmployeeDAL
    {
        string connection = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter rd;
        public int insert_Employee(SqlParameter[] s)
        {
            try
            {
                con = new SqlConnection(connection);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "AddEmployee";
                cmd.Parameters.AddRange(s);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
                con.Close();
            }
            return 0;
        }

        public SqlDataAdapter GetEmployeeCredential(SqlParameter[] s)
        {

            try
            {
                con = new SqlConnection(connection);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_EmployeeCredentials";
                cmd.Parameters.AddRange(s);
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
        public SqlDataAdapter GetCity()
        {
            try
            {
                con = new SqlConnection(connection);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_GetCity";
                rd = new SqlDataAdapter(cmd);
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
