using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace DataAcessLayer
{
    public class ApplyPlanDAL
    {

        string connection = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter rd;
        /* Gets matched plans from records */
        public SqlDataAdapter MatchedPlans(SqlParameter[] s)
        {

            try
            {
                con = new SqlConnection(connection);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_ApplyPlan";
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
        public SqlDataAdapter GenerateForm(SqlParameter[] s)
        {
            try
            {
                con = new SqlConnection(connection);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_NominationPage";
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
        public int LinkPlan(SqlParameter[] s)
        {
            int i = 0;
            try
            {
                con = new SqlConnection(connection);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_IssuePlan";
                cmd.Parameters.AddRange(s);
                i = cmd.ExecuteNonQuery();
                con.Close();
            }
            catch
            {
                Console.WriteLine("Exception");
            }
            return i;
        }
    }
}
