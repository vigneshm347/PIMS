using System.Diagnostics;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DataAcessLayer
{
    public class AddClaimDAL
    {
        bool inserted;
        string connection = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con;


        public bool insert_claim(SqlParameter[] s)
        {
            try
            {
                con = new SqlConnection(connection);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "usp_ClaimManager";
                cmd.Parameters.AddRange(s);
                if(cmd.ExecuteNonQuery() > 0) {
                    con.Close();
                    inserted = true;
                    
                }
                
                
            }
            catch(Exception ex)
            {
                Debug.WriteLine(ex.Message);
                inserted = false;
                con.Close();
            }
            return inserted;
        }
    }
}
